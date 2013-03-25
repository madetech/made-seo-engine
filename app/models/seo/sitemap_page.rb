module Seo
  class SitemapPage < ActiveRecord::Base
    attr_accessible         :url,
                            :created_at,
                            :updated_at

    validates_presence_of   :url
  end
end