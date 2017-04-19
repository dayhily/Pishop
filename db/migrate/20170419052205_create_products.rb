class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    #Создание таблицы с полями в БД
    create_table :products do |t|
      t.string  :title
      t.text    :description
      t.decimal :price
      t.decimal :size
      t.boolean :is_spicy
      t.boolean :is_veg
      t.boolean :is_best_offer
      t.string  :path_to_img
      t.timestamps
    end
  end
end
