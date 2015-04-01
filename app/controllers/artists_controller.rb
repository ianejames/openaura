require 'openaura'
require 'core_ext/array/interleave'

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
      @artist.particles = sort_particles(@particles_resource.particles)
    end

    # Given an array of particles, sorts them and returns the sorted array.
    def sort_particles(particles)
      particles_by_source_id = particles.group_by {|p| p['source']['oa_source_id'] }

      # The following code generates an array of hashes, each hash
      # representing one source. The hash has the id of the source, an array
      # of particles from that source, and the date of the most recent
      # particle.
      sources = particles_by_source_id.map do |source_id, particles|
        max_date = particles.map {|p| Date.parse(p['date']) }.max
        { id: source_id, particles: particles, max_date: max_date }
      end

      # Source with most recent particles sorted first.
      sources = sources.sort_by {|s| s[:max_date] }.reverse

      # Creates an array of particle groups, then chooses them in a
      # round-robin fashion to create a flat array of particles.
      sources.map {|s| s[:particles] }.interleave
    end
end
