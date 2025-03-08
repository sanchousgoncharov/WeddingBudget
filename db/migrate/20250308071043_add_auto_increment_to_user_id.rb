class AddAutoIncrementToUserId < ActiveRecord::Migration[8.0]
  def up
    # Удаляем внешний ключ, который ссылается на столбец id
    remove_foreign_key :calculations, :users

    # Удаляем существующий столбец id
    remove_column :users, :id

    # Создаем новый столбец id с автоматическим заполнением
    execute <<-SQL
      ALTER TABLE users ADD COLUMN id BIGSERIAL PRIMARY KEY;
    SQL

    # Восстанавливаем внешний ключ
    add_foreign_key :calculations, :users
  end

  def down
    # Удаляем внешний ключ
    remove_foreign_key :calculations, :users

    # Удаляем новый столбец id
    remove_column :users, :id

    # Возвращаем старый столбец id
    add_column :users, :id, :bigint, null: false

    # Восстанавливаем внешний ключ
    add_foreign_key :calculations, :users
  end
end
