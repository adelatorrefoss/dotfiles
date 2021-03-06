;;; package --- Summary
;;; Comentary:
;;; Code

;; emacs config

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;;                 C-p
;;   C-a  --- C-b  <|>  C-f ---  C-e
;;                 C-n
;;      M-a     Retroceder al comienzo de la oración
;;      M-e     Avanzar al final de la oración
;; C-v  Avanzar una pantalla completa
;; M-v  Retroceder una pantalla completa
;; C-l  Limpiar la pantalla y mostrar todo el texto de nuevo,

;; M-b - Moverse hacia atrás una palabra
;; M-f - Moverse hacia adelante una palabra
;; M-> - Ir al final del buffer
;; M-< - Ir al principio del buffer

;; M-d - Borrar palabra hacia adelante
;; C-<backspace> - Borrar palabra hacia atrás

;; <DEL>        borra el carácter justo antes que el cursor
;; C-d          borra el siguiente carácter después del cursor

;; M-<DEL>      Elimina la palabra inmediatamente antes del
;;                  cursor
;; M-d          Elimina la siguiente palabra después del cursor

;; C-k                  Elimina desde el cursor hasta el fin de la línea
;; M-k                  Elimina hasta el final de la oración actual

;; C-x C-s - Guardar cambios

;; C-x C-f - Abrir fichero
;; C-x b - Cambiar de buffer
;; C-x C-b - Mostrar ventana de buffers

;; C-x C-e - Evaluar expresión-s anterior al cursor

;; C-/ - Deshacer/rehacer cambios

;; C-<spc> - Comenzar selección
;; M-w - Copiar/Kill región (kill-ring)
;; C-w - Cortar/Kill región (kill-ring)
;; C-y - Pegar
;; M-y - Pegar(cíclico) cosa anterior en el kill-ring
;; C-k - Kill hasta el final de la línea

;; C-x o - Moverse entre ventanas (M-<numero> con el plugin window-numbering)
;; C-x 0 - Cerrar ventana actual
;; C-x 1 - Dejar ventana actual
;; C-x 2 - Split ventana horizontal
;; C-x 3 - Split ventana vertical

;; C-x C-d muestra el directorio del fichero actual

;; M-z " which deletes everything from point to the next occurance of the " character.

;; C-M-k, aka "kill balanced expression"

;; C-M-SPACE gives you "mark-sexp" which will select to the balancing paren, quote, etc. and then you can C-w or whatever to make it go away.

;; C-z C-z comment lines


;; Zap up to char
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR.

  \(fn arg char)"
  'interactive)
