#!/bin/bash

# https://blog.josephscott.org/2011/10/14/timing-details-with-curl/
# also see --write-out in man page

curl -w @- -o /dev/null -sfL "$@" <<'EOF'
    time_namelookup[s]:  %{time_namelookup}\n
       time_connect[s]:  %{time_connect}\n
    time_appconnect[s]:  %{time_appconnect}\n
   time_pretransfer[s]:  %{time_pretransfer}\n
      time_redirect[s]:  %{time_redirect}\n
 time_starttransfer[s]:  %{time_starttransfer}\n
                       ----------\n
         time_total[s]:  %{time_total}\n
EOF
