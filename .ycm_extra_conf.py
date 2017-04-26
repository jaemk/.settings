# Required/used by YouCompleteMe for cxx files

def FlagsForFile(filename, **kwargs):
    return {
        'flags': ['-x', 'c++', '-Wall', '-Wextra', '-Werror'],
    }

