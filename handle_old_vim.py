import subprocess
import re

def vim_version():
    version_line = subprocess.check_output(['vim', '--version']).split('\n')[0]
    return re.findall('proved ([0-9])+\.([0-9]+)', version_line)[0]

def main():
    version = vim_version()
    if versions[0] < 7 or versions[1] < 4:
        subprocess.call(['make', '-f', 'Makefile.old'])
    subprocess.call(['touch', '.check_vim_version'])

if __name__ == '__main__':
    main()

