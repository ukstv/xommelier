# coding: utf-8

################################################
# © Alexander Semyonov, 2011—2013, MIT License #
# Author: Sergey Ukustov <sergey@ukstv.me>     #
################################################

module Xommelier
  module Xml
    class Element
      module Serializable

        # Include this module if you want to map a single value to an {Xommelier::Xml::Element} of complex structure.
        # You have to implement class method `from_xommelier` to construct the value and instance method `to_hash`
        # to decompose the value into a complex structure of the element.
        module Composition
          extend ActiveSupport::Concern
          include Xommelier::Xml::Element::Serializable

          included do
            delegate :xmlns, :elements, :attributes, to: :element
          end

          module ClassMethods
            attr_reader :element
            delegate :xmlns, :elements, :element_name, :attributes, to: :element, allow_nil: true

            # Indicate that the class should be serialized by calling `to_xommelier` just like {Xommelier::Xml::Element}.
            # @return [TrueClass]
            def complex_type?
              true
            end

            # Wrapper for {Xommelier::Xml::Element} declaration body. Sets +element+ for a class.
            #
            #   class Something
            #     include Xommelier::Xml::Element::Composition
            #     element_composition 'SomeElement' do
            #       element :value
            #     end
            #   end
            #
            # @param name [String] Tag name to use.
            # @param element_class [Class] Parent class for a newly defined element. Should be an ancestor of {Xommelier::Xml::Element}.
            # @block {Xommelier::Xml::Element} declaration body.
            def element_composition(name = nil, element_class = Xommelier::Xml::Element, &block)
              @element = Class.new(element_class) do
                define_singleton_method :name do
                  name
                end
                instance_exec(&block)
              end
            end

            def from_xommelier(xml, options = {})
              from_composition(element.from_xommelier(xml, options).to_hash)
            end

            def from_composition(composition)
              raise NotImplementedError.new("You should implement class method `from_hash` in order to deserialize #{composition.inspect} into #{self}.")
            end
          end

          def to_xommelier(options = {})
            element.to_xommelier(options)
          end

          def element
            @element ||= self.class.element.new(to_composition)
          end

          # You should return {Hash} of values to be applied to {Xommelier::Xml::Element} initializer.
          def to_composition
            raise NotImplementedError.new("You should implement #to_composition in order to serialize #{self.class}: #{self.inspect}.")
          end

          # Override standard behaviour of complex type element.
          # @see {Xommelier::Xml::Element::Serializable#to_hash}
          def to_hash
            self
          end
        end
      end
    end
  end
end