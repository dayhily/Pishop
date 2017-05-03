class CreateOrders < ActiveRecord::Migration[5.0]
 def change
     #Создание таблицы с полями в БД
    create_table :orders do |t|
      t.text    :orders_input
      t.text    :name
      t.text    :phone
      t.text    :address

      t.timestamps
    end
  end
end
