class Customers::CustomersController < Devise::RegistrationsController
  # DeviseController
  require 'will_paginate/array'
  before_action :authenticate_scope!, only: [:index, :show, :destroy]

  def index
    @customers = Customer.where("confirmed_at IS NOT NULL").paginate(page: params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
    Customer.find(params[:id]).destroy
    flash[:success] = "Customer deleted"
    redirect_to customers_url
  end

=begin
  private

  def authenticate_customer!
    unless customer_signed_in?
      #store_location
      redirect_to new_customer_session_path
    end
  end
=end
end
