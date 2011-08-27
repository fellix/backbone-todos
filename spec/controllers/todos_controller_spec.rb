require 'spec_helper'

describe TodosController do
  let(:list){ List.create!(name: "test") }
  
  describe "GET 'index'" do
    let(:todo){ Todo.create!(name: "todo 1", list_id: list.id) }
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
      Todo.any_instance.stub(:save){ false }
      expected = { "status" => "unprocessable_entity", "errors" => []  }
      post :create, :format => :json, :list_id => list.id, :todo => {:name => "todo 1", done: false}
      ActiveSupport::JSON.decode(response.body).should == expected
    end
    
    it "should be success" do
      expected = {"id" => 1, "name" => "todo 1", "done" => false}
      post :create, :format => :json, :list_id => list.id, :todo => {:name => "todo 1", done: false}
      ActiveSupport::JSON.decode(response.body).should == expected
    end
    
  end
  
end
