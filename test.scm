;;;
;;; Test gl.glc
;;;

(use gauche.test)

(test-start "gl.glc")
(use gl.glc)
(test-module 'gl.glc)

;; The following is a dummy test code.
;; Replace it for your tests.
(test* "test-gauche_quesoglc" "gauche_quesoglc is working"
       (test-gauche_quesoglc))


(define ctx (glc-gen-context))
(glc-context ctx)
(glc-append-catalog "/etc/X11/fonts/Type1/")
(glc-append-catalog "/usr/share/fonts/X11/Type1/")
(define myfont (glc-gen-font-id))
#?=(glc-new-font-from-family myfont "gsfonts-x11")
#?=(glc-catalog-list)
#?=(glc-font-face myfont "bold")
(glc-font myfont)
(glc-scale 100 100)

(glc-render-string "hello world")
;; epilogue
(test-end)

