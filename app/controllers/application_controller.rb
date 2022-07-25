class ApplicationController < ActionController::Base
    def logged_in_user
        unless current_user.present?
            flash[:alert] = "Please login first"
            redirect_to root_path
        end
    end
end
