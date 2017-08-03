require 'rails_helper'

RSpec.describe SubmissionsController, type: :controller do

  before(:each) do
    @illness = FactoryGirl.create(:illness)
    @installation = FactoryGirl.create(:installation, locality: "")
  end

  describe '#create' do
    it "increments Submission by 1" do
      expect{post :create, params: {submission: {relationship: "self", ip_address: Faker::Internet.public_ip_v4_address, illness_id: @illness.id, locality: @installation.locality}}}.to change(Submission,:count).by(1)
    end

    it "redirects to the new submission" do
      post :create, params: {submission: {relationship: "self", ip_address: Faker::Internet.public_ip_v4_address, illness_id: @illness.id, locality: @installation.locality}}
      expect(response).to redirect_to @installation
    end
  end

end
