class Customers::CustomersController < Devise::SessionsController
  require 'will_paginate/array'

  def index
    @customers = Customer.all.paginate(page: params[:page])
  end

  def show
    @customer = Customer.find(params[:format])
  end

  def destroy
    Customer.find(params[:format]).destroy
    flash[:success] = "Customer deleted"
    redirect_to customers_url
  end
end
