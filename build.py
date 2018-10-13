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
        print(f"检测不到 {neovim_dir.parent}, 已新建该文件夹。")

    if is_exist(neovim_dir):
        move_to_backup(neovim_dir)
        print(f"{neovim_dir} 已存在, 进行备份，添加后缀为bak。")

    if create_link("~/.dotfiles/nvim", neovim_dir):
        print("Neovim 链接创建成功!")
    os.system("nvim -c PlugInstall -c wqa!")
    print("Neovim 插件更新成功!")

    # Link Emacs

    if is_exist(emacs_dir):
        move_to_backup(emacs_dir)
        print(f"{emacs_dir} 已存在, 进行备份，添加后缀为bak。")

    if create_link("~/.dotfiles/dot_emacs.d", emacs_dir):
        print("Emacs 链接创建成功!")


if __name__ == "__main__":
    main()
