class ReadersController < ApplicationController
  def new
    @reader = Reader.new
  end

  def create
    @reader = Reader.new(reader_params)
    if @reader.save
      session[:reader_id] = @reader.id
      redirect_to root_url, notice: "You registered"
    else
      flash.now[:error] = "Something went wrong"
      render :new
    end
  end

private

  def reader_params
    params.require(:reader).permit(:email, :password, :password_confirmation)
  end
end
