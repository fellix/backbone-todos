require 'spec_helper'

describe TodosController do
  let(:list){ List.create!(name: "test") }
  let(:todo){ Todo.create!(name: "todo 1", list_id: list.id) }
  
  describe "GET 'index'" do
    let(:expected){ [{"id" => 1, "name" => "todo 1", "done" => false}] }
    before do
      todo
    end
    it "should return the list of lists" do
      get :index, format: :json, :list_id => list.id
      ActiveSupport::JSON.decode(response.body).should == expected
    end
  end
  
  describe "POST 'create'" do
    it "should fail" do
      expected = { "status" => "unprocessable_entity", "errors" => ["Name can't be blank"]  }
      post :create, :format => :json, :list_id => list.id, :todo => {:name => nil, done: false}
      ActiveSupport::JSON.decode(response.body).should == expected
    end
    
    it "should be success" do
      expected = {"id" => 1, "name" => "todo 1", "done" => false}
      post :create, :format => :json, :list_id => list.id, :todo => {:name => "todo 1", done: false}
      ActiveSupport::JSON.decode(response.body).should == expected
    end
    
  end
  describe "PUT 'update'" do
    before do
      todo
    end
    it "should fail" do
      expected = { "status" => "unprocessable_entity", "errors" => ["Name can't be blank"]  }
      put :update, :format => :json, :list_id => list.id, :id => todo.id, :todo => { :name => nil }
      ActiveSupport::JSON.decode(response.body).should == expected
    end
    
    it "should be sucessful" do
      expected = {"id" => 1, "name" => "test", "done" => false}
      put :update, :format => :json, :list_id => list.id, :id => todo.id, :todo => { :name => "test" }
      ActiveSupport::JSON.decode(response.body).should == expected
    end
  end
  
  describe "DELETE 'destroy'" do
    it "should be sucessful" do
      expected = {"id" => 1, "name" => "todo 1", "done" => false}
      delete :destroy, :format => :json, :list_id => list.id, :id => todo.id
      ActiveSupport::JSON.decode(response.body).should == expected
    end
  end
  
end
