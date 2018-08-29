/**
 * This sets up the SSM sender
 * 
 * The erb curently is not using any option
 */
 define apelpublisher::ssm::sender(
   $destination_queue         = '/queue/global.accounting.cputest.CENTRAL',
   $msg_network               = 'TEST-NWOB',
   $ldap_host                 = "lcg-bdii.cern.ch",
   $use_ssl                   = true,
 ) {
   
   file { "/etc/apel/sender.cfg":
    owner   => "root",
    group   => "root",
    ensure  => "present",
    content => template("${module_name}/sender.cfg.erb"),
    require => Package['apel-ssm'],
  }
 }
