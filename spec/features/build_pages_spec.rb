require 'spec_helper'

describe "Build Pages" do
  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }
 
  describe "Create a Build" do
    before(:all) do 
      visit new_build_path
    end

    let(:build) { FactoryGirl.create(:build) }

    describe "Fill in Build" do
      it "fill's in the build with correct information" do
        fill_in "Title", with: build.title
        select("Protoss", :from => "build_race") 
        select("Terran", :from => "build_vs_race") 
        fill_in "Body", with:  build.body 
	fill_in "Replays", with: build.replays
       
       	click_button "Create Build"
      end
    end
  end
end
