class SheltersController < ApplicationController
  def index
    @shelters = %w(shelter1 shelter2 shelter3)
  end
end