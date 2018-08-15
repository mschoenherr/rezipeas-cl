;;;; rezipeas.lisp

(in-package #:rezipeas)

(defmacro with-rz-db (dbvar &rest body)
  `(clsql:with-database (,dbvar '("localhost" "rezipeas" "rezipeas" "") :database-type :postgresql-socket) ,@body))

(clsql:def-view-class recipe ()
  ((id
    :db-kind :key
    :db-constraints :not-null
    :type integer
    :reader id)
   (name
    :accessor name
    :type string
    :initarg :name)
   (intro
    :accessor intro
    :type string
    :initarg :intro)
   (description
    :accessor description
    :type string
    :initarg :description)
   (tip
    :accessor tip
    :type string
    :initarg :tip)
   (views
    :accessor views
    :type integer
    :initform 0
    :initarg :views)
   (portions
    :accessor portions
    :type integer
    :initform 1
    :initarg :portions)
   (image_url
    :accessor image-url
    :type string
    :initarg :image-url)))

(clsql:def-view-class indexed-name ()
  ((id
    :db-kind :key
    :db-constraints :not-null
    :type integer
    :reader id)
   (name
    :accessor name
    :type string)))

(clsql:def-view-class ingredient (indexed-name)
  ())

(clsql:def-view-class tag (indexed-name)
  ())

(clsql:def-view-class tagrec ()
  ((tag_id
    :reader tag-id
    :type integer
    :initarg :tag-id)
   (rec_id
    :reader recipe-id
    :type integer
    :initarg :recipe-id)))

(clsql:def-view-class recing ()
  ((rec_id
    :reader recipe-id
    :type integer
    :initarg :recipe-id)
   (ing_id
    :reader ingredient-id
    :type integer
    :initarg :ingredient-id)
   (unit
    :accessor unit
    :type string
    :initarg :unit)
   (quantity
    :accessor quantity
    :type float
    :initarg :quantity)))
