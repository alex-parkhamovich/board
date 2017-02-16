require 'rails_helper'

RSpec.describe "Posts", :type => :request do
  describe "GET /posts" do
    it "Root path render" do
      visit root_path
      expect(page).to have_content("Adverts Board") 
    end
  end
end
