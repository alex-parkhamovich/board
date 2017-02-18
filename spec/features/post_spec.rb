require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category)}
  let(:post) do
    Post.create(category_id: category.id, title: "Title", price: "100", description: "Description",
                deal: "Sale", user_id: user.id)
  end

  before do
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit root_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end
  end

  describe 'new post' do
    it 'has a link from the homepage' do
      visit root_path

      click_link("New Post")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do

    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from New Post page' do
      category = FactoryGirl.create(:category)

      find(:select, 'Category').first(:option, category.title).select_option
      fill_in "Title", with: "QWE"
      fill_in "Price", with: "100"
      fill_in "Description", with: "Desc"
      attach_file("Photo", Rails.root + 'spec/fixtures/test.jpg')
      select "Sale", from: "Deal"

      click_on "Create Post"

      visit profile_root_path

      expect(page).to have_content("QWE")
    end
  end

  describe 'has links for changing status' do
    it 'has a posts and link for changing status' do

      visit profile_root_path
      expect(page).to have_content("Review")
    end
  end
end