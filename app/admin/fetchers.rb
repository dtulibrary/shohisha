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

  form do |f|
    f.inputs do
      f.input :provider, :include_blank => false
      f.input :status, :include_blank => false
      f.input :supply, :include_blank => false
      f.input :retain, :include_blank => false
      f.input :deliver_period, :include_blank => false
      f.input :transport, :include_blank => false
      f.input :username,
        :wrapper_html => { :class => Transport.transport("username") }
      f.input :passkey,
        :wrapper_html => { :class => Transport.transport("passkey") }
      f.input :basename,
        :wrapper_html => { :class => Transport.transport("basename") }
      f.input :port,
        :wrapper_html => { :class => Transport.transport("port") }
      f.input :encryption, :as => :select, :collection => Fetcher::ENCRYPTIONS,
        :wrapper_html => { :class => Transport.transport("encryption") }
      f.input :directory,
        :wrapper_html => { :class => Transport.transport("directory") }
      f.input :seperator, :as => :select, :collection => Fetcher::SEPERATORS,
        :wrapper_html => { :class => Transport.transport("seperator") }
      f.input :file_filter,
        :wrapper_html => { :class => Transport.transport("file_filter") }
      f.input :directory_filter,
        :wrapper_html => { :class => Transport.transport("directory_filter") }
      f.input :format,
        :wrapper_html => { :class => Transport.transport("format") }
      f.input :set,
        :wrapper_html => { :class => Transport.transport("set") }
      f.input :set_limit,
        :wrapper_html => { :class => Transport.transport("set_limit") }
      f.input :charset,
        :wrapper_html => { :class => Transport.transport("charset") }
      f.input :recursive, :as => :select, :collection => Fetcher::RECURSIVE,
        :include_blank => false,
        :wrapper_html => { :class => Transport.transport("recursive") }
      f.input :remote_delete,
        :wrapper_html => { :class => Transport.transport("remote_delete") }
      f.input :passive,
        :wrapper_html => { :class => Transport.transport("passive") }
      f.input :timeout,
        :wrapper_html => { :class => Transport.transport("timeout") }
      f.input :sleep_interval,
        :wrapper_html => { :class => Transport.transport("sleep_interval") }
      f.input :provider_format,
        :wrapper_html => { :class => Transport.transport("provider_format") }
      f.input :realm,
        :wrapper_html => { :class => Transport.transport("realm") }
    end
    f.actions
  end

end
