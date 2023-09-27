# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure Nginx for port 80
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html;

    location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }
}
",
  require => Package['nginx'],
}

# Create an HTML page containing "Hello World!"
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Package['nginx'],
}

# Ensure Nginx is running
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => [Package['nginx'], File['/etc/nginx/sites-available/default']],
}
