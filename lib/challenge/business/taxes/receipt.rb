require_relative 'tax_calculator'

module Challenge
  module Business
    module Taxes
      class Receipt
        DEFAULT_CALCULATOR = ::Challenge::Business::Taxes::TaxCalculator

        attr_reader :products, :calculator

        def initialize(items:, calculator: DEFAULT_CALCULATOR)
          @products = items
          @calculator = calculator
        end

        def total_taxes
          products.reduce(0.0) do |total, product|
            total += product.taxes
          end
        end

        def total_with_taxes
          products.reduce(0.0) do |total, product|
            total += product.total_with_taxes
          end
        end

        def round(amount)
          ((amount * 20.0).ceil / 20.0).round(2)
        end

        def to_s
          <<~TEXT
            #{
              products.map do |product|
                "#{product.quantity} #{product.description}: #{'%.02f' % product.total_with_taxes}"
              end.join("\n")
            }
            Sales Taxes: #{'%.02f' % round(total_taxes)}
            Total: #{'%.02f' % round(total_with_taxes)}
          TEXT
          end
      end
    end
  end
end
