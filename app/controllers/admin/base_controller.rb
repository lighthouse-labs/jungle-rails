class Admin::BaseAdminController < ApplicationController
  before_filter :restrict_user_by_role

  protected

    def restrict_user_by_role
      if current_user.admin == false
        redirect_to '/'
      end
    end
end
