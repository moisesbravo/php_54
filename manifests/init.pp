

class php_54 {

 $phpini_file = "puppet:///modules/php_54/php.ini"
 $phppage_file = "puppet:///modules/php_54/phpinfo.php"

  # package install list
  $packages = [
    "php5",
    "php5-cli",
    "php-pear",
    "php5-dev",
    "php5-gd",
    "php5-mcrypt",
    "php5-curl",
    "php-soap",
    "php5-mssql",
    "php5-odbc",
    "freetds-common",
    "php5-mysqlnd"
  ]

  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }




  # Crea el fichero con el archivo php.ini
      file { "/etc/php5/apache2/php.ini":
          ensure => present,
          source => $phpini_file,
          notify => Service['apache2'],
          require => Package[$packages],

      }




}