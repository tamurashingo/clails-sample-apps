; -*- mode: lisp -*-
;;;; boot from clails cli

(push (uiop/os:getcwd) asdf:*central-registry*)
(asdf:load-system :todoapp-postgresql)
(setf clails/environment:*project-dir* (uiop/os:getcwd))
(setf clails/environment:*migration-base-dir* clails/environment:*project-dir*)

(let ((envname (uiop:getenv "CLAILS_ENV")))
  (when envname
    (clails/environment:set-environment envname)))

(todoapp-postgresql/config/database:initialize-database-config)
