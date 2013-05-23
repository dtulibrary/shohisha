ActiveAdmin.register Provider do
  menu :priority => 2

  sidebar I18n.t('shohisha.admin.provider.supplies'), :only => [ :show, :edit ] do
    table_for(provider.supplies) do
      column :name
    end
  end

  sidebar I18n.t('shohisha.admin.provider.consumers'), :only => [ :show ] do
    table_for(provider.consumers_providers) do
      column :consumer
      column :fulltext
    end
  end

  sidebar I18n.t('shohisha.admin.provider.ipaddresses'), :only => [ :show ] do
    table_for(provider.ipaddresses) do
      column :address
    end
  end

  form do |f|
    f.inputs I18n.t('shohisha.admin.provider.details') do
      f.input :code
      f.input :description
      f.input :provider_type, :as => :select, :include_blank => false
    end
    f.has_many :consumers_providers do |c|
      c.inputs I18n.t('shohisha.admin.provider.consumers') do
        c.input :consumer, :as => :select
        c.input :fulltext, :as => :select
        c.input :_destroy, :as => :boolean, :label => "Delete?"
      end
    end
    f.has_many :packages do |p|
      p.inputs I18n.t('shohisha.admin.provider.packages') do
        p.input :code
      end
    end
    f.has_many :ipaddresses do |a|
      a.inputs I18n.t('shohisha.admin.provider.ipaddresses') do
        a.input :address
      end
    end

    f.actions
  end

  action_item :only => :show do
    link_to I18n.t('shohisha.admin.provider.fetchers'),
      :controller => "fetchers", :action => "index",
      'q[provider_id_eq]' => provider.id
  end
end
