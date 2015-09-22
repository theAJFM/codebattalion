class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles,id:false do |t|
      t.primary_key :ID_BUNDLE_KEY
      t.string :BundleName
      t.string :BundleDescription

      t.timestamps
    end
  end
end
