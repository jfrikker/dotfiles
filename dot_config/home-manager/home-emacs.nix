{
    enable = true;
    extraPackages = epkgs: [
        epkgs.catppuccin-theme
        epkgs.evil
	epkgs.evil-collection
        epkgs.general
        epkgs.projectile
	epkgs.sly
	epkgs.sly-macrostep
        epkgs.vertico
        epkgs.which-key
    ];
    extraConfig = ''
(use-package catppuccin-theme
    :config
    (setq catppuccin-flavor 'frappe)
    (load-theme 'catppuccin :no-confirm))

(use-package evil
    :init
    (setq evil-want-integration t)
    (setq evil-want-keybinding nil)
    :config 
    (evil-mode 1)
    (evil-set-leader 'normal (kbd "SPC")))

(use-package evil-collection
    :after evil
    :config
    (evil-collection-init))

(use-package general
    :after evil
    :config
    (general-evil-setup)

    (general-define-key
        :states 'normal
        :prefix "SPC"
        "h" '(:ignore t :which-key "Help")
        ":" '(execute-extended-command :which-key "Execute Command")
        ";" '(eval-expression :which-key "Evaluate Expression"))

    (general-define-key
        :states 'normal
        :prefix "SPC h"
        "v" '(describe-variable :which-key "Describe Variable")))

(use-package projectile
    :config (projectile-mode 1))

(use-package sly
    :config
    (setq inferior-lisp-program "sbcl"))

(use-package sly-macrostep)

(use-package vertico
    :config
    (vertico-mode))

(use-package which-key
    :config
    (which-key-mode))

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 130)
(set-face-attribute 'fixed-pitch nil :font "JetBrainsMono Nerd Font" :height 130)

(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setf indent-tabs-mode nil)
'';
}
