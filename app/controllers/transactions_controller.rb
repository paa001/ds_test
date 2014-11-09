class TransactionsController < InheritedResources::Base
  respond_to :json, except: [:edit, :new]

  private

    def permitted_params
      params.permit(transaction: [:user_id, :balance_id, :value])
    end

  protected

    def collection
      @transactions = end_of_association_chain.on_user(params[:user_id]) if params[:user_id].present?
      @transactions ||= Transaction.all
    end
end
