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
    Seo.config.associate_objects.each do |obj|
      obj.class_eval do
        has_one                         :meta, :class_name => Seo::Meta, :as => :meta_data
        accepts_nested_attributes_for   :meta

        #TODO: make this more dynamic, risk of being overwritten
        private
        def mass_assignment_authorizer(role = :default)
          super + [:meta, :meta_attributes]
        end
      end
    end
  end
end
