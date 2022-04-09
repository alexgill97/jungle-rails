class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTHENTICATION_USERNAME'], password: ENV['AUTHENTICATION_PASSWORD'], except: [:new, :show, :edit, :create]
  def show
  end
end
