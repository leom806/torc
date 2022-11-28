require_relative './base'

module Challenge
  module Application
    module Frontend
      class TextReader < Base
        def execute
          lines = []

          file_content.each do |line|
            lines << [
              get_quantity(line),
              get_description(line),
              get_price(line),
            ]
          end

          connector_type.new(items: lines)
        end

        private

        def file_content
          ::File.readlines(path)
        end

        def get_quantity(line)
          line.split(' ', 2).first.to_i
        end

        def get_description(line)
          remove_quantity = line.split(' ', 2).last
          remove_quantity.split(' at ', 2).first
        end

        def get_price(line)
          line.split(' at ', 2).last.to_f
        end
      end
    end
  end
end
