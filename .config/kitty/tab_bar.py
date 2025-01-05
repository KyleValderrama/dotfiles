import datetime
import json
import subprocess
from collections import defaultdict

from kitty.boss import get_boss
from kitty.fast_data_types import Screen, add_timer
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    Formatter,
    TabBarData,
    as_rgb,
    draw_attributed_string,
    draw_tab_with_powerline,
    draw_title
)
from pathlib import Path
from pygit2 import Repository

timer_id = None

def get_active_branch_name(path: str) -> str:
    try:
        return Repository(path).head.shorthand
    except:
        return ''

def get_color(line_number) -> int:
    rgb = 0
    try:
        with open("/home/kyle/.cache/wal/colors", 'r') as file:
            lines = file.readlines()
            if line_number <= 0 or line_number > len(lines):
                return rgb
            else:
                hex_string = lines[line_number - 1].strip()
                hex_string = hex_string[1:]

                rgb = int(hex_string, 16)

    except FileNotFoundError:
        return rgb
    except Exception as e:
        return rgb

    return rgb



def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    global timer_id

    # draw_tab_with_powerline(
    #     draw_data, screen, tab, before, max_title_length, index, is_last, extra_data
    # )
    cwd = get_boss().active_tab_manager.active_window.cwd_of_child or ''
    screen.cursor.bg = as_rgb(int(draw_data.active_bg))
    screen.cursor.fg = as_rgb(get_color(1))
    screen.draw(f" 󰋜 ")

    screen.cursor.fg = as_rgb(int(draw_data.default_bg))

    path = cwd.replace("/home/kyle", "")

    if path != '':
        path = path[1:]
        screen.cursor.fg = as_rgb(int(draw_data.default_bg))
        screen.draw(f"\ue0b1")

    dirs = path.split("/")
    for idx, dir in enumerate(dirs):
        if dir != '':
            screen.cursor.fg = as_rgb(get_color(1))
            screen.draw(f" {dir} ")
        if idx != len(dirs) - 1:
            screen.cursor.fg = as_rgb(int(draw_data.default_bg))
            screen.draw(f"\ue0b1")


    screen.cursor.fg = as_rgb(int(draw_data.active_bg))
    screen.cursor.bg = as_rgb(int(draw_data.default_bg))
    screen.draw(f"\ue0b0")



    if is_last:
        draw_right_status(draw_data, screen)

    return screen.cursor.x


def draw_right_status(draw_data: DrawData, screen: Screen) -> None:
    # The tabs may have left some formats enabled. Disable them now.
    cells = create_cells()
    # Drop cells that wont fit
    while True:
        if not cells:
            return
        padding = screen.columns - screen.cursor.x - sum(len(c["text"]) + 3 for c in cells) + (len(cells) - 1)
        if padding >= 0:
            break
        cells = cells[0:]

    if padding:
        screen.draw(" " * padding)

    tab_bg = as_rgb(int(draw_data.active_bg))
    tab_fg = as_rgb(int(draw_data.active_fg))
    default_bg = as_rgb(int(draw_data.default_bg))
    for cell in cells:
        # Draw the separator
        if cell == cells[0]:
            screen.cursor.fg = tab_bg
            screen.draw(" ")

        screen.cursor.fg = cell['fg']
        screen.draw(f" {cell['text']} ")


def create_cells() -> list[dict]:
    now = datetime.datetime.now()
    cwd = get_boss().active_tab_manager.active_window.cwd_of_child or ''
    list = []

    list.append({
      "text": now.strftime("%I:%M %p"),
      "fg": as_rgb(get_color(9))
    })

    branch = get_active_branch_name(cwd)

    if branch != '':
        list.insert(0, {
            "text": f" {branch}",
            "fg": as_rgb(get_color(7))
        })

    return list


def _redraw_tab_bar(timer_id):
    for tm in get_boss().all_tab_managers:
        tm.mark_tab_bar_dirty()
