class SearchController < ApplicationController
    def index
        @sites = Sites.all
    end
end