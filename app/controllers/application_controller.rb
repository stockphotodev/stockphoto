class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.instance_of?(User)
      new_test_path
    elsif resource.instance_of?(AdminUser)
      root_path
    end
  end
end
