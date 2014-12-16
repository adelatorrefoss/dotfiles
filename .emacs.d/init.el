(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;;                 C-p
;;   C-a  --- C-b  <|>  C-f ---  C-e
;;                 C-n

;; M-b - Moverse hacia atrás una palabra
;; M-f - Moverse hacia adelante una palabra
;; M-> - Ir al final del buffer
;; M-< - Ir al principio del buffer

;; M-d - Borrar palabra hacia adelante
;; C-<backspace> - Borrar palabra hacia atrás

;; C-x C-s - Guardar cambios

;; C-x C-f - Abrir fichero
;; C-x b - Cambiar de buffer
;; C-x C-b - Mostrar ventada de buffers

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



;; C-c p f	Display a list of all files in the project. With a prefix argument it will clear the cache first.
;; C-c p F	Display a list of all files in all known projects.

;; C-c p g	Display a list of all files at point in the project. With a prefix argument it will clear the cache first.
;; C-c p 4 f	Jump to a project's file using completion and show it in another window.
;; C-c p 4 g	Jump to a project's file based on context at point and show it in another window.

;; C-c p d	Display a list of all directories in the project. With a prefix argument it will clear the cache first.

;; C-c p 4 d	Switch to a project directory and show it in another window.
;; C-c p 4 a	Switch between files with the same name but different extensions in other window.

;; C-c p T	Display a list of all test files(specs, features, etc) in the project.
;; C-c p l	Display a list of all files in a directory (that's not necessarily a project)

;; C-c p s g	Run grep on the files in the project.

;; M-- C-c p s g	Run grep on projectile-grep-default-files in the project.
;; C-c p v	Run vc-dir on the root directory of the project.

;; C-c p b	Display a list of all project buffers currently open.
;; C-c p 4 b	Switch to a project buffer and show it in another window.
;; C-c p 4 C-o	Display a project buffer in another window without selecting it.

;; C-c p a	Switch between files with the same name but different extensions.
;; C-c p o	Runs multi-occur on all project buffers currently open.

;; C-c p r	Runs interactive query-replace on all files in the projects.

;; C-c p i	Invalidates the project cache (if existing).

;; C-c p R	Regenerates the projects TAGS file.

;; C-c p j	Find tag in project's TAGS file.

;; C-c p k	Kills all project buffers.
;; C-c p D	Opens the root of the project in dired.
;; C-c p e	Shows a list of recently visited project files.
;; C-c p s a	Runs ack on the project. Requires the presence of ack-and-a-half.
;; C-c p s s	Runs ag on the project. Requires the presence of ag.el.
;; C-c p !	Runs shell-command in the root directory of the project.
;; C-c p &	Runs async-shell-command in the root directory of the project.
;; C-c p c	Runs a standard compilation command for your type of project.
;; C-c p P	Runs a standard test command for your type of project.
;; C-c p t	Toggle between an implementation file and its test file.
;; C-c p 4 t	Jump to implementation or test file in other window.
;; C-c p z	Adds the currently visited file to the cache.
;; C-c p p	Display a list of known projects you can switch to.
;; C-c p S	Save all project buffers.
;; C-c p m	Run the commander (an interface to run commands with a single key).
;; C-c p ESC	Switch to the most recently selected projectile buffer.


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

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z C-z") 'comment-or-uncomment-block)

;; activar ggtags-mode (navegar por tags) 
(add-hook 'prog-mode-hook (lambda ()
			    (interactive)
			    (ggtags-mode 1)))
(add-hook 'dired-mode-hook (lambda ()
			     (ggtags-mode 1)))

;; con C-x C-j muestras el directorio del fichero actual
(require 'dired+)

;; Mostrar el directorio del proyecto al cambiar de proyecto
(setq projectile-switch-project-action 'projectile-dired)
