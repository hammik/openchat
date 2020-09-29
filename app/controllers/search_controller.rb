class SearchController < ApplicationController
    def show

    end
    
    private
    def search_group(aimai_name)
      Groups.where('name like ?','%aimai_name%')
    end
end

