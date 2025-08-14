; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-rest-system
  (:use #:asdf #:cl))
(in-package #:todoapp-rest-system)

(defsystem todoapp-rest
  :class :package-inferred-system
  :description ""
  :version "0.0.1"
  :author ""
  :license ""
  :pathname "app"
  :depends-on ("clails"
               "todoapp-rest/application"))

