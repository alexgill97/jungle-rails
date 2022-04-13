require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature, js: true do

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

  scenario "They see the product detail page" do
    visit root_path
    first("article.product").find_link("Details").click
    puts page.html
    expect(find("section.products-show").visible?).to be true

  end
end 