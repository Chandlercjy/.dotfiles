
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

(use-package exec-path-from-shell
  :ensure t
  :defer 5
  :config
  ;; Find Executable Path on OS X
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize))
  )

(use-package evil-mc
  :ensure t
  :defer 5
  :config (global-evil-mc-mode 1))

(use-package hungry-delete
  :ensure t
  :defer 5
  :config (global-hungry-delete-mode))


;; 查看说明时候光标自动跳转到说明窗口
(use-package popwin
  :ensure t
  :defer 5
  :config
  (popwin-mode t))

;; (use-package diff-hl
;;   :ensure t
;;   :init
;;   (global-diff-hl-mode t)
;;   (diff-hl-dired-mode t))

(use-package diminish
  :ensure t
  :defer 5
  :config
  (diminish 'highlight-parentheses-mode)
  (diminish 'highlight-symbol-mode)
  (diminish 'paredit-mode)
  (diminish 'ivy-mode)
  (diminish 'company-mode)
  (diminish 'yas-minor-mode)
  (diminish 'git-gutter-mode)
  (diminish 'eldoc-mode)
  (diminish 'auto-revert-mode)
  (diminish 'subword-mode)
  (diminish 'hs-minor-mode)
  (diminish 'hideshowvis-minor-mode)
  (diminish 'clj-refactor-mode)
  (diminish 'anzu-mode)
  (diminish 'undo-tree-mode))

(use-package evil-matchit
  :ensure t
  :defer 5
  :config
  (global-evil-matchit-mode 1))

(use-package fzf
  :ensure t
  :defer 5
  )


(use-package vimrc-mode
  :ensure t
  :defer 5
  )

(use-package which-key
  :ensure t
  :defer 5
  :config
  (setq which-key-idle-delay 1.0)
  (setq which-key-max-description-length 27)
  (setq which-key-separator " → " )
  (setq which-key-prefix-prefix "+" )
  (setq which-key-popup-type 'minibuffer)
  (setq which-key-sort-order 'which-key-key-order)
  (which-key-setup-minibuffer)
  (which-key-mode)
  )


(provide 'init-packages)
