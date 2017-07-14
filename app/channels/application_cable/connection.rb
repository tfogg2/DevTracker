module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      if current_user = User.find_by(id: user_id)
        current_user
      else
        reject_unauthorized_connection
      end
    end

    private

    def user_id
      signed_user_id = request.params.fetch(user_id: current_user.id)

      crypt.decrypt_and_verify(signed_user_id)
    end

    def crypt
      @crypt ||= ActiveSupport::MessageEncryptor.new(
        Rails.application.secrets.secret_key_base,
      )
    end
  end
end
