(with-eval-after-load 'evil
  ;; 个性化配置快捷键:
  (define-key evil-normal-state-map (kbd "<SPC> p") 'search-Document)

  (defun chandler/popup-terminal()
    (interactive)

    (if (popwin:popup-window-live-p)
        (popwin:close-popup-window)
      (popwin:popup-buffer "*terminal*")
      )
    )

  (defun chandler/run-command(term_command)
    (interactive)
    ;; (if (popwin:popup-window-live-p)
    ;;     (message "haha")
    ;;   (chandler/popup-terminal)
    ;;   )
    (visit-term-buffer)
    (term term_command)
    ;; (switch-to-buffer cur_buffer)
    (evil-normal-state)
    )

  (defun visit-term-buffer ()
    "Create or visit a terminal buffer."
    (interactive)
    (if (not (get-buffer "*terminal*"))
        (progn
          (split-window-sensibly (selected-window))
          (other-window 1)
          (ansi-term (getenv "SHELL"))
          (rename-buffer "*terminal*")
          (end-of-buffer)
          (insert (format "cd %s" (projectile-project-root)))
          (term-send-input))
      (switch-to-buffer-other-window "*terminal*")))


  (define-key evil-normal-state-map (kbd "SPC TAB") 'chandler/popup-terminal)

  (define-key evil-normal-state-map (kbd ",1")
    (lambda() (interactive)
      (cd  "~/Documents/CLionProjects/OnePyPlus/bin/")
      (chandler/run-command "~/Documents/CLionProjects/OnePyPlus/bin/demo_OnePy")))
  (define-key evil-normal-state-map (kbd ",2")
    (lambda() (interactive)
      (cd  "~/Documents/CLionProjects/OnePyPlus/bin/")
      (chandler/run-command "~/Documents/CLionProjects/OnePyPlus/bin/test_OnePy")))

  )



(provide 'init-personal)
