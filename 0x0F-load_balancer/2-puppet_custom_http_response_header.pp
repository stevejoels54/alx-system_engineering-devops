# automate creating custom HTTP header res, with puppet

exec { 'update-nginx':
  command     => 'apt-get -y update',
  path        => '/usr/bin',
  logoutput   => true,
  refreshonly => true,
}

exec { 'install-nginx':
  command     => 'apt-get -y install nginx',
  path        => '/usr/bin',
  require     => Exec['update-nginx'],
  logoutput   => true,
  refreshonly => true,
}

exec { 'add-custom-header':
  command   => "sed -i '/listen 80 default_server;/a add_header X-Served-By $::hostname;' /etc/nginx/sites-available/default",
  path      => '/bin',
  require   => Exec['install-nginx'],
  logoutput => true,
}

exec { 'restart-nginx':
  command   => 'service nginx restart',
  path      => '/usr/sbin',
  require   => Exec['add-custom-header'],
  logoutput => true,
}
