RSpec.describe Merchant do
  describe "user visits merchant index" do
    context "/merchants" do
      it "index page shows merchant text" do
        visit "/merchants"

        expect(page).to have_content("Merchants")
      end
      it "can click on create a new merchant" do
        visit "/merchants"
        click_link "Create a New Merchant"

        expect(page).to have_content("Create a New Merchant!")
      end
    end
  end
end
