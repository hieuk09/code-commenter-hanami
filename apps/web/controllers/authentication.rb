module Web
  module Authentication
    def self.included(action)
      action.class_eval do
        expose :current_user
        expose :signed_in?
      end
    end


    def signed_in?
      !current_user.nil?
    end

    def current_user
      @current_user ||= warden.user
    end

    def warden
      request.env["warden"]
    end

    def authenticate!
      warden.authenticate!
    end
  end
end
