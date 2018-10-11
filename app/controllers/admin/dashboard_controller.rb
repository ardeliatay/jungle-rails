class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV['HTTP_BASIC_AUTHENTICATE_WITH_NAME'],
  :password      => ENV['HTTP_BASIC_AUTHENTICATE_WITH_PASSWORD']
  def show
  end
end
