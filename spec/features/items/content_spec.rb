RSpec.describe Item, type: :feature do
  context 'Page content' do
    context 'Index page' do
      it 'says items on top of page' do
        visit '/items'

        expect(page).to have_content('Items')
      end
      it 'shows all the items' do
        Item.create(title: 'Thing', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Another thing', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Something else', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Anything', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Stuff', description: 'x', price: 12, image: 'x')
        visit '/items'

        expect(page).to have_content('Thing')
        expect(page).to have_content('Another thing')
        expect(page).to have_content('Something else')
        expect(page).to have_content('Anything')
        expect(page).to have_content('Stuff')
      end
    end
    context 'Show page' do
      it 'shows item title on top of page' do
        Item.create(title: 'I\'m here', description: 'x', price: 12, image: 'x')
        visit '/items/1'

        expect(page).to have_content('I\'m here')
      end
      it 'shows item description' do
        Item.create(title: 'x', description: 'Ipsum lorum', price: 12, image: 'x')
        visit '/items/1'

        expect(page).to have_content('Ipsum lorum')
      end
      it 'shows item price' do
        Item.create(title: 'x', description: 'x', price: 12, image: 'x')
        visit '/items/1'

        expect(page).to have_content('12')
      end
      it 'shows the item\'s merchant' do
        Item.create(title: 'x', description: 'x', price: 12, image: 'x')
        Merchant.create(name: 'Merch name')
        visit '/items/1'

        expect(page).to have_content('Merch name')
      end
      context 'New page' do
        it 'says new on top of page' do
          visit '/items/new'

          expect(page).to have_content('Create New Item')
        end
        it 'has a form for the new title' do
          visit '/items/new'

          expect(page).to have_selector("input[value='Title']")
        end
        it 'has a form for the new description' do
          visit '/items/new'

          expect(page).to have_selector("input[value='Description']")
        end
        it 'has a form for the new price' do
          visit '/items/new'

          expect(page).to have_selector("input[value='0.00']")
        end
        it 'has a form for the new image URL' do
          visit '/items/new'

          expect(page).to have_selector("input[value='www.example.com/image.jpg']")
        end
      end
    end
  end
end