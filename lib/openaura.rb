module Openaura
  class Resource
    HOST = "api.openaura.com"

    attr_accessor :path, :query_hash

    def initialize(path, query_hash)
      @path = path
      @query_hash = query_hash
    end

    def url
      url ||= URI::HTTP.build({
        host: HOST,
        path: path,
        query: query_hash.to_query,
      })
    end

    # Performs a get request to the remote URL, parses the response as
    # as JSON, and caches it.
    def content
      @content ||= begin
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
          http.request(req)
        }
        JSON.parse(res.body)
      end
    end

  end

  class ClassicResource < Resource
    attr_accessor :artist_id, :api_key

    def initialize(artist_id, api_key)
      @artist_id = artist_id
      @api_key = api_key

      super(path, query_hash)
    end

    def path
      @path ||= "/" + [ "v1", "classic", "artists", artist_id ].join("/")
    end

    def query_hash
      @query_hash ||= {
        id_type: "oa:artist_id",
        api_key: api_key,
      }
    end

    # Returns the name of the artist, as a string.
    def name
      @name ||= content['name']
    end

  end

end
