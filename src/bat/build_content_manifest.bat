@echo off
setlocal

set "OUTFILE=content_manifest.txt"

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$root = (Get-Location).Path; " ^
  "$output = Join-Path $root '%OUTFILE%'; " ^
  "'Path|Size|MD5' | Set-Content -LiteralPath $output -Encoding UTF8; " ^
  "Get-ChildItem -LiteralPath $root -Recurse -File | " ^
  "Where-Object { " ^
  "    $_.FullName -ne $output -and " ^
  "    $_.Extension -notin '.vm', '.bat' -and " ^
  "    $_.FullName -notmatch '\\v[^\\]*_test(\\|$)' " ^
  "} | " ^
  "Sort-Object FullName | " ^
  "ForEach-Object { " ^
  "    $relative = $_.FullName.Substring($root.Length).TrimStart('\'); " ^
  "    $hash = (Get-FileHash -LiteralPath $_.FullName -Algorithm MD5).Hash; " ^
  "    '{0}|{1}|{2}' -f $relative, $_.Length, $hash " ^
  "} | Add-Content -LiteralPath $output -Encoding UTF8"

echo Manifest created: %OUTFILE%
pause
