module Seo
  class Meta < ActiveRecord::Base
    belongs_to        :meta_data, :polymorphic => true

    attr_accessible   :keywords,
                      :description,
                      :canonical_url

    validates         :description, :length => { :maximum => 250,
                                                 :too_long => "%{count} characters is the maximum allowed" }
  end
end
