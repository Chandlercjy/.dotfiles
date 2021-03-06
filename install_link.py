#!/usr/bin/env python3

import os
import subprocess
from pathlib import Path, PurePath

HOME_DIR = PurePath(os.path.expanduser("~"))
COUNT = 0


def is_exist(dir_path):
    return Path(dir_path).exists()


def create_link(obj_path, link_path):
    cmd = ["ln", "-s", str(obj_path), str(link_path)]
    return not subprocess.getstatusoutput(cmd)[1]


def move_to_backup(path):
    path = str(path)
    cmd = ["mv", path, path + ".bak"]
    return not subprocess.getstatusoutput(cmd)[1]


def clear_link(path):
    if Path(path).is_symlink():
        subprocess.call(["rm", str(path)])


def create_link_or_bak(config_path, obj_path):
    clear_link(obj_path)
    cmd = ["ln", "-s", str(config_path), str(obj_path)]
    try:
        subprocess.check_output(cmd)
        print(f"{obj_path} Link successfully!!")
    except:
        bak = str(obj_path) + ".bak"
        subprocess.call(["mv", str(obj_path), bak])
        print(f"{obj_path} is Exist!，rename to {bak}")
        create_link_or_bak(config_path, obj_path)


def link_neovim():
    neovim_dir = HOME_DIR / ".config" / "nvim"
    config_dir = HOME_DIR / ".dotfiles" / "nvim_mini"
    if not is_exist(neovim_dir.parent):
        os.mkdir(neovim_dir.parent)  # create ~/.config
        print(f"Establishing {neovim_dir.parent}.")

    create_link_or_bak(config_dir, neovim_dir)


def link_emacs():
    emacs_dir = HOME_DIR / ".emacs.d"
    if is_exist(emacs_dir):
        move_to_backup(emacs_dir)
        print(f"Backup old config:  {emacs_dir} to {emacs_dir}.bak ")
    if create_link("~/.dotfiles/dot_emacs.d", emacs_dir):
        print("Link Emacs dotfile successed!")


def install_xterm24():
    script_path = HOME_DIR / ".dotfiles" / "dot_terminfo" / "setup.sh"
    cmd = ["/bin/bash", script_path]
    subprocess.call(cmd)
    print("Term=xterm-24bits installed successfully!")


def link_tmux():
    tmux_path = HOME_DIR / ".tmux.conf"
    config_path = HOME_DIR / ".dotfiles" / "dot_tmux.conf"
    create_link_or_bak(config_path, tmux_path)


def link_prettierrc():
    prettierrc_path = HOME_DIR / ".prettierrc"
    config_path = HOME_DIR / ".dotfiles" / "dot_prettierrc"
    create_link_or_bak(config_path, prettierrc_path)


def add_source_shell():
    zshrc_path = os.path.expanduser("~") + "/.zshrc"
    mark = "added by dotfiles!"
    mac_sed_cmd = ["sed", "-i", "", f"/{mark}/d", zshrc_path]
    sed_cmd = ["sed", "-i", f"/{mark}/d", zshrc_path]
    subprocess.Popen(sed_cmd, stderr=subprocess.PIPE).wait()
    subprocess.Popen(mac_sed_cmd, stderr=subprocess.PIPE).wait()
    script = f"source ~/.dotfiles/init-shell.sh # {mark}"
    with open(zshrc_path, "a") as file:
        file.write(f"# Shell Initialization {mark}\n")
        file.write(script)
    print(f"Add source to {zshrc_path} successfully!")


def main():
    link_neovim()
    #  link_emacs()
    install_xterm24()
    link_tmux()
    link_prettierrc()
    add_source_shell()


if __name__ == "__main__":
    print("======= Start to link Chandler's dotfiles!! =======")
    main()
    print("======= Enjoy Chandler's dotfiles!! ===============")
