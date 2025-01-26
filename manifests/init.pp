#
# = Define: cert
#
# Installs certificate and private key for $title
#
define cert (
  $certificate,
  $private_key,
  $certificate_path = '/etc/pki/tls/certs',
  $private_key_path = '/etc/pki/tls/private',
  $owner            = 'root',
  $group            = 'root',
) {

  File {
    ensure => file,
    owner  => $owner,
    group  => $group,
  }

  file { "${certificate_path}/${name}.crt":
    mode   => '0644',
    source => $certificate,
  }

  file { "${private_key_path}/${name}.key":
    mode   => '0600',
    source => $private_key,
  }

}
