#!/usr/bin/env python
# -*- coding: utf-8 -*-

import subprocess
import sys


def cmd_exist(cmd):
    return (subprocess.call(["command", "-v", cmd],
                            stderr=subprocess.PIPE,
                            stdout=subprocess.PIPE) == 0)


def install(cmd, packages):
    """
    :params cmd: list
    :params packages: list

    """
    print("Execute: ", cmd + packages)
    subprocess.call(cmd + packages)


def install_tmux():
    if cmd_exist("brew"):
        subprocess.call("brew install tmux", shell=True)
        return

    if cmd_exist("yum"):  # For centos
        subprocess.check_call(
            "yum install libevent-devel automake", shell=True)
    elif cmd_exist("apt"):
        subprocess.check_call(
            "apt install libevent-devel automake", shell=True)

    if cmd_exist("git"):
        subprocess.check_call(
            "git clone https://github.com/tmux/tmux.git tmux", shell=True)

    subprocess.check_call(
        "cd tmux && sh autogen.sh && ./configure && make", shell=True)

    subprocess.check_call("cp tmux/tmux /usr/local/bin", shell=True)
    subprocess.check_call("cd .. && rm -rf tmux", shell=True)


def install_ag():
    if cmd_exist("brew"):
        install(["brew install"], ["the_silver_searcher"])
    elif cmd_exist("apt"):
        install(["apt install"], ["silversearcher-ag"])
    elif cmd_exist("yum"):
        install(["yum install"], ["the_silver_searcher"])


def install_python_formatter():
    cmd = ["pip3", "install"]
    packages = ["black", "yapf", "isort"]
    install(cmd, packages)


def install_prettier():
    cmd = ["npm", "install", "--global"]
    packages = ["prettier"]
    install(cmd, packages)


def install_clang_format():
    if cmd_exist("brew"):
        install(["brew install"], ["clang-format"])
    elif cmd_exist("apt"):
        install(["apt install"], ["clang-format"])
    elif cmd_exist("yum"):
        install(["yum install"], ["centos-release-scl"])
        install(["yum install"], ["llvm-toolset-7"])
        # enable : scl enable llvm-toolset-7 bash
        # clang-format is in /opt/rh/llvm-toolset-7/bin


def install_ranger():
    install(["pip3 install"], ["ranger-fm"])


def main():
    if len(sys.argv) > 1:
        if sys.argv[1] == "ag":
            install_ag()
        elif sys.argv[1] == "tmux":
            install_tmux()
        elif sys.argv[1] == "python_formatter":
            install_python_formatter()
        elif sys.argv[1] == "prettier":
            install_prettier()
        elif sys.argv[1] == "clang-format":
            install_clang_format()
        elif sys.argv[1] == "all":
            install_ag()
            install_python_formatter()
            install_prettier()
            install_clang_format()
    else:
        print("""Scrpits to install useful tools.
    usage:
            tmux
            ag
            python_formatter
            prettier
            clang-format
            ranger

            all                 --install all above

            """)


if __name__ == "__main__":
    main()
