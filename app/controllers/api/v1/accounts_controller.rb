class Api::V1::AccountsController < ApplicationController

  def show
    account = Account.find(params[:id])

    if account.secret_valid?(params[:secret_key])
      render json: account, status: :ok
    else
      render json: {}, status: :not_acceptable
    end
  end

  def create
    account = AccountCreationFacade.new
    render json: account.request, status: account.status
  end
end
