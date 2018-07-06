class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_log

  def index
    start_session unless params[:start].blank?
  end

  def create
    start_session
  end

  private
    def check_log
      redirect_to '/exam' if session[:log].present?
    end

    def start_session
      session[:log] = Rails.application.secrets.secret_key_base
      redirect_to '/exam'
    end
end
