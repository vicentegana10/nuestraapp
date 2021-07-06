class ApplicationController < ActionController::Base
  before_action :set_user

  private
  def set_user
    if current_user == nil
      #@user = User.first
      def some_method
      end
    else
      @user = current_user
    end
    
  end
end
