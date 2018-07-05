class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_log

  def index
  end

  def create
    session[:log] = Rails.application.secrets.secret_key_base
    redirect_to '/exam'
  end

  private
    def check_log
      redirect_to '/exam' if session[:log].present?
    end
end
