Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id

      column :github_id, Integer, null: false, unique: true
      column :email, String, null: false, unique: true
      column :name, String, null: false
      column :nickname, String
      column :image, String
      column :github_access_token, String
    end
  end
end
