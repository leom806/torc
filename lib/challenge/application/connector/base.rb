module Challenge
  module Application
    module Connector
      class Base
        attr_reader :items

        def initialize(items:)
          @items = items
        end

        def execute
          raise 'Abstract method call'
        end
      end
    end
  end
end
