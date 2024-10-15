# frozen_string_literal: true

module HanamiMastery
  module Views
    module Articles
      class Index < HanamiMastery::View
        include Deps[repo: 'repos.article_repo']

        expose :items do
          repo.all
        end
      end
    end
  end
end
