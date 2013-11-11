# coding: utf-8

################################################
# © Alexander Semyonov, 2011—2013, MIT License #
# Authors: Sergey Ukustov <sergey@ukstv.me>    #
#          Alexander Semyonov <al@semyonov.us> #
################################################

require 'spec_helper'

describe Xommelier::Xml::Element::Serializable do
  describe 'class' do
    subject { Xommelier::Atom::Feed }

    it { should respond_to(:parse) }
  end
end
