(require 'package)
(setq gc-cons-threshold 100000000)
(setq package-enable-at-startup nil)

;; (add-to-list 'package-archives '("MELPA-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
(add-to-list 'package-archives '("Marmalad" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/") t)
(add-to-list 'package-archives '("Org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
;; (package-refresh-contents)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

;; 用来调试启动时间
(use-package benchmark-init
  :ensure t
  :bind ( "<f1>" . benchmark-init/show-durations-tree)
  :init
  (benchmark-init/activate)
  :hook
  (after-init . benchmark-init/deactivate))


;; Chandler 传说中炫酷的配置
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'init-packages)
(require 'init-keybindings)
(require 'init-ui)
(require 'init-func)
(require 'init-programming)
(require 'init-languages)
(require 'init-org)
(require 'init-better-default)
(require 'init-personal)
(require 'init-custom)

(setq-default cursor-type '(hbar . 1))


(use-package dired-hide-dotfiles
  :ensure t
  :defer 3
  :after dired
  :config
  (dired-hide-dotfiles-mode)
  (define-key dired-mode-map "." #'dired-hide-dotfiles-mode)
  (add-hook 'dired-mode-hook #'dired-hide-dotfiles-mode)
  )

(use-package erefactor
  :ensure t
  :defer 3
  :bind ("<f6>" . erefactor-rename-symbol-in-buffer)
  )

(use-package ag
  :ensure t
  :defer 3
  :after evil
  :bind(:map ag-mode-map
             ("h" . evil-backward-char)
             ("k" . evil-previous-line)
             ("n" . evil-search-next)
             )
  )

(use-package wgrep
  :ensure t
  :defer 3
  )

(use-package wgrep-ag
  :ensure t
  :defer 3
  :after wgrep ag
  )


;; 方便登录远程SSH
(use-package better-shell
  :ensure t
  :bind (("C-'" . better-shell-shell)
         ("C-;" . better-shell-remote-open)))

;; (spaceline-define-segment spaceline-workgroups2-segment 'wg-mode-line-string)

;; (spaceline-define-segment my-segment-left-1 "My first left segment." "Hello, World (LEFT 1)!")
;; (spaceline-define-segment my-segment-left-2 "My second left segment." "Hello, World (LEFT 2)!")
;; (spaceline-define-segment my-segment-right-1 "My first right segment." "Hello, World (RIGHT 1)!")
;; (spaceline-define-segment my-segment-right-2 "My second right segment." "Hello, World (RIGHT 2)!")
;; (spaceline-compile "my-modeline" '(spaceline-wokgroup2-segment my-segment-left-2) '(my-segment-right-1 my-segment-right-2))
;; (setq mode-line-format '("%e" (:eval (spaceline-ml-my-modeline))))


(use-package docker
  :ensure t
  :defer 5
  :bind ("C-c d" . docker)
  :config
  (evil-set-initial-state 'docker-container-mode 'emacs)
  (evil-set-initial-state 'docker-image-mode 'emacs)
  )

(use-package dockerfile-mode
  :ensure t
  :defer 5
  :mode ("\Dockerfile.*\\'" . dockerfile-mode)
  )


(put 'dired-find-alternate-file 'disabled nil )

(setq initial-scratch-message ";; Hi Chandler! Today's is also a beautiful day~")
