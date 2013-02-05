class SessionsController < ApplicationController

  def new
    @login = Login.new
  end
  
end
