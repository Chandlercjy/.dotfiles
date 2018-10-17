
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;            Packages 相关            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package evil
  :ensure t
  :defer 1
  :bind (
         :map evil-normal-state-map
         ("C-u" . evil-scroll-up)
         ("<SPC> e" . open-my-emacs-init-file)
         ("<SPC> v" . open-my-vim-init-file)
         ("<SPC> r" . reload_init_config_file)
         ("<SPC> u" . undo-tree-visualize)
         ("<SPC> o" . counsel-fzf)
         (",cd" . back_to_current_dir)
         (",g" . ycmd-goto)
         (",d" . dumb-jump-go)
         (",b" . dumb-jump-back)
         ("<SPC> yf" . ycmd-fixit)
         (",f" . format-all-buffer)
         ("C-c i" . package-install)
         ("<SPC> a" . counsel-ag)
         ("<SPC> b" . counsel-ibuffer)
         ("<SPC> f" . counsel-fzf)
         ("<SPC> ]" . flycheck-next-error)
         ("<SPC> [" . flycheck-previous-error)
         (",l" . flycheck-list-errors)
         ("<f7>" . flycheck-mode)
         (",y" . chandler/toggle-copy-to-osx)

         (",cc" . evilnc-comment-or-uncomment-lines)

         ("<SPC> h" . evil-search-highlight-persist-remove-all)

         ;; 添加括号
         ("t" . embrace-commander)

         ;; workgroups
         ( "<SPC> 0" . wg-switch-to-workgroup-at-index-0)
         ( "<SPC> 1" . wg-switch-to-workgroup-at-index-1)
         ( "<SPC> 2" . wg-switch-to-workgroup-at-index-2)
         ( "<SPC> 3" . wg-switch-to-workgroup-at-index-3)
         ( "<SPC> 4" . wg-switch-to-workgroup-at-index-4)
         ( "<SPC> 5" . wg-switch-to-workgroup-at-index-5)
         ( "<SPC> 6" . wg-switch-to-workgroup-at-index-6)
         ( "<SPC> 7" . wg-switch-to-workgroup-at-index-7)
         ( "<SPC> 8" . wg-switch-to-workgroup-at-index-8)
         ( "<SPC> 9" . wg-switch-to-workgroup-at-index-9)
         ( "<SPC> `" . wg-switch-to-workgroup)
         ( "<SPC> -" . wg-kill-workgroup)
         ( "<SPC> +" . wg-create-workgroup)

         ;; 跳转
         ("f" . ace-jump-char-mode)
         ("C-w e" . ace-swap-window)
         ("C-w w" . ace-select-window)

         :map evil-insert-state-map
         ("\C-a" . company-yasnippet)

         :map evil-visual-state-map
         (",cc" . evilnc-comment-or-uncomment-lines)
         (",cp" . evilnc-comment-or-uncomment-paragraphs)

         ;; 同时都有的
         :map evil-normal-state-map
         ("RET" . er/expand-region)
         :map evil-visual-state-map
         ("RET" . er/expand-region)
         )
  :hook (prog-mode . evil-mode)
  :config
  (evil-add-hjkl-bindings recentf-dialog-mode-map 'emacs)
  (evil-add-hjkl-bindings package-menu-mode-map 'emacs)

  (setq-default evil-insert-state-cursor 'bar)
  (evil-set-initial-state 'ivy-occur-grep-mode 'normal)
  (evil-set-initial-state 'ag-mode 'normal)
  )

(use-package ivy
  :ensure t
  :defer 1
  :bind (("C-c C-r" . ivy-resume))
  :config
  (ivy-mode 1)
  (autoload 'cmake-project-mode "cmake-project" nil t)
  )

(use-package counsel
  :ensure t
  :defer 1
  :bind (
         ("C-x C-r" . counsel-recentf)
         ("M-x" . counsel-M-x)
         ("M-y" . counsel-yank-pop)
         ("C-c G" . counsel-git-grep)
         ("C-c m" . counsel-imenu)
         :map ivy-minibuffer-map
         ("<tab>" . ivy-alt-done)
         ("<escape>" . minibuffer-keyboard-quit)
         ("C-r" . counsel-minibuffer-history)))

(use-package swiper
  :ensure t
  :defer 3
  :bind(
        ("C-s" . swiper))
  )

(use-package counsel-gtags
  :ensure t
  :defer 1
  )

(use-package counsel-projectile
  :ensure t
  :defer 3
  :after projectile
  :hook (prog-mode . counsel-projectile-mode)
  )

(use-package ranger
  :ensure t
  :defer 2
  :config
  (global-set-key (kbd "C-c r") 'ranger)
  )

(use-package dumb-jump
  :ensure t
  :defer 1
  :bind (
         ("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g b" . dumb-jump-back)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window)
         )
  :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  )


(use-package evil-nerd-commenter
  :ensure t
  :defer 1
  )

;; 高亮搜索
(use-package evil-search-highlight-persist
  :ensure t
  :defer 5
  :config
  (global-evil-search-highlight-persist t)
  )

(use-package ace-window
  :ensure t
  :defer 3
  )


(use-package ace-jump-mode
  :ensure t
  :commands ace-jump-mode
  )


(use-package workgroups2
  :ensure t
  :defer 0.01
  :bind (("<f8>" . wg-save-session)
         ("<f9>" . wg-reload-session))
  :init
  (setq wg-prefix-key (kbd "C-c w"))
  (setq wg-session-file "~/.emacs.d/.emacs_workgroups")
  (setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
  (setq wg-flag-modified t)                 ; Display modified flags as well
  (setq wg-mode-line-decor-left-brace "<<<<<<<<<<<<<<<"
        wg-mode-line-decor-right-brace "]"  ; how to surround it
        wg-mode-line-decor-divider ":")
  ;; What to do on Emacs exit / workgroups-mode exit?
  ;; (setq wg-emacs-exit-save-behavior           'save)      ; Options: 'save 'ask nil
  ;; (setq wg-workgroups-mode-exit-save-behavior 'save)      ; Options: 'save 'ask nil
  ;; (wg-reload-session)
  :config
  (workgroups-mode)
  )

(use-package embrace
  :ensure t
  :defer 3
  )


(use-package  expand-region
  :ensure t
  :defer 3
  :config
  (setq expand-region-fast-keys-enabled nil)
  )


(use-package evil-vimish-fold
  :ensure t
  :defer 5
  :config
  (evil-vimish-fold-mode 1))


(global-set-key (kbd "C-x g") 'magit)
;; (global-set-key (kbd "<f1>") 'which-key-show-keymap)
(global-set-key (kbd "<f1>") 'benchmark-init/show-durations-tree)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;               系统相关             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0 ;;移动窗口快捷键 仿vim
(global-set-key (kbd "<C-w> k") 'windmove-up)
(global-set-key (kbd "<C-w> j") 'windmove-down)
(global-set-key (kbd "<C-w> h") 'windmove-left)
(global-set-key (kbd "<C-w> l") 'windmove-right)

;; 查找函数
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 编译
(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; (global-set-key (kbd "\C-c t") 'toggle-truncate-lines)

(provide 'init-keybindings)
