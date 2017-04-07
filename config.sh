#!/bin/bash

if [ -e "/opt/setup/json/config.sh" ]; then
  return
  /bin/bash -c " cd /opt/setup/json/ && /bin/bash config.sh"
fi
