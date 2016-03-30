class User
  include Hanami::Entity

  attributes :id, :github_id, :name, :nickname, :image, :email, :github_access_token
end
