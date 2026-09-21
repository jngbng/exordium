(use-package agent-shell
    :ensure t
    :config
    (setq agent-shell-screenshot-command '("spectacle" "-b" "-r" "-o"))
    (setq agent-shell-show-config-icons nil)

    :ensure-system-package
    ;; Add agent installation configs here
    (;; (claude . "curl -fsSL https://claude.ai/install.sh | bash")
     (claude-agent-acp . "npm install -g @agentclientprotocol/claude-agent-acp"))

    :bind
    (:map agent-shell-mode-map
          ("RET" . newline)
          ("C-c C-c" . shell-maker-submit)
          ("C-c C-k" . agent-shell-interrupt))
    )

(provide 'init-agent-shell)
