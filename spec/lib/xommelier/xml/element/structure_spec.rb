# coding: utf-8

################################################
# © Alexander Semyonov, 2011—2013, MIT License #
# Authors: Alexander Semyonov <al@semyonov.us> #
#          Sergey Ukustov <sergey@ukstv.me>    #
################################################

require 'spec_helper'

describe Xommelier::Xml::Element::Structure do
  NamespacedModule = Xommelier::Spec::Examples::NamespacedModule

  describe 'defines subelements' do
    context 'for instance of Element' do
      subject { NamespacedModule::RootWithSimpleSubelement }

      it { should respond_to(:elements) }
      it { should respond_to(:element) }
      its(:elements) { should have_key(:some) }
    end

    context 'for custom class' do
      subject { NamespacedModule::ClassWithElementStructure }

      it { should respond_to(:elements) }
      it { should respond_to(:element) }
      its(:elements) { should have_key(:custom_element) }
    end
  end

  describe 'defines attribute' do
    subject { NamespacedModule::RootWithAttribute }

    it { should respond_to(:attributes) }
    it { should respond_to(:attribute) }
    its(:attributes) { should have_key(:another) }
  end

  describe 'defines text container' do
    subject { NamespacedModule::RootWithText.new }

    it { should respond_to(:text) }
    its(:class) { should respond_to(:text) }
  end

  describe 'handles xml namespaces' do
    subject { NamespacedModule::RootWithSimpleSubelement }
    its('xmlns.uri') { should eq 'http://example.org/' }
  end

  context 'fixed element value' do
    let(:xommelier) { NamespacedModule::RootWithFixedSubelement }
    let(:xml) do
      '<root-with-fixed-subelement><some>33</some></root-with-fixed-subelement>'
    end
    specify 'prohibits wrong value' do
      expect do
        xommelier.from_xml(xml)
      end.to raise_error(Xommelier::FixedValueError)
    end
  end

end
