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
    
    it "should fail" do
      expected = { "status" => "unprocessable_entity", "errors" => ["Name can't be blank"]  }
      post :create, :format => :json, :list => { :name => nil }
      ActiveSupport::JSON.decode(response.body).should == expected
    end
    
    it "should be success" do
      expected = {"id" => 1, "name" => "test"}
      post :create, :format => :json, :list => { :name => "test" }
      ActiveSupport::JSON.decode(response.body).should == expected
    end
    
  end
  
  describe "PUT 'update'" do
    let(:list){ List.create! name: "the list" }
    
    it "should fail" do
      expected = { "status" => "unprocessable_entity", "errors" => ["Name can't be blank"]  }
      put :update, :format => :json, :id => list.id, :list => { :name => nil }
      ActiveSupport::JSON.decode(response.body).should == expected
    end
    
    it "should be success" do
      expected = {"id" => 1, "name" => "test"}
      put :update, :format => :json, :id => list.id, :list => { :name => "test" }
      ActiveSupport::JSON.decode(response.body).should == expected
    end
  end
  
end
