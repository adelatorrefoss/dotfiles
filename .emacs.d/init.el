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
