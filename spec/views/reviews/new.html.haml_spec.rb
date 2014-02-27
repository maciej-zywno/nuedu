require 'spec_helper'

describe "reviews/new" do
  before(:each) do
    assign(:review, stub_model(Review,
      :content => "MyText",
      :user => nil,
      :course => nil,
      :stars => 1,
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", reviews_path, "post" do
      assert_select "textarea#review_content[name=?]", "review[content]"
      assert_select "input#review_user[name=?]", "review[user]"
      assert_select "input#review_course[name=?]", "review[course]"
      assert_select "input#review_stars[name=?]", "review[stars]"
      assert_select "input#review_status[name=?]", "review[status]"
    end
  end
end
