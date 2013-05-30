ActiveAdmin.register Fetcher do
  menu :priority => 4

  filter :provider
  filter :transport
  filter :status
  filter :basename
  filter :supply
  filter :created_at
  filter :updated_at

  index do
    column :provider
    column :transport
    column :status
    column :basename
    column :supply

    column :created_at
    column :updated_at
    default_actions
  end

  controller do
    def update
      @fetcher = Fetcher.find(params[:id])
      if params[:fetcher][:password].blank?
        params[:fetcher][:password] = @fetcher.password
      end
      @fetcher.update_attributes(params[:fetcher])
      if @fetcher.errors.blank?
        redirect_to admin_fetcher_path, :notice => "Fetcher updated successfully."
      else
        render :edit
      end
    end
  end

end
