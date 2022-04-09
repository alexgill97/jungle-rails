class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTHENTICATION_USERNAME'], password: ENV['AUTHENTICATION_PASSWORD'], except: [:new, :show, :edit, :create]
  def show
    @num_products = Product.count()
    @num_categories = Category.count()
  end
end
