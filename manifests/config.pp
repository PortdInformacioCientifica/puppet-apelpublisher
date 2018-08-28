define apelpublisher::config (
  $mysql_hostname = "localhost",
  $mysql_port = 3306,
  $mysql_database = "apelclient",
  $mysql_user = "apel",
  $mysql_password = "pleasechangeme",
  $site_name = $title ,
  $ldap_port = 2170,
  $joiner_local_jobs = false,
  $joiner_enabled = true,
  $unloader_enabled = true,
  $unloader_dir_location = "/var/spool/apel/",
  $unloader_send_summaries = false,
  $unloader_withhold_dns = false,
  $ssm_enabled = true,
  $logging_logfile = "/var/log/apel/client.log",
  $logging_level = "INFO",
  $logging_console = true,
  $destination_queue = '/queue/global.accounting.cputest.CENTRAL',
  $msg_network = 'TEST-NWOB',
  $ldap_host = "lcg-bdii.cern.ch",
  $use_ssl = true,
  ) {
   
  notify { "will create the file /etc/apel/client-$site_name.cfg":;}

  file { "/etc/apel/client-$site_name.cfg":
    owner   => "root",
    group   => "root",
    ensure  => "present",
    content => template("${module_name}/client.cfg.erb"),
    require => [Package['apel-client'],Package['apel-ssm']],
    mode => '0600',
  }
  
  apelpublisher::ssm::sender {
    $title:
        destination_queue => $destination_queue,
        msg_network => $msg_network, 
        ldap_host => $ldap_host,
        use_ssl => $use_ssl;
  }
}
