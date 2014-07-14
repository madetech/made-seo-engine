module ActiveAdmin
  module SeoExtension
    extend ActiveSupport::Concern

    def seo_inputs(obj)
      self.inputs "Page Meta Information", :for => [:meta, obj.meta || Seo::Meta.new] do |f|
        f.input  :keywords,
                 :hint => 'Comma seperated words relevant to the page e.g. widgets, things, stuff',
                 :as => :string
        f.input  :description,
                 :input_html => {:rows => 10}
        f.input  :canonical_url,
                 :label => 'Canonical URL'
      end
    end
  end
end

if defined?(ActiveAdmin)
  ActiveAdmin::FormBuilder.send(:include, ActiveAdmin::SeoExtension)
end
