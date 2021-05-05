class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :update, :new]
  def index
   
  end
end
