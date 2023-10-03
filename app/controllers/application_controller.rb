# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ApiResponders
  include ApiRescuable
  include Pagy::Backend
end
