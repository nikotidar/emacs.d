;;; lia-language.el --- Emacs Config -*- lexical-binding: t; -*-

;;; Commentary:

;; language specific configs

;;; Code:

;; c/c++

(use-package clang-format
  :ensure t
  :defer t
  :general
  (:keymaps
   '(c-mode-map c++-mode-map)
   "C-c C-f" #'clang-format-buffer))

;; .h files open in c++ mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; web

(use-package web-mode
  :ensure t
  :init (setq web-mode-enable-auto-pairing nil)
  :mode ("\\.html?\\'" "\\.twig\\'" "\\.vue\\'"))

(use-package emmet-mode
  ;; C-j to expand
  :ensure t
  :hook ((css-mode . emmet-mode)
         (php-mode . emmet-mode)
         (sgnl-mode . emmet-mode)
         (rjsx-mode . emmet-mode)
         (web-mode . emmet-mode)))

;; css

(use-package less-css-mode
  :ensure t
  :mode "\\.less\\'")

;; javascript

(use-package js2-mode
  :ensure t
  :general
  (:keymaps
   'js-mode-map
   [remap evil-jump-to-tag] 'js2-jump-to-definition)
  :mode "\\.js\\'"
  :hook (js2-mode . js2-imenu-extras-mode)
  :init
  (setq js2-strict-missing-semi-warning nil
        js2-missing-semi-one-line-override nil
        js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil))

(use-package prettier-js
  :ensure t
  :hook (js-mode . prettier-js-mode))

(use-package rjsx-mode
  :ensure t
  :mode "\\.jsx\\'"
  :magic ("/\\*\\* @jsx React\\.DOM \\*/" "^import React"))

;; english (yeah. I know...)

(use-package writegood-mode
  :ensure t
  :commands (writegood-mode))

;; other programming languages

(use-package cider
  :ensure t
  :commands (clojure-mode
             clojurec-mode
             clojurescript-mode))

(use-package elm-mode
  :ensure t
  :mode "\\.elm\\'"
  :general
  (:keymaps
   'elm-mode-map
   "C-c C-f" 'elm-format-buffer))

(use-package haskell-mode
  :ensure t
  :mode "\\.hs\\'")

(use-package lua-mode
  :ensure t
  :mode "\\.lua\\'")

(use-package php-mode
  :ensure t
  :mode "\\.php\\'")

;; not programming languages

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" "\\.md\\'" "\\.markdown\\'")
  :init (setq markdown-command "multimarkdown"))

(use-package json-mode
  :ensure t
  :mode ("\\.json\\'" ".eslintrc\\'" ".prettierrc\\'"))

(use-package yaml-mode
  :ensure t
  :mode "\\.yaml\\'")

(provide 'lia-language)

;;; lia-language.el ends here
