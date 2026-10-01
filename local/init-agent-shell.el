(use-package agent-shell
    :ensure t
    :config
    (cond
     ((eq system-type 'gnu/linux)
      (cond
       ((executable-find "spectacle")
        (setq agent-shell-screenshot-command '("spectacle" "-b" "-r" "-o")))
       ((executable-find "import")
        (setq agent-shell-screenshot-command '("import")))))
     ((eq system-type 'darwin)
      (setq agent-shell-screenshot-command '("screencapture"))))
    (setq agent-shell-show-config-icons nil)

    ;; :ensure-system-package
    ;; ;; Add agent installation configs here
    ;; ((claude . "curl -fsSL https://claude.ai/install.sh | bash")
    ;;  (claude-agent-acp . "npm install -g @agentclientprotocol/claude-agent-acp"))
    ;; mkdir -p ~/.cache/agent-shell && ln -s \"$(npm root -g)/@lobehhub/icons-static-png/dark\" ~/.cache/agent-shell/dark

    :bind
    (:map agent-shell-mode-map
          ("RET" . newline)
          ("C-c C-c" . shell-maker-submit)
          ("C-c C-k" . agent-shell-interrupt))
    )

(provide 'init-agent-shell)
