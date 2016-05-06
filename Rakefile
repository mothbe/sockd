require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.send('disable_double_quoted_strings')
PuppetLint.configuration.send('disable_documentation')
PuppetLint.configuration.send('disable_puppet_url_without_modules')
PuppetLint.configuration.send('disable_autoloader_layout')
PuppetLint.configuration.send('disable_trailing_whitespace')
PuppetLint.configuration.send('disable_inherits_across_namespaces')
PuppetLint.configuration.send('disable_variable_scope')
PuppetLint.configuration.send('disable_only_variable_string')
PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "pkg/**/*.pp"]

desc "Validate manifests, templates, and ruby files"
task :validate do
  Dir['manifests/**/*.pp'].each do |manifest|
    sh "puppet parser validate --noop #{manifest}"
  end
  Dir['spec/**/*.rb','lib/**/*.rb'].each do |ruby_file|
    sh "ruby -c #{ruby_file}" unless ruby_file =~ /spec\/fixtures/
  end
  Dir['templates/**/*.erb'].each do |template|
    sh "erb -P -x -T '-' #{template} | ruby -c"
  end
end
