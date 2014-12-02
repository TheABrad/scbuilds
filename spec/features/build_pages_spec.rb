require 'spec_helper'

describe 'Build Pages' do
  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }

  describe 'Create a Build' do
    before(:all) do
      visit new_build_path
    end

    describe 'Fill in Build' do
      it 'fills in the build with correct information' do
        fill_in 'Title', with: 'TitleBuild'
        choose 'build_race_protoss'
        choose 'build_vs_race_terran'
        select('Macro', from: 'build_build_type')
        fill_in 'Body', with: 'Lorem Ipsum'
        fill_in 'Replays', with: 'http://drop.sc/11111'

        expect { click_button 'Create Build' }.to change(Build, :count).by(1)
      end
    end
  end
end
