class ApplicationController < ActionController::Base

  # 顧客はログインしないとaboutページ以外遷移できない設定
  # before_action :authenticate_customer!, except: [:about]
  # 管理者はログインしないとaboutページ以外遷移できない設定
  # before_action :authenticate_admin!, except: [:about]
end
