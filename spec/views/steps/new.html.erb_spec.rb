require 'spec_helper'

describe "steps/new" do
  before(:each) do
    assign(:step, stub_model(Step).as_new_record)
  end

  it "renders new step form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", steps_path, "post" do
    end
  end
end
