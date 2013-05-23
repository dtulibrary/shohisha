ActiveAdmin.register Ipaddress do
  menu :parent => "Config"

  index do
    selectable_column
    column :address
    column :provider, :sortable => 'providers.description' do |ipaddress|
      ipaddress.provider.name
    end

    column :created_at
    column :updated_at
    default_actions
  end

  controller do
    def scoped_collection
      end_of_association_chain.includes(:provider)
    end
  end
end
