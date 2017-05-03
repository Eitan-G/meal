require 'rails_helper'

describe 'GroupShow' do
  feature 'User can leave Hangout', js: true do
    let!(:user) { User.create!(name: 'Matt', email: 'matt@matt.com', password: 'password') }
    let!(:creator) { User.create!(name: 'Max', email: 'max@max.com', password: 'password')}
    let!(:group) { Group.create!(name: "Test", admin_id: user.id) }
    let!(:hangout) {Hangout.create!(group_id: group.id, creator_id: creator.id)}

    before(:each) do
      group.members << creator
      group.members << user
      hangout.members << user

      visit '/'
      fill_in 'Email', with: 'matt@matt.com'
      fill_in 'Password', with: 'password'
      click_on 'Log In'

      click_link('Test', match: :first)
    end

    it "shows leave hangout button" do
      expect(page).to have_content('Leave Hangout')
    end

    it "removes user from hangout and all views associated with a active member of hangout" do
      click_on 'Leave Hangout'
      expect(page).not_to have_content('Restaurants')
    end

  end
end