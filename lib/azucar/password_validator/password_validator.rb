module Azucar
  module PasswordValidator
    class PasswordValidator
      def strong_enough?(pass)
        return false if pass.length < Config.min_password_length

        true
      end
    end

    module Config
      def self.min_password_length
        8
      end
    end
  end
end
