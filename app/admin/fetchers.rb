ActiveAdmin.register Fetcher do
  menu :priority => 4

  filter :provider
  filter :transport
  filter :status
  filter :basename
  filter :created_at
  filter :updated_at

  index do
    column :provider
    column :transport
    column :status
    column :basename

    column :created_at
    column :updated_at
    default_actions
  end

end
