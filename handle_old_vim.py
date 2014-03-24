from subprocess import call, check_output
from re import findall

def main():
    vim_version = check_output(['vim', '--version']).split('\n')[0]
    versions = findall('proved ([0-9])+\.([0-9]+)', vim_version)[0]
    if versions[0] < 7 or versions[1] < 4:
        call(['make', '-f', 'Makefile.old'])
    call(['touch', '.check_vim_version'])

if __name__ == '__main__':
    main()

