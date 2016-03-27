#!/usr/bin/python3

from subprocess import CalledProcessError
from subprocess import check_output
from subprocess import call


def get_proc_name(proc):
    """
    Get process name by pid
    
    :param proc: process pid number
    :type proc: int
    :return: formatted string
    :rtype: str/unicode
    """
    return check_output(['ps', 'p', str(proc), 'o', 'comm=']).decode('utf-8').strip('\n')


def main():
    try:  # Look for 'vpn' processes
        pgrep = check_output(['pgrep', 'vpn']).decode('utf-8')
    except CalledProcessError:
        print('\nNo vpn processes running...')
        return
    
    # convert pgrep string to list of (pid, pname)
    procs = [(int(p.strip()), get_proc_name(p)) for p in pgrep.split('\n') if p]
    
    # filter procs to make sure this file isn't included
    this_file = __file__.split('/')[-1]
    procs = [p for p in procs if p[-1] != this_file]
    
    print('\nFound {} VPN processes running...'.format(len(procs)))
    for proc in procs:
        pid, pname = proc
        ans = input('     --> Kill proc: {}, {}? (y/n)$ '.format(pid, pname)).strip()
        if ans.lower() == 'y':
            print('           killing ...')
            if call(['kill', str(pid)]) == 0:
                print('           Successfully killed {}:{}'.format(pid, pname))
            else:
                print('           Something went wrong, try again with sudo...')
                return
        else:
            print('           skipping...')


if __name__ == '__main__':
    main()

