#!/usr/bin/env bats

load ../../lib/composure
load ../../plugins/available/base.plugin

cite _about _param _example _group _author _version

load ../../lib/helpers
load ../../lib/search

NO_COLOR=true

@test "helpers search aliases" {
  run _bash-it-search-component 'plugins' 'base'
  [[ "${lines[0]}" =~ 'plugins' && "${lines[0]}" =~ 'base' ]]
}

@test "helpers search all ruby et al" {
  run _bash-it-search 'ruby' 'gem' 'bundle' 'rake' 'rails' '--disable'
  run _bash-it-search 'ruby' 'gem' 'bundle' 'rake' 'rails'
  [[ "${lines[0]/✓/}" == '      aliases  =>   bundler rails' ]]
  [[ "${lines[1]/✓/}" == '      plugins  =>   chruby chruby-auto ruby' ]]
  [[ "${lines[2]/✓/}" == '  completions  =>   bundler gem rake' ]]
}

@test "search enable and disable" {
  run _bash-it-search 'ruby' 'gem' 'bundle' 'rake' 'rails' '--disable'
  run _enable-alias 'rails'
  run _bash-it-search 'ruby' 'gem' 'bundle' 'rake' 'rails'
  [[ "${lines[0]}" == '      aliases  =>   bundler ✓rails' ]]
  [[ "${lines[1]}" == '      plugins  =>   chruby chruby-auto ruby' ]]
  [[ "${lines[2]}" == '  completions  =>   bundler gem rake' ]]
}
