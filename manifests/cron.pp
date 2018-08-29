define apelpublisher::cron (
  $cron_minutes = "00",
  $cron_hours   = "19",) {
  cron { apelclient:
    command => "/usr/bin/apelclient -c /etc/apel/client-${title}.cfg",
    user    => root,
    hour    => $cron_hours,
    minute  => $cron_minutes,
  }
}
