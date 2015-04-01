require 'openaura'

class ArtistsController < ApplicationController
  class Artist
    attr_accessor :name, :particles
  end

  before_action :set_artist, only: [:show]

  def show
  end

  private

    def set_artist
      @classic_resource = Openaura::ClassicResource.new(params[:id], ENV['OPENAURA_API_KEY'])
      @particles_resource = Openaura::ParticlesResource.new(params[:id], ENV['OPENAURA_API_KEY'])

      @artist = Artist.new
      @artist.name = @classic_resource.name
      @artist.particles = @particles_resource.particles
    end
end
