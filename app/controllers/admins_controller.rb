class AdminsController < ApplicationController
  before_action :authenticate_admin!

  # GET /admins/1
  # GET /admins/1.json
  def show
  end
end
