class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    # admin/ordersのindexページへ遷移する
  end


end
