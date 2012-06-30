require 'spec_helper'

describe "jobs/show" do
  before(:each) do
    @job = assign(:job, stub_model(Job,
      :title => "Title",
      :cost => 1,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
  end
end
