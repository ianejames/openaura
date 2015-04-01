require 'openaura'

class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show]

  def show
  end

  private

    def set_artist
      @classic_resource = Openaura::ClassicResource.new(params[:id], ENV['OPENAURA_API_KEY'])
      @particles_resource = Openaura::ParticlesResource.new(params[:id], ENV['OPENAURA_API_KEY'])
    end
end
