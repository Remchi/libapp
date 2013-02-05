class ReadersController < ApplicationController
  def new
    @reader = Reader.new
  end
end
