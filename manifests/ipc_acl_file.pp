define usbguard::ipc_acl_file (
  String $user = $title,
  String $devices = "",
  String $policy = "",
  String $exceptions = "",
  String $parameters = "",
) {
  file { "${::usbguard::daemon_ipc_access_control_files_dir}/${$user}":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0400',
    content => join([
      "Devices=${devices}",
      "Policy=${policy}",
      "Exceptions=${exceptions}",
      "Parameters=${parameters}",
    ], "\n")
  }
}
