$cert = New-SelfSignedCertificate -DnsName "securelogin.arubanetworks.com" -CertStoreLocation "cert:\LocalMachine\My" -KeyUsage DigitalSignature,CertSign,CRLSign -KeyAlgorithm RSA -KeyLength 2048 -Provider "Microsoft Enhanced RSA and AES Cryptographic Provider" -NotAfter (Get-Date).AddYears(5)

$pwd = "boardingwifisucks"
$SSpwd = ConvertTo-SecureString -String $pwd -Force -AsPlainText


Export-PfxCertificate -Cert "Cert:\LocalMachine\My\$($cert.Thumbprint)" -FilePath custom_cert.pfx -Password $SSpwd

# import
$certPath = "C:\Windows\System32\custom_cert.pfx"
Import-PfxCertificate -FilePath $certPath -CertStoreLocation Cert:\LocalMachine\My -Password $SSpwd
