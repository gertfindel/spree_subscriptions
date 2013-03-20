module SpreeSubscriptions
  module Extensions
    module Spree
      module Product
        extend ActiveSupport::Concern

        def subscribable_option_values
          variants.collect(&:option_values).flatten.select do |ov|
           ov.name.to_i > 1 && ov.option_type.name == frequency_option_type
          end
        end

        def subscribable?
          subscribable_option_values.any?
        end

        def frequency_option_type
          ::Spree::OptionType.find_by_name('frequency').name
        end

      end
    end
  end
end

::Spree::Product.send(:include, SpreeSubscriptions::Extensions::Spree::Product)
