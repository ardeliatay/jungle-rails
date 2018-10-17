require 'rails_helper'

RSpec.feature "User adds one product to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end


  scenario "Cart updates by one" do
    # ACT
    visit root_path

    first('article.product').click_button'Add'
    # DEBUG 
    sleep 3
    save_screenshot

  end

end
