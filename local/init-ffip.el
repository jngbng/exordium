;; ffip --- Summary

(use-package find-file-in-project
  :ensure t
  :init
  (autoload 'find-file-in-project "find-file-in-project" nil t)
  (autoload 'pfind-file-in-project-by-selected "find-file-in-project" nil t)
  (autoload 'find-directory-in-project-by-selected "find-file-in-project" nil t)
  (autoload 'ffip-show-diff "find-file-in-project" nil t)
  (autoload 'ffip-save-ivy-last "find-file-in-project" nil t)
  (autoload 'ffip-ivy-resume "find-file-in-project" nil t)

  :bind
  (:map global-map
        ("C-c o" . 'find-file-in-project)))

(provide 'init-ffip)
;;; init-ffip.el ends here
