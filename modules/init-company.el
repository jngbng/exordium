;;;; company-mode

(require 'rtags)
(require 'company)

;; Turn on rtags completions
(setq rtags-completions-enabled t)

;; Turn on company mode everywhere
(global-company-mode)

;; Use ESC to escape company-complete (in addition to C-g)
(define-key company-active-map (kbd "<escape>") 'company-abort)

;; Key to force trigger company-complete
(define-key company-mode-map [(control .)] 'company-complete)

(provide 'init-company)
