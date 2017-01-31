class Profile::ApplicationController < ApplicationController
  before_action :authenticate_user!
  
  layout 'profile'
end