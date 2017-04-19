class AddProducts < ActiveRecord::Migration[5.0]
  def change
    #Первоначальное наполнение полей модели Product
    Product.create ({
      :title => 'Hawaiian',
      :description => 'Hawaiian pizza is made up of a dough crust, tomato sauce, ham pieces, and pineapple rings or chunks. Often versions will have mixed peppers, mushrooms and bacon.',
      :price => 8.90,
      :size => 30,
      :is_spicy => false,
      :is_veg => false,
      :is_best_offer => false,
      :small_img => '/images/hawaii.jpg',
      :big_img => '/images/bhawaii.jpg'
    })
    
    Product.create ({
      :title => 'Veggie',
      :description => 'Veggie pizza is made up with crescent roll dough, a mixture of cream cheese, sour cream, and ranch salad dressing, and topped with chopped vegetables and cheese.',
      :price => 11.50,
      :size => 40,
      :is_spicy => false,
      :is_veg => true,
      :is_best_offer => true,
      :small_img => '/images/veg.jpg',
      :big_img => '/images/bveg.jpg'
    })
    
    Product.create ({
      :title => 'Pepperoni',
      :description => 'A beautifully braided pizza crust stuffed with pepperoni, pizza sauce and tons of ooey-gooey melted cheese.',
      :price => 12.60,
      :size => 50,
      :is_spicy => true,
      :is_veg => false,
      :is_best_offer => false,
      :small_img => '/images/pepperoni.jpg',
      :big_img => '/images/bpepperoni.jpg'
    })
  end
end
