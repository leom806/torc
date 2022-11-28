require_relative './base'

module Challenge
  module Application
    module Backend
      class Transformer < Base
        def execute(connector:)
          items = build_items(connector.items)
          aggregate_transformer.new(items: items)
        end

        private

        def build_items(items)
          items.map { |fields| build_item(fields) }
        end

        def build_item(fields)
          quantity, description, price = *fields

          item_transformer.new(
            quantity: quantity,
            description: description,
            price: price,
          )
        end
      end
    end
  end
end
