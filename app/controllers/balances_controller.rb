class BalancesController < InheritedResources::Base
  respond_to :json, only: [:index, :show]
end
