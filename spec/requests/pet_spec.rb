require 'rails_helper'

RSpec.describe "Pets", type: :request do
  let!(:pets) {create_list(:pet, 10)}
  let(:pet_id) {pets.first.id}

  describe "GET /pets" do
    before { get '/pets'}

    it 'returns pets' do 
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end 

    it 'returns status code 200' do 
      expect(response).to have_http_status(200)
    end 
  end

  describe 'GET /pets/:id' do 
    before {get "/pets/#{pet_id}" }

    context 'when the record exists' do 
      it 'returns the pet' do 
        expect(json).not_to be_empty
        expect(json['id']).to eq(pet_id)
      end
      
      it 'returns status code 200' do 
        expect(response).to have_http_status(200)
      end 
    end 

    context 'when the record does not exist' do 
      let(:pet_id) {100}

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do 
        expect(response.body).to match(/Couldn't find Pet/)
      end 
    end 
  end 

  describe 'POST /pets' do 
    let(:valid_attributes) { {name: 'Jock', animal: 'Corgi' } }

    context 'when the request is valid' do 
      before {post '/pets', params: valid_attributes}

      it 'creates a pet' do 
        expect(json['name']).to eq('Jock')
      end 

      it 'returns status code 201' do 
        expect(response).to have_http_status(201)
      end
    end 

    context 'when the request is invalid' do
      before {post '/pets', params: {Name: 'Charlie'}}
      
      it 'returns status code 422' do 
        expect(response).to have_http_status(422)
      end 

      it 'returns a validation failure message' do 
        expect(response.body).to match(/Could'nt create pet/)
      end 
    end 
  end

  describe 'PUT /pets/:id' do 
    let(:valid_attributes) {{ name: 'Heidi'} }

    context 'when the record exists' do 
      before { put "/pets/#{pet_id}", params: valid_attributes }

      it 'updates the record' do 
        expect(response.body).to be_empty
      end 
     
      it 'returns status code 204' do 
        expect(response).to have_http_status(204)
      end 
    end 
  end 
  
  describe 'DELETE /pets/:id' do 
    before { delete "/pets/#{pet_id}"}

    it 'returns status code 204' do 
      expect(response).to have_http_status(204)
    end 
  end 
end