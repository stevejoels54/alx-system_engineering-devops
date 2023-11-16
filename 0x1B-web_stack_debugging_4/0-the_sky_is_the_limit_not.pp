# Increase traffic amount on nginx server

# Increase limit of the default file
exec { 'fix-nginx-limit':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/',
} ->

# Restart Nginx
service { 'restart-nginx':
  name    => 'nginx',
  ensure  => 'running',
  enable  => true,
  require => Exec['fix--for-nginx'],
}
