
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;            Packages 相关            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (evil-set-initial-state 'ivy-occur-grep-mode 'normal)
  (autoload 'cmake-project-mode "cmake-project" nil t)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  )


(use-package counsel
  :ensure t
  :bind
  (
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
  :config
  (global-set-key (kbd "C-s") 'swiper)
  )

(use-package counsel-gtags
  :ensure t
  :after counsel gtags
  )

(use-package counsel-projectile
  :ensure t
  :after counsel projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (add-hook 'after-init-hook #'counsel-projectile-mode)
  )

(use-package ranger
  :ensure t
  :config
  (global-set-key (kbd "C-c r") 'ranger)
  )

(use-package dumb-jump
  :ensure t
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


(use-package evil
  :ensure t
  :config (evil-mode 1)
  (evil-add-hjkl-bindings recentf-dialog-mode-map 'emacs)
  (evil-add-hjkl-bindings package-menu-mode-map 'emacs)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-normal-state-map (kbd "<SPC> e") 'open-my-emacs-init-file)
  (define-key evil-normal-state-map (kbd "<SPC> v") 'open-my-vim-init-file)

  (define-key evil-normal-state-map (kbd "<SPC> r") 'reload_init_config_file)
  (define-key evil-normal-state-map (kbd "<SPC> u") 'undo-tree-visualize)
  (define-key evil-normal-state-map (kbd "<SPC> o") 'counsel-fzf)
  (define-key evil-normal-state-map ",cd" 'back_to_current_dir)

  ;; (define-key evil-normal-state-map (kbd "<SPC> gd") 'counsel-gtags-find-definition)
  ;; (define-key evil-normal-state-map (kbd "<SPC> gr") 'counsel-gtags-find-reference)
  (define-key evil-normal-state-map (kbd ",g") 'ycmd-goto)

  (define-key evil-normal-state-map ",d" 'dumb-jump-go)
  (define-key evil-normal-state-map ",b" 'dumb-jump-back)
  (define-key evil-normal-state-map (kbd "<SPC> yf") 'ycmd-fixit)
  (define-key evil-normal-state-map ",f" 'format-all-buffer)

  (define-key evil-normal-state-map (kbd "C-c i") 'package-install)


  (define-key evil-normal-state-map (kbd "<SPC> a") 'counsel-ag)
  (define-key evil-normal-state-map (kbd "<SPC> b") 'counsel-ibuffer)
  (define-key evil-normal-state-map (kbd "<SPC> f") 'counsel-fzf)

  (define-key evil-normal-state-map (kbd "<SPC> ]") 'flycheck-next-error)
  (define-key evil-normal-state-map (kbd "<SPC> [") 'flycheck-previous-error)
  (define-key evil-normal-state-map (kbd ",l") 'flycheck-list-errors)
  (define-key evil-normal-state-map (kbd "<f7>") 'flycheck-mode)


  (define-key evil-normal-state-map ",y" 'chandler/toggle-copy-to-osx)

  (define-key evil-insert-state-map "\C-a" 'company-yasnippet)
  )

(use-package evil-nerd-commenter
  :ensure t
  :after evil
  :config
  (define-key evil-visual-state-map ",cc" 'evilnc-comment-or-uncomment-lines)
  (define-key evil-normal-state-map ",cc" 'evilnc-comment-or-uncomment-lines)
  (define-key evil-normal-state-map ",cp" 'evilnc-comment-or-uncomment-paragraphs)
  )

;; 高亮搜索
(use-package evil-search-highlight-persist
  :ensure t
  :after evil
  :config
  (global-evil-search-highlight-persist t)
  (define-key evil-normal-state-map (kbd "<SPC> h") 'evil-search-highlight-persist-remove-all)
  )

(use-package ace-window
  :ensure t
  :config
  ;; (define-key evil-normal-state-map "t" 'ace-jump-char-mode)
  (define-key evil-normal-state-map (kbd "C-w e") 'ace-swap-window)
  (define-key evil-normal-state-map (kbd "C-w w") 'ace-select-window)
  )


(use-package ace-jump-mode
  :ensure t
  :after evil
  :config
  ;; (define-key evil-normal-state-map "t" 'ace-jump-char-mode)
  (define-key evil-normal-state-map "f" 'ace-jump-char-mode)
  )


(use-package workgroups2
  :ensure t
  :config
  (setq wg-prefix-key (kbd "C-c w"))
  (setq wg-session-file "~/.emacs.d/.emacs_workgroups")
  (add-hook 'after-init-hook #'workgroups-mode)
  (setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
  (setq wg-flag-modified t)                 ; Display modified flags as well
  (setq wg-mode-line-decor-left-brace "<<<<<<<<<<<<<<<"
        wg-mode-line-decor-right-brace "]"  ; how to surround it
        wg-mode-line-decor-divider ":")
  ;; What to do on Emacs exit / workgroups-mode exit?
  ;; (setq wg-emacs-exit-save-behavior           'save)      ; Options: 'save 'ask nil
  ;; (setq wg-workgroups-mode-exit-save-behavior 'save)      ; Options: 'save 'ask nil
  (define-key evil-normal-state-map (kbd "<SPC> 0") 'wg-switch-to-workgroup-at-index-0)
  (define-key evil-normal-state-map (kbd "<SPC> 1") 'wg-switch-to-workgroup-at-index-1)
  (define-key evil-normal-state-map (kbd "<SPC> 2") 'wg-switch-to-workgroup-at-index-2)
  (define-key evil-normal-state-map (kbd "<SPC> 3") 'wg-switch-to-workgroup-at-index-3)
  (define-key evil-normal-state-map (kbd "<SPC> 4") 'wg-switch-to-workgroup-at-index-4)
  (define-key evil-normal-state-map (kbd "<SPC> 5") 'wg-switch-to-workgroup-at-index-5)
  (define-key evil-normal-state-map (kbd "<SPC> 6") 'wg-switch-to-workgroup-at-index-6)
  (define-key evil-normal-state-map (kbd "<SPC> 7") 'wg-switch-to-workgroup-at-index-7)
  (define-key evil-normal-state-map (kbd "<SPC> 8") 'wg-switch-to-workgroup-at-index-8)
  (define-key evil-normal-state-map (kbd "<SPC> 9") 'wg-switch-to-workgroup-at-index-9)
  (define-key evil-normal-state-map (kbd "<SPC> `") 'wg-switch-to-workgroup)
  (define-key evil-normal-state-map (kbd "<SPC> -") 'wg-kill-workgroup)
  (define-key evil-normal-state-map (kbd "<SPC> +") 'wg-create-workgroup)

  (global-set-key  (kbd "\C-c ws") 'wg-save-session)
  (global-set-key  (kbd "\C-c wl") 'wg-reload-session)
  (global-set-key  (kbd "<f8>") 'wg-save-session)
  (global-set-key  (kbd "<f9>") 'wg-reload-session)

  )

(use-package embrace
  :ensure t
  :after evil
  :config
  (define-key evil-normal-state-map (kbd "t") 'embrace-commander)
  )


(use-package  expand-region
  :ensure t
  :after evil
  :config
  (setq expand-region-fast-keys-enabled nil)
  (define-key evil-normal-state-map (kbd "RET") 'er/expand-region)
  (define-key evil-visual-state-map (kbd "RET") 'er/expand-region)
  )
(use-package evil-vimish-fold
  :ensure t
  :config
  (evil-vimish-fold-mode 1))



(global-set-key (kbd "C-x g") 'magit)
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
