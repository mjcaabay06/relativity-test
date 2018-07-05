class ExamController < ApplicationController
  def index
  end

  def done
    session[:log] = nil
    redirect_to '/'
  end
end
