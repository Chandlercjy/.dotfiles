
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
  :init
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
  :defer 1
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
