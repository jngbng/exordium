;;;; Init prolog
;;;
;;; This file defines utility functions reused in many modules, such as themes,
;;; CEDET etc. It should be loaded before any other module.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Environment variables

(defconst *environment-osx* (eq system-type 'darwin)
  "Non-nil if we are on a Mac")

(defconst *environment-linux* (string-match "linux" (prin1-to-string system-type))
  "Non-nil if we are on Linux")

(defconst *environment-nw*  (not window-system)
  "Non-nil if emacs is started in -nw mode")

(defconst *environment-xwindow* (eq window-system 'x)
  "Non-nil if we are in X-Window")

(defconst *environment-bloomberg* (and *environment-xwindow*
                                       (getenv "MBIG_NUMBER"))
  "Non-nil if we are at Bloomberg")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Files

(defun directory-tree (dir)
  "Returns the list of subdirs of 'dir' excluding any dot
dirs. Input is a string and output is a list of strings."
  (let* ((dir   (directory-file-name dir))
         (dirs  '())
         (files (directory-files dir nil nil t)))
    (dolist (f files)
      (unless (string-equal "." (substring f 0 1))
        (let ((f (concat dir "/" f)))
          (when (file-directory-p f)
            (setq dirs (append (cons f (directory-tree f))
                               dirs))))))
    dirs))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Strings

(defun my-string-without-last (string n)
  "Return string minus the last n characters."
  (substring string 0 (max 0(- (length string) n))))

(defun my-string-ends-with (string tail)
  "Predicate checking whether string ends with the given tail."
  (string= tail (substring string (- (length tail)))))

;; (defun string/ends-with (string suffix)
;;   "Return t if STRING ends with SUFFIX."
;;   (and (string-match (rx-to-string `(: ,suffix eos) t)
;;                      string)
;;        t))

(defun my-string-starts-with (string prefix)
  "Return t if STRING starts with prefix."
  (and (string-match (rx-to-string `(: bos ,prefix) t)
                     string)
       t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Others

(defun my-find-if (predicate list)
  (catch 'found
    (dolist (elt list nil)
      (when (funcall predicate elt)
        (throw 'found elt)))))


(provide 'init-prolog)