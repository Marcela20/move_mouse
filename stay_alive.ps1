# usage: ./stay_alive.ps1 <time_of_execution> <freuency_of_actions>

param($minutes = 120, $freq_sec = 59)
Add-Type -AssemblyName System.Windows.Forms
$myshell = New-Object -com "Wscript.Shell"
$direction = 10

for ($i = 0; $i -lt $minutes; $i++) {
  $myshell.sendkeys("shift")
  $pos = [System.Windows.Forms.Cursor]::Position
  $x = ($pos.X % 500) + $direction
  $y = ($pos.Y % 500) + $direction
  [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
  $direction = -($direction)
  Start-Sleep -Seconds $freq_sec
}
