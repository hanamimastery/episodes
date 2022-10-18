# frozen_string_literal: true

RSpec.describe Sandbox::Interactors::Articles::Publish do
  let(:repo) { Sandbox::App.container['repositories.articles'] }
  subject { Sandbox::App.container['interactors.articles.publish'] }

  context 'when given article does not exist' do
    it 'fails with not_found' do
      res = subject.call(999)
      expect(res).to be_failure
      expect(res).to eq(Failure[:not_found, id: 999])
    end
  end

  context 'when given article is already published', effects: :current_time do
    let(:article) { repo.create(published_on: Date.parse('2022-09-09')) }

    it 'succeeds with not_modified' do
      res = subject.call(article.id)
      aggregate_failures do
        expect(res).to be_success
        expect(res.value!).to eq(:not_modified)
        fetched_article = repo.find(article.id)
        expect(fetched_article.updated_at).to eq(article.updated_at)
        expect(fetched_article.published_on).to eq(article.published_on)
      end
    end
  end

  context 'when given article is not published', effects: :current_time do
    let(:article) { repo.create(published_on: nil) }

    it 'results with success' do
      res = subject.call(article.id)

      aggregate_failures do
        expect(res).to be_success
        expect(res.value!).to eq(:ok)
        fetched_article = repo.find(article.id)
        expect(fetched_article.updated_at).to eq(current_time)
        expect(fetched_article.published_on).to eq(current_time.to_date)
      end
    end
  end
end
