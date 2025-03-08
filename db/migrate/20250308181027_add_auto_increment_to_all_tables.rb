class AddAutoIncrementToAllTables < ActiveRecord::Migration[8.0]
  def up
    # Удаляем внешние ключи, которые ссылаются на таблицу calculations
    remove_foreign_key :alcos, column: :calc_id
    remove_foreign_key :budgets, column: :calc_id
    remove_foreign_key :contractors, column: :calc_id
    remove_foreign_key :controls, column: :calc_id
    remove_foreign_key :guests, column: :calc_id

    # Удаляем столбец id в таблице calculations
    remove_column :calculations, :id

    # Создаем новый столбец id с автоматическим заполнением
    execute <<-SQL
      ALTER TABLE calculations ADD COLUMN id BIGSERIAL PRIMARY KEY;
    SQL

    # Восстанавливаем внешние ключи
    add_foreign_key :alcos, :calculations, column: :calc_id
    add_foreign_key :budgets, :calculations, column: :calc_id
    add_foreign_key :contractors, :calculations, column: :calc_id
    add_foreign_key :controls, :calculations, column: :calc_id
    add_foreign_key :guests, :calculations, column: :calc_id

    # Остальные таблицы
    tables = %w[alcos budgets contractors controls guests]

    tables.each do |table|
      # Удаляем существующий столбец id
      remove_column table, :id

      # Создаем новый столбец id с автоматическим заполнением
      execute <<-SQL
        ALTER TABLE #{table} ADD COLUMN id BIGSERIAL PRIMARY KEY;
      SQL
    end
  end

  def down
    # Удаляем внешние ключи, которые ссылаются на таблицу calculations
    remove_foreign_key :alcos, column: :calc_id
    remove_foreign_key :budgets, column: :calc_id
    remove_foreign_key :contractors, column: :calc_id
    remove_foreign_key :controls, column: :calc_id
    remove_foreign_key :guests, column: :calc_id

    # Удаляем новый столбец id в таблице calculations
    remove_column :calculations, :id

    # Возвращаем старый столбец id
    add_column :calculations, :id, :integer, null: false

    # Восстанавливаем внешние ключи
    add_foreign_key :alcos, :calculations, column: :calc_id
    add_foreign_key :budgets, :calculations, column: :calc_id
    add_foreign_key :contractors, :calculations, column: :calc_id
    add_foreign_key :controls, :calculations, column: :calc_id
    add_foreign_key :guests, :calculations, column: :calc_id

    # Остальные таблицы
    tables = %w[alcos budgets contractors controls guests]

    tables.each do |table|
      # Удаляем новый столбец id
      remove_column table, :id

      # Возвращаем старый столбец id
      add_column table, :id, :integer, null: false
    end
  end
end
