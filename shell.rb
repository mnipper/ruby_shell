#!/usr/bin/env ruby

$stdout.print '$ >> '
$stdin.each_line do |line|
  exit if line =~ /^exit/i
  pid = fork { exec line }
  Process.wait pid if line[-1] != '&'
  $stdout.print '$ >> '
end
