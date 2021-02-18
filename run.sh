#!/bin/bash

set -e

. `dirname "$0"`/shared/shlib/distro.sh
. `dirname "$0"`/shared/shlib/set_env.sh

RVM_RUBY=ruby-2.7
set_env_ruby

ruby -v
