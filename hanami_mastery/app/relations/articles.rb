# frozen_string_literal: true

module HanamiMastery
  module Relations
    class Articles < HanamiMastery::DB::Relation
      schema :articles, infer: true
    end
  end
end
