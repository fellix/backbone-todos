require 'spec_helper'

describe List do
  let(:list){ List.new name: "test" }
  it "returns only the id and the name" do
    list.as_json.keys.should == %w[id name]
  end
  
  it "returns a valid json" do
    list.as_json.should eq({"id"=>nil, "name"=>"test"})
  end
  
end
