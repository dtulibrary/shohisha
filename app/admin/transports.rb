ActiveAdmin.register Transport do
  menu :parent => "Config"

  filter :code
  filter :description
  filter :created_at
  filter :updated_at

  index do
    column :code
    column :description

    column :created_at
    column :updated_at
    default_actions
  end

end
