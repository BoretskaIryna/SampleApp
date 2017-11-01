class Customers::CustomersController < Devise::SessionsController
  require 'will_paginate/array'
  before_action :authenticate_customer!, only: [:index, :show, :destroy]

  def index
    @customers = Customer.where("confirmed_at IS NOT NULL").paginate(page: params[:page])
  end

  def show
    @customer = Customer.find(params[:format])
  end

  def destroy
    Customer.find(params[:format]).destroy
    flash[:success] = "Customer deleted"
    redirect_to customers_url
  end

  private

  def authenticate_customer!
    unless customer_signed_in?
      #store_location
      redirect_to new_customer_session_path
    end
  end
end
