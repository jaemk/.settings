# fix repl when python is compiled without libreadline-dev package
import os

env_keys = os.environ.keys()
if 'VIRTUAL_ENV' not in env_keys:
    import readline
    import rlcompleter
    readline.parse_and_bind('tab: complete')
