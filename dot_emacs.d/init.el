(require 'package)
(setq gc-cons-threshold 100000000)
;; (setq package-enable-at-startup nil)

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

(use-package bug-hunter
  :ensure t
  :defer 1
  :commands (bug-hunter-file bug-hunter-init-file))

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

(use-package dired-hide-dotfiles
  :ensure t
  :defer 3
  :after dired
  :config
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
  :defer 5
  )


;; 方便登录远程SSH
(use-package better-shell
  :ensure t
  :defer 5
  :bind (("C-'" . better-shell-shell)
         ("C-;" . better-shell-remote-open)))


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


;; (put 'dired-find-alternate-file 'disabled nil )

(setq initial-scratch-message ";; Hi Chandler! Today's is also a beautiful day~")

(use-package workgroups2
  :ensure t
  :bind (("<f8>" . wg-save-session)
         ("<f9>" . wg-reload-session))
  :init
  (setq wg-prefix-key (kbd "C-c w"))
  (setq wg-session-file "~/.emacs.d/.emacs_workgroups")
  (setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
  (setq wg-flag-modified t)                 ; Display modified flags as well
  (setq wg-mode-line-decor-left-brace "["
        wg-mode-line-decor-right-brace "]"  ; how to surround it
        wg-mode-line-decor-divider ":")

  ;; What to do on Emacs exit / workgroups-mode exit?
  (setq wg-emacs-exit-save-behavior           'nil)      ; Options: 'save 'ask nil
  (setq wg-workgroups-mode-exit-save-behavior 'nil)      ; Options: 'save 'ask nil
  (setq wg-session-load-on-start t)    ; default: (not (daemonp))

  ;; :config
  ;; (workgroups-mode 1)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-make-toc org-html-preview ox-html5slide org-ehtml org-preview-html ox-latex ob-ipython esup bug-hunter htmlize org-bullets org-evil wakatime-mode benchmark-init nodejs-repl company-web zenburn-theme doom-themes web-mode go-mode py-isort isortify smart-tabs-mode company-childframe company-posframe pyim linear-undo goto-last-change devdocs-search devdocs fill-column-indicator dockerfile-mode docker better-shell wgrep-ag wgrep ag erefactor dired-hide-dotfiles evil-magit evil-vimish-fold embrace workgroups2 ace-jump-mode evil-search-highlight-persist evil-nerd-commenter dumb-jump ranger counsel-projectile counsel-gtags tide cmake-mode cpputils-cmake ein flycheck-pycheckers highlight-defined aggressive-indent yasnippet-snippets format-all gtags flycheck-ycmd company-ycmd evil-smartparens treemacs-projectile treemacs-evil dashboard rich-minority spaceline linum-relative color-theme-approximate atom-one-dark-theme which-key vimrc-mode fzf evil-matchit diminish popwin hungry-delete evil-mc use-package)))
 '(shell-pop-full-span t)
 '(shell-pop-shell-type
   (quote
    ("ansi-term" "*ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:background "gold3" :foreground "black"))))
 '(company-preview-common ((t (:background "gold3" :foreground "grey20"))))
 '(company-preview-search ((t (:background "green4" :foreground "green"))))
 '(company-scrollbar-bg ((t (:background "#303030"))))
 '(company-scrollbar-fg ((t (:background "#404040"))))
 '(company-tooltip-annotation ((t (:foreground "gold"))))
 '(company-tooltip-annotation-selection ((t (:foreground "white"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white")))))


