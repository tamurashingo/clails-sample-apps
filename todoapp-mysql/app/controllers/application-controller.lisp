; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-mysql/controllers/application-controller
  (:use #:cl
        #:clails/controller/base-controller)
  (:export #:<application-controller>))

(in-package #:todoapp-mysql/controllers/application-controller)

(defclass <application-controller> (<web-controller>)
  ((lisp-type :accessor lisp-type)
   (lisp-version :accessor lisp-version)))

(defmethod do-get ((controller <application-controller>))
  (setf (lisp-type controller) (lisp-implementation-type))
  (setf (lisp-version controller) (lisp-implementation-version))
  (set-view controller "index.html"))

