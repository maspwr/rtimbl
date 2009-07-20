require 'mkmf'
$libs = append_library($libs, "supc++")
$libs = append_library($libs, "Timbl")

with_cppflags("-I/usr/local/include/timbl -L/usr/local/lib") do
  create_makefile('ruby_timbl')
end
