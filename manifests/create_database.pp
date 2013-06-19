class apelpublisher::create_database (
  $mysql_root_password       = $apelpublisher::params::mysql_root_password,
  $mysql_apel_password       = $apelpublisher::params::mysql_apel_password,
  $list_of_apel_parser_hosts = $apelpublisher::params::list_of_apel_parser_hosts,
  $configure_backup          = $apelpublisher::params::mysql_configure_backup,
  $mysql_backup_folder       = $apelpublisher::params::mysql_backup_folder,) inherits apelpublisher::params {
  apelpublisher::db_permissions { 'localhost': mysql_apel_password => $mysql_apel_password, }

  $defaults = {
    'mysql_apel_password' => $mysql_apel_password,
  }
  create_resources('apelpublisher::db_permissions', $list_of_apel_parser_hosts, $defaults)
}