require "seo/engine"

module Seo
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
    @@config ||= Seo::Engine::Configuration.new

    yield @@config if block

    return @@config
  end

  def self.associated_seo_objects
    require File.join(Seo::Engine.root, 'app', 'concerns', 'seo')

    Seo.config.associate_objects.each do |obj|
      obj.class_eval do
        include Seo::SeoConcerns

        has_one                         :meta, :class_name => Seo::Meta, :as => :meta_data
        accepts_nested_attributes_for   :meta
      end
    end
  end
end
