require 'spec_helper'

describe ListsController do
  
  describe "GET 'index'" do
    let(:list){ List.create!(name: "test") }
    let(:expected){ [{"id" => 1, "name" => "test"}] }
    before do
      list
    end
    it "should return the list of lists" do
      get :index, format: :json
      ActiveSupport::JSON.decode(response.body).should == expected
    end
  end
  
  describe "POST 'create'" do
    let(:list){ double("List") }
    
    it "should fail" do
      List.any_instance.stub(:save){ false }
      expected = { "status" => "unprocessable_entity", "errors" => []  }
      post :create, :format => :json, :list => { :name => "test" }
      ActiveSupport::JSON.decode(response.body).should == expected
    end
    
    it "should be success" do
      expected = {"id" => 1, "name" => "test"}
      post :create, :format => :json, :list => { :name => "test" }
      ActiveSupport::JSON.decode(response.body).should == expected
    end
    
  end
end
