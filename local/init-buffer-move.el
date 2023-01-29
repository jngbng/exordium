;;; package -- SUMMARY
;;; Commentary:

;;; Code:
(use-package buffer-move
  :ensure nil
  :bind
  (:map global-map
        ("C-M-{" . 'buf-move-up)
        ("C-M-?" . 'buf-move-down)
        ("C-M-:" . 'buf-move-left)
        ("C-M-\"" . 'buf-move-right)))

(provide 'init-buffer-move)
;;; init-buffer-move.el ends here
