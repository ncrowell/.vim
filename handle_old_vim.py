import sys

import subprocess
import re

def main():
    try:
        vim_version = subprocess.check_output(['vim', '--version']).split('\n')[0]
    except subprocess.CalledProcessError as e:
        raise Exception("Where is vim!?!", e)
    versions = re.findall('proved ([0-9])+\.([0-9]+)', vim_version)[0]
    try:
        if versions[0] < 7 or versions[1] < 4:
            subprocess.call(['make', '-f', 'Makefile.old'])
    except IndexError as e:
        print versions
        sys.exit(1)
    subprocess.call(['touch', '.check_vim_version'])

if __name__ == '__main__':
    main()

