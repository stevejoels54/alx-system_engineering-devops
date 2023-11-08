# Define puppet resource to fix WordPress configuration issue

exec { 'change-wordpress-settings':
  command => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php',
  path    => '/usr/local/bin:/bin',
}
