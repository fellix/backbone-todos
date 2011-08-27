require 'spec_helper'

describe Todo do
  let(:todo){ Todo.new name: "test", done: false }
  it "returns only the id, the name and the done flag" do
    todo.as_json.keys.should == %w[done id name]
  end
  
  it "returns a valid json" do
    todo.as_json.should eq({"id"=>nil, "name"=>"test", "done" => false})
  end
end
