class ApplicationController < ActionController::Base
  respond_to :json, only: [:index, :show]
end
