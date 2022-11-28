module Challenge
  module Business
    module Taxes
      class TaxCalculator
        def self.execute(**args)
          new(**args).send(:execute)
        end

        private

        attr_reader :product, :tax_amount

        def initialize(product:)
          @product = product
          @tax_amount = 0.0
        end

        def execute
          apply_taxes

          return tax_amount
        end

        def apply_taxes
          apply_basic_sales_tax if product.goodie?
          apply_import_duty if product.imported?
        end

        def apply_basic_sales_tax
          @tax_amount += product.price * 0.10
        end

        def apply_import_duty
          @tax_amount += product.price * 0.05
        end
      end
    end
  end
end
