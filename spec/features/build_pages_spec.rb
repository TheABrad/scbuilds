require 'spec_helper'

describe "Build Pages" do
  describe "Create a Build" do
    before { visit new_build_path }

    let(:build) { FactoryGirl.create(:build) }

    describe "Fill in Build" do
      it "fill's in the build with correct information" do
        fill_in "Title", with: build.title
	fill_in "Body", with:  build.body

	click_button "Submit"
      end
    end
  end
end
