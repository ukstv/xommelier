# This file is automatically generated
# Please do not edit it

require 'xommelier/xml/schema'

module Xommelier
  # Simple DC XML Schema, 2002-10-09
  # by Pete Johnston (p.johnston@ukoln.ac.uk),
  # Carl Lagoze (lagoze@cs.cornell.edu), Andy Powell (a.powell@ukoln.ac.uk),
  # Herbert Van de Sompel (hvdsomp@yahoo.com).
  # This schema defines terms for Simple Dublin Core, i.e. the 15
  # elements from the http://purl.org/dc/elements/1.1/ namespace, with
  # no use of encoding schemes or element refinements.
  # Default content type for all elements is xs:string with xml:lang
  # attribute available.
  # Supercedes version of 2002-03-12. 
  # Amended to remove namespace declaration for http://www.w3.org/XML/1998/namespace namespace,
  # and to reference lang attribute via built-in xml: namespace prefix.
  # xs:appinfo also removed.
  schema :xmlns, xmlns: {xs: "http://www.w3.org/2001/XMLSchema", xmlns: "http://purl.org/dc/elements/1.1/"}, elementFormDefault: "qualified", attributeFormDefault: "unqualified" do
    namespace "http://purl.org/dc/elements/1.1/", as: :xmlns
    import "http://www.w3.org/XML/1998/namespace", schemaLocation: "http://www.w3.org/2001/03/xml.xsd"
    element :title, type: :elementType
    element :creator, type: :elementType
    element :subject, type: :elementType
    element :description, type: :elementType
    element :publisher, type: :elementType
    element :contributor, type: :elementType
    element :date, type: :elementType
    element :type, type: :elementType
    element :format, type: :elementType
    element :identifier, type: :elementType
    element :source, type: :elementType
    element :language, type: :elementType
    element :relation, type: :elementType
    element :coverage, type: :elementType
    element :rights, type: :elementType
    group :elementsGroup do
      sequence do
        choice min: 0, max: :unbounded do
          element ref: :title
          element ref: :creator
          element ref: :subject
          element ref: :description
          element ref: :publisher
          element ref: :contributor
          element ref: :date
          element ref: :type
          element ref: :format
          element ref: :identifier
          element ref: :source
          element ref: :language
          element ref: :relation
          element ref: :coverage
          element ref: :rights
        end
      end
    end
    complex_type :elementType do
      simple_content base: ns.xs.string do
        attribute ref: ns.xml.lang, required: false
      end
    end
  end
end