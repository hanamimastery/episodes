# frozen_string_literal: true

module HanamiMastery
  module Views
    module Articles
      class Show < HanamiMastery::View
        include Deps[repo: 'repos.article_repo']

        expose :item do |id:|
          repo.find(id)
        end
      end
    end
  end
end
