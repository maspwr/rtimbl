require 'mkmf'

dir_config('timbl')
$libs = append_library($libs, "stdc++")

have_library('timbl')
create_makefile('ruby_timbl')

