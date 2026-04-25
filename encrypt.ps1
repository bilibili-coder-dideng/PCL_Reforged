Add-Type -AssemblyName System.Security
$des = New-Object System.Security.Cryptography.DESCryptoServiceProvider
$des.Key = [System.Text.Encoding]::UTF8.GetBytes("00000000")
$des.IV = [System.Text.Encoding]::UTF8.GetBytes("87160295")
$encryptor = $des.CreateEncryptor()
$bytes = [System.Text.Encoding]::UTF8.GetBytes("59ebc013-28d3-4f94-b7a6-0767f08478e0")
$encrypted = $encryptor.TransformFinalBlock($bytes, 0, $bytes.Length)
[Convert]::ToBase64String($encrypted)