# coding: utf-8

################################################
# © Alexander Semyonov, 2011—2013, MIT License #
# Author: Sergey Ukustov <sergey@ukstv.me>     #
################################################

require 'spec_helper'

describe Xommelier::Xml::Element::Serializable::Composition do

  it "maps a value to/from complex xommelier element" do
    MultipliedInteger = Xommelier::Spec::Examples::MultipliedIntegerComposition
    value = 33
    MultipliedInteger.from_xommelier(MultipliedInteger.new(value).to_xommelier).should eq value
  end

end
