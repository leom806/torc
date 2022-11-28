require_relative './base'

module Challenge
  module Application
    module Connector
      class ListConnector < Base
        private

        def execute
          items.to_a
        end
      end
    end
  end
end
