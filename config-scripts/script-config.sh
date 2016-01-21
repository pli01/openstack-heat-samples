#!/bin/bash
set -x
# parameters = env variable or parameters heat
#  $foo
#  $bar


echo "Myscript: Writing to /tmp/$bar"
echo "Myscript: $foo" > /tmp/$bar
echo -n "Myscript: The file /tmp/$bar contains `cat /tmp/$bar` for server $deploy_server_id during $deploy_action" > $heat_outputs_path.result
echo "Myscript: Written to /tmp/$bar"
echo "Myscript: Output to stderr" 1>&2
