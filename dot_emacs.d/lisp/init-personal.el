
;; 个性化配置快捷键:
(define-key evil-normal-state-map (kbd "<SPC> p") 'search-Document)

(defun chandler/popup-terminal()
  (interactive)
  ;; (term "~/Documents/CLionProjects/OnePyPlus/bin/demo_OnePy")
  (if (popwin:popup-window-live-p)
      (popwin:close-popup-window)
    (popwin:popup-buffer "*terminal*")
    )
  )

(defun chandler/run-command(term_command)
  (interactive)
  (if (popwin:popup-window-live-p)
      (message "haha")
    (chandler/popup-terminal)
    )
  (term term_command)
  (evil-normal-state)
  )



(define-key evil-normal-state-map (kbd "SPC TAB") 'chandler/popup-terminal)

(define-key evil-normal-state-map (kbd ",1")
  (lambda() (interactive)
    (cd  "~/Documents/CLionProjects/OnePyPlus/bin/")
    (chandler/run-command "~/Documents/CLionProjects/OnePyPlus/bin/demo_OnePy")))

(define-key evil-normal-state-map (kbd ",2")
  (lambda() (interactive)
    (cd  "~/Documents/CLionProjects/OnePyPlus/bin/")
    (chandler/run-command "~/Documents/CLionProjects/OnePyPlus/bin/test_OnePy")))

(provide 'init-personal)
