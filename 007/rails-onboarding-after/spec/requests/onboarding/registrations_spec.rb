require 'rails_helper'

RSpec.describe 'Onboarding::RegistrationsController', type: :request do
  describe '#create' do
    let(:headers) { {} }
    subject { post '/onboarding/signup', params: params, headers: headers }

    shared_examples_for 'failure' do
      it 'does not create the user' do
        expect { subject }.not_to change { User.count }
      end
    end

    context 'when deserialization fails' do
      let(:params) { { name: 'You', email: 'subscribe@hanamimastery.com' } }

      it 'returns 400' do
        subject
        expect(response).to have_http_status(:bad_request)
        expect(response.body).to be_empty
      end

      it 'does not create the user' do
        expect { subject }.not_to change { User.count }
      end
    end

    context 'when authorization fails' do
      let(:params) { { user: { name: 'You', email: 'subscribe@hanamimastery.com' } } }

      it 'returns 403' do
        subject
        expect(response).to have_http_status(:forbidden)
        expect(response.body).to be_empty
      end

      it_behaves_like 'failure'
    end

    context 'when validation fails'  do
      let(:params) { { user: { name: '', email: 'subscribe@hanamimastery.com' } } }
      let(:headers) { { 'Authorization' => 'Bearer secret' } }

      it 'returns 422' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
        json = JSON.parse(response.body)['errors']
        expect(json['name']).to contain_exactly('must be filled')
      end

      it_behaves_like 'failure'
    end

    context 'when business logic fails' do
      let(:params) { { user: { name: 'You', email: 'subscribe@hanamimastery.com' } } }
      let(:headers) { { 'Authorization' => 'Bearer secret' } }

      before do
        User.create(name: 'Me', email: 'sebastian@hanamimastery.com')
      end

      it 'returns 418' do
        subject
        expect(response).to have_http_status(418)
        json = JSON.parse(response.body)['errors']
        expect(json).to eq('too many subscriptions! Try again later')
      end

      it_behaves_like 'failure'
    end

    context 'successful request' do
      let(:params) { { user: { name: 'You', email: 'subscribe@hanamimastery.com' } } }
      let(:headers) { { 'Authorization' => 'Bearer secret' } }

      it 'returns 201' do
        subject
        expect(response).to have_http_status(:created)
        expect(response.body).to be_empty
      end

      it 'creates a user' do
        expect(User.exists?(email: 'subscribe@hanamimastery.com')).to be_falsey
        expect { subject }.to change { User.count }.by(1)
        expect(User.exists?(email: 'subscribe@hanamimastery.com')).to be_truthy
      end
    end
  end
end
