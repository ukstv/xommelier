# coding: utf-8

################################################
# © Alexander Semyonov, 2011—2013, MIT License #
# Author: Sergey Ukustov <sergey@ukstv.me>     #
################################################

require 'delegate'

module Xommelier
  module Spec
    module Examples
      class MultipliedIntegerComposition < DelegateClass(Integer)
        include Xommelier::Xml::Element::Serializable::Composition

        element_composition 'MultipliedInteger' do
          element :value
          element :tens
        end

        def self.from_composition(composition)
          new(composition[:value].to_i * 10 ** composition[:tens].to_i)
        end

        def to_composition
          value = self.to_s.sub(/0+$/, '').to_i
          {value: value, tens: Math.log((self / value), 10).to_i}
        end
      end
    end
  end
end