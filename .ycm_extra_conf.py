# Required/used by YouCompleteMe for cxx files

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
        ],
    }

