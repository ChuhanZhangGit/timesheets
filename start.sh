#!/bin/bash

export MIX_ENV=prod
export PORT=4796

#!/bin/bash

source ./prod-env.sh

_build/prod/rel/timesheets/bin/timesheets start