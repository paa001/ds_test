class TransactionsController < InheritedResources::Base

  protected

    def collection
      @transactions = end_of_association_chain.on_user(params[:user_id]) if params[:user_id].present?
      @transactions ||= Transaction.all
    end
end
