;;;; rezipeas.asd

(asdf:defsystem #:rezipeas
  :description "Describe rezipeas here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:clsql #:hunchentoot)
  :components ((:file "package")
               (:file "rezipeas")))
