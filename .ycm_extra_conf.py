# Required/used by YouCompleteMe for cxx files

def FlagsForFile(filename, **kwargs):
    return {
        'flags': ['-x', 'c++11', '-Wall', '-Wextra', '-Werror'],
    }

