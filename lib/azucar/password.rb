module Azucar
  class PasswordValidator
    def strong_enough?(pass)
      return false if pass.length < Acme::Config.min_password_lenght

      true
    end
  end

  module Acme
    module Config
      def self.min_password_lenght
        8
      end
    end
  end
end
