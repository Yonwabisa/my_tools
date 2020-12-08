from os import system as do

do('pip3 install -Uq pyautogui')

from sys import argv
from pathlib import Path as path
from pyautogui import typewrite, hotkey
import pyautogui as coder
from random import randint
from time import sleep


def get_code() -> list:

    argv_file = path(path(argv[1]).stem + '.py')
    if argv_file.exists():
        with open(str(argv_file)) as f:
            code = f.readlines()
        return code
    print('Sorry, that file does not exist')


def open_editor(directory: str, editor='vim', wait_time=1.8) -> None:
    '''
    param directory: The directory to store the copied code

    param editor: The text editor of choice to use

    param wait_time: The time in seconds to wait for the text editor to open
    '''

    if path(directory).expanduser().exists():
        typewrite(f'cd {directory}\n', interval=0.2)
    else: typewrite('cd\n', interval=0.2)

    typewrite(f'{editor} code_my_way.py\n', interval=0.1)

    #Wait for text editor to load
    sleep(wait_time)

    #Enter vim insert mode
    if editor == 'vim': typewrite('i\n')


def write_code(code) -> None:

    for index, line in enumerate(code):
        #typing_speed = 1 / randint(4, 24)
        typing_speed = 1 / randint(24, 34)
        line_length = len(line)
        if line_length > 3:
            momentum_break = randint(2, line_length)

            #if True, break momentum
            if randint(False, True):

                first_line_half = line[:momentum_break]
                second_line_half = line[momentum_break:]

                #write first part of line
                typewrite(first_line_half, interval=typing_speed)

                #if code is in the mid to late stages
                #thinking time increases
                if index > 3:
                    thinking_time = randint(3, index)
                else:
                    thinking_time = index

                # Think for n seconds. (Dependent on complexity)
                sleep(thinking_time)

                #Write  second part of code
                if typing_speed - 0.2 > 0: typing_speed -= 0.2
                typewrite(second_line_half, interval=typing_speed)
                continue

        typewrite(line, interval=typing_speed)

if __name__ == '__main__':
    if not len(argv) > 1: print('Enter a python file in argv[1]')
    else:
        code = get_code()
        open_editor('~')
        write_code(code)
