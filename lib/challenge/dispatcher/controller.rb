require_relative '../application/backend/transformer'
require_relative '../application/frontend/text_reader'
require_relative '../business/taxes/product'
require_relative '../business/taxes/receipt'

module Challenge
  module Application
    module Dispatcher
      class Controller
        DEFAULT_FRONTEND = ::Challenge::Application::Frontend::TextReader
        DEFAULT_BACKEND = ::Challenge::Application::Backend::Transformer

        private attr_reader :frontend, :backend

        def initialize(path:,
                       frontend: DEFAULT_FRONTEND,
                       backend: DEFAULT_BACKEND
                      )
          @frontend = frontend.new(path: path)
          @backend = backend.new(
            item: ::Challenge::Business::Taxes::Product,
            aggregate: ::Challenge::Business::Taxes::Receipt
          )
        end

        def execute
          connector = frontend.execute
          backend.execute(connector: connector)
        end
      end
    end
  end
end