(global-set-key "\M-Z" 'zap-up-to-char)



(ido-mode t)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

(ido-vertical-mode t)
(ido-at-point-mode t)

;; gui
(scroll-bar-mode -1)
(column-number-mode 1)
(global-linum-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)

(global-auto-revert-mode t)

(setq backup-inhibited t
      auto-save-default nil)

;; guardar customizacion automatica en otro fichero
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
;; plugins

;; manejo de proyectos
(require 'projectile)
(projectile-global-mode t)

;; acceso rápido a ventanas con M-<numero>
(window-numbering-mode 1)

;; esquema de colores: theme
(load-theme 'flatland-black)
;;(load-theme 'tsdh-light t)


;; projectile manual
;; flx-ido
(require 'flx-ido)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
;; limit search
(setq flx-ido-threshold 10000)
;; GC launchs when 20MB
(setq gc-cons-threshold 20000000)



;; C-c p f      Display a list of all files in the project. With a prefix argument it will clear the cache first.
;; C-c p F      Display a list of all files in all known projects.

;; C-c p g      Display a list of all files at point in the project. With a prefix argument it will clear the cache first.
;; C-c p 4 f    Jump to a project's file using completion and show it in another window.
;; C-c p 4 g    Jump to a project's file based on context at point and show it in another window.

;; C-c p d      Display a list of all directories in the project. With a prefix argument it will clear the cache first.

;; C-c p 4 d    Switch to a project directory and show it in another window.
;; C-c p 4 a    Switch between files with the same name but different extensions in other window.

;; C-c p T      Display a list of all test files(specs, features, etc) in the project.
;; C-c p l      Display a list of all files in a directory (that's not necessarily a project)

;; C-c p s g    Run grep on the files in the project.

;; M-- C-c p s g        Run grep on projectile-grep-default-files in the project.
;; C-c p v      Run vc-dir on the root directory of the project.

;; C-c p b      Display a list of all project buffers currently open.
;; C-c p 4 b    Switch to a project buffer and show it in another window.
;; C-c p 4 C-o  Display a project buffer in another window without selecting it.

;; C-c p a      Switch between files with the same name but different extensions.
;; C-c p o      Runs multi-occur on all project buffers currently open.

;; C-c p r      Runs interactive query-replace on all files in the projects.

;; C-c p i      Invalidates the project cache (if existing).

;; C-c p R      Regenerates the projects TAGS file.

;; C-c p j      Find tag in project's TAGS file.

;; C-c p k      Kills all project buffers.
;; C-c p D      Opens the root of the project in dired.;
;; C-c p e      Shows a list of recently visited project files.
;; C-c p s a    Runs ack on the project. Requires the presence of ack-and-a-half.
;; C-c p s s    Runs ag on the project. Requires the presence of ag.el.
;; C-c p !      Runs shell-command in the root directory of the project.
;; C-c p &      Runs async-shell-command in the root directory of the project.
;; C-c p c      Runs a standard compilation command for your type of project.
;; C-c p P      Runs a standard test command for your type of project.
;; C-c p t      Toggle between an implementation file and its test file.
;; C-c p 4 t    Jump to implementation or test file in other window.
;; C-c p z      Adds the currently visited file to the cache.
;; C-c p p      Display a list of known projects you can switch to.
;; C-c p S      Save all project buffers.
;; C-c p m      Run the commander (an interface to run commands with a single key).
;; C-c p ESC    Switch to the most recently selected projectile buffer.


;; EVIL ========================================

;; ;; evil mode
;; (require 'evil)
;; (evil-mode 0)

;; ;;Exit insert mode by pressing j and then j quickly
;; (require 'key-chord)
;; (key-chord-mode 1)
;; (setq key-chord-two-keys-delay 0.5)
;; (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; ;; persistant highlight search in evil
;; (require 'highlight)
;; (require 'evil-search-highlight-persist)
;; (global-evil-search-highlight-persist t)

;; ;; evil nerd commenter
;; (evilnc-default-hotkeys)

;; ;; evil surround
;; (require 'evil-surround)
;; (global-evil-surround-mode 1)

;; END EVIL MODE CONFIG


;; comment lines
(defun comment-or-uncomment-block ()
  (interactive)
  (let ((start (line-beginning-position))
        (end (line-end-position)))
    (when (region-active-p)
      (setq start (save-excursion
                    (goto-char (region-beginning))
                    (beginning-of-line)
                    (point))
            end (save-excursion
                  (goto-char (region-end))
                  (end-of-line)
                  (point))))
    (comment-or-uncomment-region start end)))

;; comments lines C-z C-z
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z C-z") 'comment-or-uncomment-block)

;; con C-x C-d muestras el directorio del fichero actual
(require 'dired+)

;; Mostrar el directorio del proyecto al cambiar de proyecto
(setq projectile-switch-project-action 'projectile-dired)

;; ag
(require 'ag)

;; indent with spaces
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; JS indentation 2 spaces
(setq-default js-indent-level 2)

;; html indent 2 spaces
(add-hook 'html-mode-hook
          (lambda ()
            (set (make-local-variable 'sgml-basic-offset) 2)))

;; highlight tabs
(require 'highlight-chars)
(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)

;; Nyam-mode
(nyan-mode t)
(setq nyan-start-animation t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; inhibit splash screen
(setq inhibit-splash-screen t)

;; period single space ends sentence
(setq sentence-end-double-space nil)

;; replace selection
(delete-selection-mode 1)

;; Org mode
(setq org-log-done t)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(define-key global-map (kbd "C-c o l") 'org-store-link)
(define-key global-map (kbd "C-c o c") 'org-capture)
(define-key global-map (kbd "C-c o a") 'org-agenda)
(define-key global-map (kbd "C-c o b") 'org-iswitchb)

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(global-auto-complete-mode 1)
;; (add-hook 'groovy-mode-hook (lambda ()
;;                               (auto-complete-mode 1)))

;; delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; auto-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; auto-paren-mode
(show-paren-mode 1)

;; Expand Region
(require 'expand-region)
(global-set-key (kbd "C-'") 'er/expand-region)
(global-set-key (kbd "C-\"") 'er/contract-region)
(pending-delete-mode t) ;; once selected you can replace the selection

;; Change inner
;; M-i " would kill the contents of the string
;; M-o " would kill the entire string
;; C-u M-i " means copy instead kill
(require 'change-inner)
(global-set-key (kbd "M-i") 'change-inner)
(global-set-key (kbd "M-o") 'change-outer)

;; Undo Tree
;; C-x u  visualize undo tree
(global-undo-tree-mode)

;; javascript - js2-mode
;; tab to 2
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-basic-offset 2)
(setq js-indent-level 2)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)

;; GTAGS
;; activar ggtags-mode (navegar por tags)

;; (autoload 'gtags-mode "gtags" "" t)
;; (add-hook 'prog-mode-hook (lambda ()
;;                             (interactive)
;;                             (ggtags-mode 1)))

;; (add-hook 'dired-mode-hook (lambda ()
;;                              (ggtags-mode 1)))

;; M-. : encuentra definiciones
;; M-] : encuentra referencias
;; M-* : aborta (vuelve al punto previo de la llamada de manera recursiva)
;; M-n o M-p : va al siguiente o al anterior TAG
;; M-o : hace toggle de abbrev completo (en mi caso me funciona ESC + soltar ESC + TAB o Meta+Control+i).
;; M-{ o M-} : previo o siguiente fichero


;; E-TAGS
;; `M-.’ (‘find-tag’) – find a tag, that is, use the Tags file to look up a definition. If there are multiple tags in the project with the same name, use
;; `C-u M-.’ to go to the next match.
;; ‘M-x find-tag-other-window’ – selects the buffer containing the tag’s definition in another window, and move point there.
;; ‘M-*’ (‘pop-tag-mark’) – jump back
;; ‘M-x tags-search’ – regexp-search through the source files indexed by a tags file (a bit like ‘grep’)
;; ‘M-x tags-query-replace’ – query-replace through the source files indexed by a tags file
;; `M-,’ (‘tags-loop-continue’) – resume ‘tags-search’ or ‘tags-query-replace’ starting at point in a source file
;; ‘M-x tags-apropos’ – list all tags in a tags file that match a regexp
;; ‘M-x list-tags’ – list all tags defined in a source file


;; Multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; web-mode
;; from: https://truongtx.me/2014/03/10/emacs-setup-jsx-mode-and-jsx-syntax-checking/

;; Shortcuts

;; General

;; M-; comment / uncomment line(s)
;; C-c C-f toggle folding on a tag/block
;; C-c C-i indent entire buffer
;; C-c C-m mark and expand
;; C-c C-s insert snippet
;; C-c C-w toggle display of invalid whitespaces

;; DOM

;; C-c C-d a replace apostrophes
;; C-c C-d d show tag mismatch
;; C-c C-d e replace HTML entities
;; C-c C-d n normalize
;; C-c C-d q replace dumb quotes
;; C-c C-d t traverse dom tree
;; C-c C-d x xpath

;; Block

;; C-c C-b b block beginning
;; C-c C-b c block close
;; C-c C-b e block end
;; C-c C-b k block kill
;; C-c C-b n next block
;; C-c C-b p previous block
;; C-c C-b s block select

;; HTML element

;; C-c C-e / element close
;; C-c C-e a select element content
;; C-c C-e b element beginning
;; C-c C-e c element clone
;; C-c C-e d child element (down)
;; C-c C-e e element end
;; C-c C-e f toggle folding on children
;; C-c C-e i element insert
;; C-c C-e k element kill
;; C-c C-e m mute blanks between children
;; C-c C-e n next element
;; C-c C-e p previous element
;; C-c C-e r rename element
;; C-c C-e s select element
;; C-c C-e t transpose element
;; C-c C-e u parent element (up)
;; C-c C-e v element vanish
;; C-c C-e w wrap element

;; HTML tag

;; C-c C-t a sort attributes
;; C-c C-t b tag beginning
;; C-c C-t e tag end
;; C-c C-t m fetch matching tag
;; C-c C-t n next tag
;; C-c C-t p previous tag
;; C-c C-t s select tag

;; HTML attribute

;; C-c C-a b attribute beginning
;; C-c C-a e attribute end
;; C-c C-a i attribute insert
;; C-c C-a k attribute kill
;; C-c C-a n attribute next
;; C-c C-a p attribute previous
;; C-c C-a s attribute select
;; C-c C-a t attribute transpose

(require 'web-mode)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-indent-style 2)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))

;; gsp syntax like html
(add-to-list 'auto-mode-alist '("\\.gsp\\'" . web-mode))

;; web-mode and jsx
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

;;;;;;;;;;;;;;;
;; flycheck
;; A JSX syntax and style checker based on JSXHint.
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
;;(flycheck-add-mode 'javascript-eslint 'web-mode)
;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'js2-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

(flycheck-define-checker jsxhint-checker
  "A JSX syntax and style checker based on JSXHint."

  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (equal web-mode-content-type "jsx")
              ;; enable flycheck
              (flycheck-select-checker 'jsxhint-checker)
              (flycheck-mode))))


;; volatile-highlights
;; Highlights changes to the buffer caused by commands such as ‘undo’, ‘yank’/’yank-pop’, etc.
;; The highlight disappears at the next command.
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


;; smex
;; Smex is a M-x enhancement for Emacs. Built on top of IDO, it provides a convenient interface to
;; your recently and most frequently used commands. And to all the other commands, too.
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                                        ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;;;; CLOJURE

;; paredit
;; Turn on pseudo-structural editing of Lisp code.
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)

;; cider
;; The Clojure Interactive Development Environment that Rocks for Emacs
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

;; jade
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl\\'" . sws-mode))

;; dot-mode
(require 'dot-mode)
(add-hook 'find-file-hooks 'dot-mode-on)

;; cucumber
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; editorconfig
(require 'editorconfig)
(editorconfig-mode 1)

;; font, config ligatures
(when (window-system)
  (set-frame-font "Fira Code-12"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               ;; (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)"))))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

;; whitespace
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)

;; pug-mode
(add-to-list 'auto-mode-alist '("\\.pug\\'" . pug-mode))

;;; end

;; Refactor Javascript

;; ee is expand-node-at-point: Expand bracketed list according to node type at point (array, object, function, call args).
;; cc is contract-node-at-point: Contract bracketed list according to node type at point (array, object, function, call args).
;; ef is extract-function: Extracts the marked expressions out into a new named function.
;; em is extract-method: Extracts the marked expressions out into a new named method in an object literal.
;; tf is toggle-function-expression-and-declaration: Toggle between function expression to arrow function.
;; ta is toggle-arrow-function-and-expression: Toggle between function name() {} and var name = function ();
;; ip is introduce-parameter: Changes the marked expression to a parameter in a local function.
;; lp is localize-parameter: Changes a parameter to a local var in a local function.
;; wi is wrap-buffer-in-iife: Wraps the entire buffer in an immediately invoked function expression
;; ig is inject-global-in-iife: Creates a shortcut for a marked global by injecting it in the wrapping immediately invoked function expression
;; ag is add-to-globals-annotation: Creates a /*global */ annotation if it is missing, and adds the var at point to it.
;; ev is extract-var: Takes a marked expression and replaces it with a var.
;; iv is inline-var: Replaces all instances of a variable with its initial value.
;; rv is rename-var: Renames the variable on point and all occurrences in its lexical scope.
;; vt is var-to-this: Changes local var a to be this.a instead.
;; ao is arguments-to-object: Replaces arguments to a function call with an object literal of named arguments.
;; 3i is ternary-to-if: Converts ternary operator to if-statement.
;; sv is split-var-declaration: Splits a var with multiple vars declared, into several var statements.
;; ss is split-string: Splits a string.
;; uw is unwrap: Replaces the parent statement with the selected region.
;; lt is log-this: Adds a console.log() statement for what is at point (or region). With a prefix argument, use JSON pretty-printing.
;; dt is debug-this: Adds a debug() statement for what is at point (or region).
;; sl is forward-slurp: Moves the next statement into current function, if-statement, for-loop or while-loop.
;; ba is forward-barf: Moves the last child out of current function, if-statement, for-loop or while-loop.
;; k is kill: Kills to the end of the line, but does not cross semantic boundaries.

(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)

(js2r-add-keybindings-with-prefix "C-c C-m")
;; eg. extract function with `C-c C-m ef`.
(put 'upcase-region 'disabled nil)
