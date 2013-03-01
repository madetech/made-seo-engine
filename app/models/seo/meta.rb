module Seo
  class Meta < ActiveRecord::Base

    belongs_to        :meta_data, :polymorphic => true

    attr_accessible   :keywords,
                      :description

    validates         :description, :length => { :maximum => 150,
                                                 :too_long => "%{count} characters is the maximum allowed" }

  end
end
