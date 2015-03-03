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

(ido-mode t)
(ido-everywhere t)
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

;; esquema de colores: flatland
(load-theme 'flatland-black)

;; projectile manual
;; flx-ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
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

;; activar ggtags-mode (navegar por tags)
(add-hook 'prog-mode-hook (lambda ()
                            (interactive)
                            (ggtags-mode 1)))

(add-hook 'dired-mode-hook (lambda ()
                             (ggtags-mode 1)))

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

;; highlight tabs
(require 'highlight-chars)
(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)

;; Nyam-mode
(nyan-mode t)
(nyan-start-animation)

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

;; evil mode
(require 'evil)
(evil-mode 1)

;;Exit insert mode by pressing j and then j quickly
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

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
;;(global-auto-complete-mode 1)
(add-hook 'groovy-mode-hook (lambda ()
                              (auto-complete-mode 1)))

;; delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; gsp syntax like html
(add-to-list 'auto-mode-alist '("\\.gsp\\'" . html-mode))

;; persistant highlight search in evil
(require 'highlight)
(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)

;; auto-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; auto-paren-mode
(show-paren-mode 1)

;; GIT VersionControl Keybindings

;; C-x v v     vc-next-action -- perform the next logical control operation on file
;; C-x v i     vc-register -- add a new file to version control

;; C-x v +     vc-update -- Get latest changes from version control
;; C-x v ~     vc-version-other-window -- look at other revisions
;; C-x v =     vc-diff -- diff with other revisions
;; C-x v u     vc-revert-buffer -- undo checkout
;; C-x v c     vc-cancel-version -- delete the latest revision (often it makes more sense to look at an old revision and check that in again!)

;; C-x v d     vc-directory -- show all files which are not up to date
;; C-x v g     vc-annotate -- show when each line in a tracked file was added and by whom

;; C-x v s     vc-create-snapshot -- tag all the files with a symbolic name
;; C-x v r     vc-retrieve-snapshot -- undo checkouts and return to a snapshot with a symbolic name

;; C-x v l     vc-print-log -- show log (not in ChangeLog format)
;; C-x v a     vc-update-change-log -- update ChangeLog

;; C-x v m     vc-merge
;; C-x v h     vc-insert-headers

;; M-x vc-resolve-conflicts -- pop up an ediff-merge session on a file with conflict markers

;; evil nerd commenter
(evilnc-default-hotkeys)
