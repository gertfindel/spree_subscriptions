module SpreeSubscriptions
  module Extensions
    module Spree
      module LineItem
        extend ActiveSupport::Concern

        included do
          attr_accessible :interval

          validates_numericality_of :interval, allow_nil: true
        end
      end
    end
  end
end

::Spree::LineItem.send(:include, SpreeSubscriptions::Extensions::Spree::LineItem)
