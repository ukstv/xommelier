# coding: utf-8

################################################
# © Alexander Semyonov, 2011—2013, MIT License #
# Author: Sergey Ukustov <sergey@ukstv.me>     #
################################################

module Xommelier
  module Spec
    module Examples
      module NamespacedModule
        include Xommelier::Xml

        xmlns 'http://example.org/'

        class RootWithText < Xommelier::Xml::Element
          text
        end

        class RootWithSimpleSubelement < Xommelier::Xml::Element
          element :some
        end

        class RootWithFixedSubelement < Xommelier::Xml::Element
          element :some, fixed: 'FOO'
        end

        class RootWithAttribute < Xommelier::Xml::Element
          attribute :one, type: Date
          attribute :another
        end

        class RootWithManySimpleSubelements < Xommelier::Xml::Element
          element :foo, count: :many
        end

        class RootWithSubelement < Xommelier::Xml::Element
          attribute :one, type: Date
          attribute :two
          element :some
          element :another, type: RootWithSimpleSubelement
        end

        class ClassWithElementStructure
          include Xommelier::Xml::Element::Structure

          element :custom_element
        end
      end
    end
  end
end
