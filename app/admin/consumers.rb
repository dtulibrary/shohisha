ActiveAdmin.register Consumer do
  menu :priority => 3

  sidebar I18n.t('shohisha.admin.consumer.providers'), :only => [ :show ] do
    table_for(consumer.consumers_providers) do
      column :provider
      column :fulltext
    end
  end

  form do |f|
    f.inputs I18n.t('shohisha.admin.consumer.details') do
      f.input :code
      f.input :description, :as => :string
    end

    f.has_many :consumers_providers do |c|
      c.inputs I18n.t('shohisha.admin.consumer.providers') do
        c.input :provider, :as => :select
        c.input :fulltext, :as => :select
        c.input :_destroy, :as => :boolean, :label => "Delete?"
      end
    end

    f.has_many :consumers_packages do |c|
      c.inputs I18n.t('shohisha.admin.consumer.packages') do
        c.input :package, :as => :select
        c.input :fulltext, :as => :select
        c.input :_destroy, :as => :boolean, :label => "Delete?"
      end
    end

    f.buttons
  end

end
