class Admin::DashboardController < ApplicationController
   extend AdminHelper
  Admin::CategoriesController.authenticate_with
  def show
  end
end
