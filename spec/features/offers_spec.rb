require 'rails_helper'

RSpec.describe "Offers as :client", type: :feature do

  let!(:offers) { create_list(:offer, 15) }

  describe "offer index page" do

    it "should show right amount of offers" do
      visit "/" 
      expect(page).to have_selector('.offer', count: offers.count)
    end

    it "should have footer content" do
      visit "/"
      expect(page). to have_content('Faça parte das nossas redes sociais')
    end

    it "should respond to click on offer", js: true do
      visit "/"
      offer = offers.sample
      find("#open_#{offer.id}").click
      expect(page).to have_selector(".open")
    end

  end

end