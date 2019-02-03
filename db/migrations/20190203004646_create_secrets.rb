Hanami::Model.migration do
  change do
    create_table :secrets do
      primary_key :id

      column :login,  String, null: false
      column :secret, String, null: false
      
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
