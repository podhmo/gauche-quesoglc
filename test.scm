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


(glc-context (glc-gen-context))
(glc-append-catalog "/etc/X11/fonts/Type1/")
;; epilogue
(test-end)





