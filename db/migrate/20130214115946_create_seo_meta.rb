class CreateSeoMeta < ActiveRecord::Migration
  def change
    create_table :seo_meta do |t|
      t.text          :keywords
      t.text          :description
      t.references    :meta_data, :polymorphic => true
      t.timestamps
    end
  end
end
