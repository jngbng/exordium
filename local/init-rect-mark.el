;;;; phi-rectangle - replacement of rect-mark

(use-package phi-rectangle
  :ensure t
  :bind
  (:map global-map
        ("C-x r C-SPC" . 'phi-rectangle-set-mark-command)
        ("C-x r C-w" . 'phi-rectangle-kill-region)
        ("C-x r M-w" . 'phi-rectangle-kill-ring-save)
        ("C-x r C-y" . 'phi-rectangle-yank)))

(provide 'init-rect-mark)
;;; init-rect-mark.el ends here
