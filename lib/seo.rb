require "seo/engine"

module Seo
  mattr_accessor :associate_objects
  @@associate_objects = []

  class Engine < Rails::Engine
    isolate_namespace Seo

    initializer :seo do
      ActiveAdmin.application.load_paths.unshift Dir[Seo::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)

      if !Seo.config.associate_objects.blank?
        Seo.associated_seo_objects
      end
    end
  end

  def self.config(&block)
    yield self if block
    return self
  end

  def self.associated_seo_objects
    require File.join(Seo::Engine.root, 'app', 'concerns', 'seo')

    Seo.config.associate_objects.each do |obj|
      obj.class_eval do
        include Seo::SeoConcerns
        include Seo::Sitemappable

        has_one                         :meta, :class_name => Seo::Meta, :as => :meta_data
        accepts_nested_attributes_for   :meta
      end
    end
  end
end
