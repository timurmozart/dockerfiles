#!/bin/sh

# Start the first process
nginx
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_first_process: $status"
  exit $status
fi

# Start the second process
php-fpm7.3
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_second_process: $status"
  exit $status
fi

# Naive check runs checks once a minute to see if either of the processes exited.
# This illustrates part of the heavy lifting you need to do if you want to run
# more than one service in a container. The container exits with an error
# if it detects that either of the processes has exited.
# Otherwise it loops forever, waking up every 60 seconds

watch -n999999999999999 tail /dev/null

# while sleep 5; do
#   ps aux |grep my_first_process |grep -q -v grep
#   PROCESS_1_STATUS=$?
#   ps aux |grep my_second_process |grep -q -v grep
#   PROCESS_2_STATUS=$?
#   # If the greps above find anything, they exit with 0 status
#   # If they are not both 0, then something is wrong
#   if [ $PROCESS_1_STATUS -ne 0 ]; then
#     echo "Nginx has already exited."
#     # exit 1
#   fi
#   if [ $PROCESS_2_STATUS -ne 0 ]; then
#     echo "php-fpm has already exited."
#     # exit 1
#   fi

  
done
