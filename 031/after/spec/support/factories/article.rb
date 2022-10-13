# frozen_string_literal: true

Factory.define(:article, struct_namespace: Sandbox::Entities) do |f|
  f.association(:author)
end

Factory.define(published_article: :article) do |f|
  f.published_on Date.today
end
