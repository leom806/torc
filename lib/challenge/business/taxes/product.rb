module Challenge
  module Business
    module Taxes
      class Product
        attr_reader :quantity, :description, :price

        def initialize(quantity:, description:, price:)
          @quantity = quantity
          @description = description
          @price = price
        end

        def imported?
          description.downcase.include?('imported')
        end

        def goodie?
          !book? && !food? && !medical?
        end

        def book?
          ['book'].find do |book|
            description.downcase.include?(book)
          end
        end

        def food?
          ['chocolate'].find do |food|
            description.downcase.include?(food)
          end
        end

        def medical?
          ['pill'].find do |food|
            description.downcase.include?(food)
          end
        end

        def unit_tax_amount
          TaxCalculator.execute(product: self)
        end

        def taxes
          unit_tax_amount * quantity
        end

        def total_with_taxes
          (price + unit_tax_amount) * quantity
        end
      end
    end
  end
end
