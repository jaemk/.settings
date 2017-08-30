# Required/used by YouCompleteMe for cxx files
import os

BOOST_ROOT = os.environ.get("BOOST_ROOT")
BOOST_INCLUDE = BOOST_LIB = ''
if BOOST_ROOT:
    BOOST_INCLUDE = '-I' + BOOST_ROOT
    BOOST_LIB = '-L' + os.path.join(BOOST_ROOT, 'stage', 'lib')

def FlagsForFile(filename, **kwargs):
    return {
        'flags': [
            '-Wall',
            '-Wextra',
            '-Werror',
            '-std=c++11',
            '-stdlib=libc++',
            '-x',
            'c++',
            BOOST_INCLUDE,
            BOOST_LIB,
        ],
    }

