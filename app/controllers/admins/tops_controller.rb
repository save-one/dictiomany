class Admins::TopsController < Admins::ApplicationController
	before_action :authenticate_admin!

  def show
  end
end
