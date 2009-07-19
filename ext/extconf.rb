require 'mkmf'
$libs = append_library($libs, "supc++")
$libs = append_library($libs, "Timbl")
create_makefile('rtimbl')
