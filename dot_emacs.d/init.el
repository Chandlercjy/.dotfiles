
(require 'package )
(setq gc-cons-threshold 100000000)
(setq package-enable-at-startup nil)

(add-to-list 'load-path "~/.emacs.d/lisp")

;; (add-to-list 'package-archives '("MELPA-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
(add-to-list 'package-archives '("Marmalad" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")
             t)
(add-to-list 'package-archives '("Org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; (package-refresh-contents)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

(use-package benchmark-init
  :ensure t
  :init
  (benchmark-init/activate)
  :hook
  (after-init . benchmark-init/deactivate))

(require 'init-packages)
(require 'init-ui)
(require 'init-func)
(require 'init-programming)
(require 'init-languages)
(require 'init-keybindings)
(require 'init-org)
(require 'init-better-default)
(require 'init-personal)


(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))
(load-file custom-file)

(setq-default evil-insert-state-cursor 'bar)
(setq-default cursor-type '(hbar . 1))




(use-package dired-hide-dotfiles
  :ensure t
  :after dired
  :config
  (dired-hide-dotfiles-mode)
  (define-key dired-mode-map "." #'dired-hide-dotfiles-mode)
  (add-hook 'dired-mode-hook #'dired-hide-dotfiles-mode)
  )



(use-package erefactor
  :ensure t
  :config
  (global-set-key (kbd "<f6>") 'erefactor-rename-symbol-in-buffer)
  )

(use-package ag
  :ensure t
  :after evil evil-mc
  :config
  (evil-set-initial-state 'ag-mode 'normal)
  (define-key ag-mode-map "h" 'evil-backward-char)
  (define-key ag-mode-map "k" 'evil-previous-line)
  (define-key ag-mode-map "n" 'evil-search-next)
  )

(use-package wgrep
  :ensure t)

(use-package wgrep-ag
  :ensure t
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
  :bind ("C-c d" . docker)
  :config
  (evil-set-initial-state 'docker-container-mode 'emacs)
  (evil-set-initial-state 'docker-image-mode 'emacs)
  )

(use-package dockerfile-mode
  :ensure t
  :mode ("\Dockerfile.*\\'" . dockerfile-mode)
  )


(put 'dired-find-alternate-file 'disabled nil )

(setq initial-scratch-message ";; Hi Chandler! Today's is also a beautiful day~")


