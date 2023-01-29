(use-package eshell-toggle
  :custom
  (eshell-toggle-size-fraction 3)
  (eshell-toggle-use-projectile-root t)
  (eshell-toggle-run-command nil)
  (eshell-toggle-init-function #'eshell-toggle-init-ansi-term)

  ;; :quelpa
  ;; (eshell-toggle :repo "4DA/eshell-toggle" :fetcher github :version original)

  :bind
  ("s-`" . eshell-toggle))

(provide 'init-eshell-toggle)
