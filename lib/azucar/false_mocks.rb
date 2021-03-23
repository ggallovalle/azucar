module Azucar
  module FalseMocks
    class Model
      def errors
        %w{one two}
      end
    end

    class Controller
      def get(model = Model.new)
        model.errors
      end
    end
  end
end
