include vagrant_hosts

class {'apache2':
  disable_default_vhost => true,
}

class {'shohisha':
  rails_env => 'unstable',
  conf_set => 'vagrant',
  vhost_name => 'shohisha.vagrant.vm',
}

