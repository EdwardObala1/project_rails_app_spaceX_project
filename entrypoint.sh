#!/usr/bin/env bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# if running the rails server create or migrate existing database
# if [ "${*}"  == "rails server -b 0.0.0.0"]; then
#     ./bin/rails db:prepare
# fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"