module Challenge
  module Application
    module Backend
      class Base
        protected attr_reader :item_transformer, :aggregate_transformer

        def initialize(item:, aggregate:)
          @item_transformer = item
          @aggregate_transformer = aggregate
        end

        def execute(connector:)
          raise 'Abstract method call'
        end
      end
    end
  end
end
