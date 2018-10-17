import os
from pathlib import Path, PurePath

home_dir = PurePath(os.path.expanduser("~"))
neovim_dir = home_dir / ".config" / "nvim"
emacs_dir = home_dir / ".emacs.d"


def is_exist(dir_path):
    return Path(dir_path).exists()


def create_link(obj_path, link_path):
    os.chdir(link_path.parent)
    return not os.system(f"ln -s {str(obj_path)} {link_path.name}")


def move_to_backup(path):
    path = str(path)

    return not os.system(f"mv {path} {path}.bak")


def main():
    # Link neovim

    if not is_exist(neovim_dir.parent):
        os.mkdir(neovim_dir.parent)
        print(f"Establishing {neovim_dir.parent}.")

    if is_exist(neovim_dir):
        move_to_backup(neovim_dir)
        print(f"Backup old config:  {neovim_dir} to {neovim_dir}.bak ")

    if create_link("~/.dotfiles/nvim", neovim_dir):
        print("Neovim 链接创建成功!")
    print("Link Neovim dotfile successed!")

    # Link Emacs
    if is_exist(emacs_dir):
        move_to_backup(emacs_dir)
        print(f"Backup old config:  {emacs_dir} to {emacs_dir}.bak ")
    if create_link("~/.dotfiles/dot_emacs.d", emacs_dir):
        print("Link Emacs dotfile successed!")

    print("Copy Emacs diy elpa packages successed!")
    os.system("mkdir ~/.dotfiles/dot_emacs.d/elpa")
    os.system("cp ~/.dotfiles/emacs_diy_elpa/* ~/.dotfiles/dot_emacs.d/elpa")

    # settle Term Xterm24
    os.system("/bin/bash ~/.dotfiles/dot_terminfo/setup.sh")
    print("Term=xterm-24bits has been settled!")


if __name__ == "__main__":
    print("======= Start to link Chandler's dotfiles!! =======")
    main()
    print("======= Enjoy Chandler's dotfiles!! ===============")
