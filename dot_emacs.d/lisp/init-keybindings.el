
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;            Packages 相关            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package evil
  :ensure t
  :bind (
         :map evil-normal-state-map
         ("C-c b" . delete-blank-lines)
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
         ;; ("<SPC> f" . counsel-fzf)
         ("<SPC> ]" . flycheck-next-error)
         ("<SPC> [" . flycheck-previous-error)
         (",l" . flycheck-list-errors)
         ("<f7>" . flycheck-mode)


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

         ;; (",cc" . evilnc-comment-or-uncomment-lines)
         :map evil-insert-state-map
         ("\C-a" . company-yasnippet)

         ;; :map evil-visual-state-map
         ;; (",cc" . evilnc-comment-or-uncomment-lines)
         ;; (",cp" . evilnc-comment-or-uncomment-paragraphs)

         ;; 同时都有的
         :map evil-normal-state-map
         ("RET" . er/expand-region)
         (",y" . chandler/toggle-copy-to-osx)
         :map evil-visual-state-map
         ("RET" . er/expand-region)
         (",y" . chandler/toggle-copy-to-osx)

         )
  :hook (prog-mode . evil-mode)
  :config
  (evil-add-hjkl-bindings recentf-dialog-mode-map 'emacs)
  (evil-add-hjkl-bindings package-menu-mode-map 'emacs)
  (setq-default evil-insert-state-cursor 'bar)
  ;; (define-key evil-normal-state-map (kbd "<SPC-f>f") 'fzf)
  (evil-set-initial-state 'ivy-occur-grep-mode 'normal)
  (evil-set-initial-state 'ag-mode 'normal)
  (evil-set-initial-state 'term-mode 'emacs)
  )

(use-package general
  :ensure t)

;; (general-create-definer comma-def :prefix ",")
;; (general-create-definer comma-c-def :prefix ",")
;; (general-create-definer comma-t-def :prefix ",")
;; (general-create-definer comma-p-def :prefix ",")
;; (general-create-definer comma-d-def :prefix ",")

(general-define-key
 :prefix ","
 :keymaps '(normal visual)
 "c" '(:ignore t :which-key "comments")
 )

(general-define-key
 :states '(normal visual)
 :keymaps 'override
 :prefix ",c"
 "c" 'evilnc-comment-or-uncomment-lines
 "p" 'evilnc-comment-or-uncomment-paragraphs
 )




(general-create-definer spc-f-def :prefix "SPC f")
(general-create-definer spc-f-def :prefix "SPC f")
(general-create-definer spc-f-def :prefix "SPC f")
(general-create-definer spc-f-def :prefix "SPC f")
(general-create-definer spc-f-def :prefix "SPC f")

(general-define-key
 :states 'normal
  :keymaps 'override
 "q" ":wq"
 )

;; (spc-files-def
;;   :states 'normal
;;   :keymaps 'override

;;   "f" 'fzf
;;   )


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



(use-package term
  :defer t
  :config
  (defun term-send-esc ()
    "Send ESC in term mode."
    (interactive)
    (term-send-raw-string "\e"))
  ;; to quit fzf with ESC key
  (define-key term-raw-map (kbd "<escape>") 'term-send-esc)

  )




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;               系统相关             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x g") 'magit)
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
