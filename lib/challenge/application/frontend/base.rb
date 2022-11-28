require_relative '../connector/list_connector'

module Challenge
  module Application
    module Frontend
      class Base
        DEFAULT_CONNECTOR_TYPE = ::Challenge::Application::Connector::ListConnector

        protected attr_reader :path, :connector_type

        def initialize(path:, connector_type: DEFAULT_CONNECTOR_TYPE)
          @path = path
          @connector_type = connector_type
        end

        def execute
          raise 'Abstract method call'
        end
      end
    end
  end
end
