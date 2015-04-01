require 'openaura'

class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show]

  def show
  end

  private

    def set_artist
      @artist = Openaura::ClassicResource.new(params[:id], ENV['OPENAURA_API_KEY'])
      @particles = Openaura::ParticlesResource.new(params[:id], ENV['OPENAURA_API_KEY'])
    end
end
