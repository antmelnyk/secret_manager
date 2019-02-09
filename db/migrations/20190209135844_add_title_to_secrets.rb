Hanami::Model.migration do
  change do
    alter_table :secrets do
      add_column :title, String
    end
  end
end
