require 'active_record'
require 'active_support/concern'

module Seo
  module SeoConcerns
    extend ActiveSupport::Concern

    included do
      attr_accessible                 :meta,
                                      :meta_attributes
    end
  end
end
