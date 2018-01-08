##~ YouCompleteMe cxx config

import os
import json


# Look for boost
BOOST_ROOT = os.environ.get("BOOST_ROOT")
BOOST_INCLUDE = BOOST_LIB = ''
if BOOST_ROOT:
    BOOST_INCLUDE = '-I' + BOOST_ROOT
    BOOST_LIB = '-L' + os.path.join(BOOST_ROOT, 'stage', 'lib')

# Set default flags
DEFAULT_FLAGS = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Warray-bounds',
    '-Wpedantic',
    '-I/usr/include',
    '-I/usr/lib',
    '-I/usr/local/include',
    '-I/usr/local/lib',
    '-Iinclude/',
    '-Llibs/',
]

C_FLAGS = [
    '-std=c99',
    '-x',
    'c',
]

CPP_FLAGS = [
    '-std=c++11',
    '-stdlib=libc++',
    '-x',
    'c++',
    BOOST_INCLUDE,
    BOOST_LIB,
]


def _find_cmake_dir(dir_):
    """Walk up the fs, looking for a dir containing a CMakeLists.txt file"""
    if os.path.isfile(os.path.join(dir_, "CMakeLists.txt")):
        return dir_

    parent = os.path.dirname(dir_)
    if parent == dir_:
        return

    return _find_cmake_dir(parent)


def _load_cmake_compile_flags(dir_):
    """Look for cmake output file and return any extra compile-commands found"""
    compile_commands_file = os.path.join(dir_, "compile_commands.json")
    if not os.path.isfile(compile_commands_file):
        return

    with open(compile_commands_file, 'r') as f:
        try:
            compile_commands = json.load(f)[0]['command']
            return [f for f in compile_commands.split(' ') if f]
        except:
            return


def FlagsForFile(filename, **kwargs):
    if filename.endswith('.cpp'):
        flags = CPP_FLAGS
    elif filename.endswith('.c'):
        flags = C_FLAGS
    else:
        flags = []
    flags.extend(DEFAULT_FLAGS)

    cmake_dir = _find_cmake_dir(os.path.dirname(filename))
    if cmake_dir:
        cmake_flags = _load_cmake_compile_flags(cmake_dir)
        if cmake_flags:
            flags.extend(cmake_flags)

    return {
        'flags': flags,
    }


if __name__ == '__main__':
    import sys
    args = sys.argv[1:]
    f = ''
    if args:
        f = args[0]
    print(FlagsForFile(f))

