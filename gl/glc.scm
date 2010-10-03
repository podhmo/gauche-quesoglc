;;;
;;; gauche_quesoglc
;;;

(define-module gl.glc
  (export-all)
  )
(select-module gl.glc)

(define-macro (with-predicate->alist predicate ks vs :key (args '()))
  `(list ,@(map (lambda (k v) `(list ,k (,predicate ,@args ,v))) 
                ks vs)))
      
(define (glc-info)
  (with-predicate->alist
   glc-is-enabled?
   (:auto-font :gl-objects :mipmap :hinting-qso :kering-qso)
   (GLC_AUTO_FONT GLC_GL_OBJECTS GLC_MIPMAP GLC_HINTING_QSO  GLC_EXTRUDE_QSO  GLC_KERNING_QSO)))

(define (glc-font-info font)
  (append
   (with-predicate->alist
    glc-get-fontc
    (:family :master-format :vendor :version :full-name-sgi)
    (GLC_FAMILY GLC_MASTER_FORMAT GLC_VENDOR GLC_VERSION GLC_FULL_NAME_SGI)
    :args (font))
   (with-predicate->alist
    glc-get-fonti
    (:char-count  :face-count :is-fixed-pitch :max-mapped-code :min-mapped-code)
    (GLC_CHAR_COUNT  GLC_FACE_COUNT GLC_IS_FIXED_PITCH GLC_MAX_MAPPED_CODE GLC_MIN_MAPPED_CODE)
    :args (font))))

;; Loads extension
(dynamic-load "gauche_quesoglc")
     
;;
;; Put your Scheme definitions here
;;

;; Epilogue
(provide "gl/glc")


