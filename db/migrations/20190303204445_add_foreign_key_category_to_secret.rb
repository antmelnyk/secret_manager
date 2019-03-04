Hanami::Model.migration do
  change do
    alter_table :secrets do
      add_foreign_key :category_id, :categories, on_delete: :cascade
    end
  end
end
