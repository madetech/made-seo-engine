require "seo/engine"
require File.join(Seo::Engine.root, 'app', 'concerns', 'seo')

module Seo
  mattr_accessor :sitemap_sweeper
  @@sitemap_sweeper = false

  mattr_accessor :meta_objects
  @@meta_objects = []

  mattr_accessor :sitemap_objects
  @@sitemap_objects = []

  class Engine < Rails::Engine
    isolate_namespace Seo

    initializer :seo do
      require "active_admin_extension"

      ActiveAdmin.application.load_paths.unshift Dir[Seo::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)

      Seo.associate_meta_objects if !Seo.config.meta_objects.blank?
      Seo.associate_sitemap_objects if !Seo.config.sitemap_objects.blank?
    end
  end

  def self.config(&block)
    yield self if block
    return self
  end

  def self.associate_meta_objects
    Seo.config.meta_objects.each do |obj|
      obj.class_eval do
        include Seo::SeoConcerns

        has_one                         :meta, :class_name => Seo::Meta, :as => :meta_data
        accepts_nested_attributes_for   :meta
      end
    end
  end

  def self.associate_sitemap_objects
    Seo.config.sitemap_objects.each do |obj|
      obj.class_eval do
        include Seo::Sitemappable
      end
    end
  end
end
