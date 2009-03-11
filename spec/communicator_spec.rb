require File.dirname(__FILE__) + '/spec_helper'

describe FsFamilytreeV1::Communicator do
  
  describe "fs_familytree_v1 call on the FsCommunicator" do
    before(:each) do
      @com = FsCommunicator.new
      @ft_com_mock = mock("FsFamilytreeV1::Communicator")
    end
    
    it "should add an fs_familytree_v1 method to the communicator" do
      @com.should respond_to(:fs_familytree_v1)
    end

    it "should return a Communicator object when called" do
      FsFamilytreeV1::Communicator.should_receive(:new).with(@com).and_return(@ft_com_mock)
      famtree_com = @com.fs_familytree_v1
      famtree_com.should == @ft_com_mock
    end
  end
  
  describe "person read" do
    before(:each) do
      @fs_com_mock = mock("FsCommunicator")
      @res = mock("HTTP::Response")
      @xml = fixture_file('person/KJ86-3VD.xml')
      @res.stub!(:body).and_return(@xml)
      @fs_com_mock.stub!(:get).and_return(@res)
      
      @ft_v1_com = FsFamilytreeV1::Communicator.new @fs_com_mock
    end
    
    it "should call get on the FsCommunicator" do
      @fs_com_mock.should_receive(:get).with('/familytree/v1/person/KJ86-3VD').and_return(@res)
      @ft_v1_com.person('KJ86-3VD')
    end
    
    it "should parse the result body from the call" do
      ft = FsFamilytreeV1::Familytree.parse(@xml)
      FsFamilytreeV1::Familytree.should_receive(:parse).with(@xml).and_return(ft)
      @ft_v1_com.person('KJ86-3VD')
    end
    
    it "should return a person of the id requested" do
      id = 'KJ86-3VD'
      person = @ft_v1_com.person(id)
      person.id.should == id
    end
    
  end
  
end