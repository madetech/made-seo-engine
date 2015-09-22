if defined?(ActiveAdmin) and Seo.config.engine_active_admin
  ActiveAdmin.register Seo::SitemapPage do
    actions :all, except: [:show]

    form do |f|
      f.inputs 'Sitemap Entry' do
        f.input :title

        f.input :url

        f.input :changefreq

        f.input :priority

        f.input :parent_url
      end

      f.actions
    end

    index do
      column :title
      column :url
      column :changefreq
      column :priority
      column :parent_url

      default_actions
    end

    filter :title
    filter :url
    filter :parent_url
  end
end
