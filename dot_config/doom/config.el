;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 13 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! lispyville
  :hook ((common-lisp-mode . lispyville-mode)
         (emacs-lisp-mode . lispyville-mode)
         (scheme-mode . lispyville-mode)
         (racket-mode . lispyville-mode)
         (hy-mode . lispyville-mode)
         (lfe-mode . lispyville-mode)
         (clojure-mode . lispyville-mode))
  :config
  (lispyville-set-key-theme
   '(additional
     additional-insert
     (additional-movement normal visual motion)
     (atom-movement normal visual)
     c-w
     c-u
     (commentary normal visual)
     escape
     (operators normal)
     (prettify insert)
     slurp/barf)))

(use-package! kubernetes-overview
  :commands (kubernetes-overview)
  :config
  (setq kubernetes-poll-frequency 3600
        kubernetes-redraw-frequency 3600))

(use-package! kubernetes-evil
  :after kubernetes-overview)

(use-package! ledger-mode
  :mode "\\.ledger\\'")

(use-package! evil-ledger
  :after ledger-mode
  :config
  (add-hook 'ledger-mode-hook #'evil-ledger-mode))


                                        ; (use-package! org-transclusion
                                        ;   :after org)

(setq lsp-java-jdt-download-url "https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.42.0/jdt-language-server-1.42.0-202411281516.tar.gz")

(setq sql-connection-alist
      '((local
         (sql-product 'mysql)
         (sql-server "127.0.0.1")
         (sql-user "root")
         (sql-password "test")
         (sql-database "ebdb")
         (sql-port 3306))
        (dev
         (sql-product 'mysql)
         (sql-server "kube-db.dev.internal.shibumi.com")
         (sql-user "joe.frikker")
         (sql-password "psStCkHDMJ2DyR6x")
         (sql-database "mothership")
         (sql-port 3306)
         (sql-default-directory "/ssh:bastion.dev.internal.shibumi.com:"))))

(after! projectile
  (setq projectile-indexing-method 'alien))

(after! magit
  (setq magit-list-refs-sortby "-committerdate"))

(setq lsp-java-configuration-maven-user-settings "/Users/jfrikker/.m2/settings.xml")

(after! org
  (setq org-todo-keywords
        '((sequence
           "TODO(o)"                    ; A task that needs doing
           "IN_PROGRESS(p!)"            ; Task is in progress
           "HOLD(h@)"                   ; Task is being held up or paused
           "|"
           "DONE(d!)"
           "CANCELLED(c@)"))
        org-todo-keyword-faces
        '(("IN_PROGRESS"  . +org-todo-active)
          ("HOLD" . +org-todo-onhold)
          ("CANCELLED"   . +org-todo-cancel)))

  (setq org-capture-templates
        '(("t" "Personal todo" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %?\n%i\n%a" :prepend t)
          ("d" "Decision" entry
           (file+headline "decisions.org" "Unfiled")
           "* %?\n:properties:\n%^{ORG-LEVEL|Sprint Team}p:end:\n#What\n\n#Why\n\n#When\n\n%u"))))

(defun org-columns-dblock-write-default (ipos table params)
  "Write out a columnview table at position IPOS in the current buffer.
TABLE is a table with data as produced by `org-columns--capture-view'.
PARAMS is the parameter property list obtained from the dynamic block
definition."
  (let ((link (plist-get params :link))
	(width-specs
	 (mapcar (lambda (spec) (nth 2 spec))
		 org-columns-current-fmt-compiled)))
    (when table
      ;; Prune level information from the table.  Also normalize
      ;; headings: remove stars, add indentation entities, if
      ;; required, and possibly precede some of them with a horizontal
      ;; rule.
      (let ((item-index
	     (let ((p (assoc "ITEM" org-columns-current-fmt-compiled)))
	       (and p (cl-position p
				   org-columns-current-fmt-compiled
				   :test #'equal))))
	    (hlines (plist-get params :hlines))
	    (indent (plist-get params :indent))
	    new-table)
	;; Copy header and first rule.
	(push (pop table) new-table)
	(push (pop table) new-table)
	(dolist (row table (setq table (nreverse new-table)))
	  (let ((level (car row)))
	    (when (and (not (eq (car new-table) 'hline))
		       (or (eq hlines t)
			   (and (numberp hlines) (<= level hlines))))
	      (push 'hline new-table))
	    (when item-index
	      (let* ((raw (nth item-index (cdr row)))
		     (cleaned (org-columns--clean-item raw))
		     (item (if (not link) cleaned
			     (let ((search (org-link-heading-search-string raw)))
			       (org-link-make-string
				search
				cleaned)))))
		(setf (nth item-index (cdr row))
		      (if (and indent (> level 1))
			  (concat "\\_" (make-string (* 2 (1- level)) ?\s) item)
			item))))
	    (push (cdr row) new-table))))
      (when (plist-get params :vlines)
	(setq table
	      (let ((size (length org-columns-current-fmt-compiled)))
		(append (mapcar (lambda (x) (if (eq 'hline x) x (cons "" x)))
				table)
			(list (cons "/" (make-list size "<>")))))))
      (when (seq-find #'identity width-specs)
        ;; There are width specifiers in column format.  Pass them
        ;; to the resulting table, adding alignment field as the first
        ;; row.
        (push (mapcar (lambda (width) (when width (format "<%d>" width))) width-specs) table))
      ;; now insert the table into the buffer
      (goto-char ipos)
      (let ((content-lines (org-split-string (plist-get params :content) "\n"))
	    recalc)
	;; Insert affiliated keywords before the table.
	(when content-lines
	  (while (string-match-p "\\`[ \t]*#\\+" (car content-lines))
	    (insert (string-trim-left (pop content-lines)) "\n")))
	(save-excursion
	  ;; Insert table at point.
	  (insert
	   (mapconcat (lambda (row)
			(if (eq row 'hline) "|-|"
			  (format "|%s|" (mapconcat #'identity row "|"))))
		      table
		      "\n"))
	  ;; Insert TBLFM lines following table.
	  (let ((case-fold-search t))
	    (dolist (line content-lines)
	      (when (string-match-p "\\`[ \t]*#\\+TBLFM:" line)
		(insert "\n" (string-trim-left line))
		(unless recalc (setq recalc t))))))
	(when recalc (org-table-recalculate 'all t))
	(org-table-align)
        (when (seq-find #'identity width-specs)
          (org-table-shrink))))))
(map!
 :nv "g w" #'avy-goto-word-1
 :nv "g r" #'+lookup/references
 :nv "SPC D" #'+default/diagnostics
 :nv "] e" #'flycheck-next-error
 :nv "[ e" #'flycheck-previous-error)
