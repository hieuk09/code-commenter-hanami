class UserRepository
  include Hanami::Repository


  def self.find_by_github_id(github_id)
    query do
      where(github_id: github_id)
    end.first
  end

  def self.from_omniauth(omniauth)
    github_id = omniauth.uid
    found = find_by_github_id(github_id)

     attributes = {}.tap do |attrs|
       attrs[:name] = omniauth.info.name
       attrs[:nickname] = omniauth.info.nickname
       attrs[:image] = omniauth.info.image
       attrs[:email] = omniauth.info.email || omniauth.extra.raw_info.email
       attrs[:github_access_token] = omniauth.credentials.token
     end

     if found
       found.update(attributes)
       update(found)
     else
       create(User.new(attributes.merge(github_id: github_id)))
     end
  end
end
