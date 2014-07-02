require 'net/http'
require 'json'

module Github
  class User
    API_URL = "https://api.github.com"
    @@users = {}
    attr_accessor :name

    def self.all_users
      @@users.keys
    end

    def info
      @@users[name] ||= github_request("/users/#{name}")
    end

    def id
      info['id']
    end

    def repos
      github_request("/users/#{name}/repos")
    end

    def repos_names
      repos.map{|repo| repo['name']}
    end

    def total_repos_size
      repos.map{|repo| repo['size'].to_i}.inject(&:+)
    end

    def prefferable_languages
      popular_langs = {}
      repos.each do |repo|
        lang = repo['language']
        popular_langs[lang] ||= 0
        popular_langs[lang] += 1
      end
      popular_langs.max
    end

    private

    def github_request(path)
      JSON.parse(Net::HTTP.get(URI.parse("#{API_URL}#{path}")))
    end
  end
end