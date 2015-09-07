#!/usr/bin/env rake

require 'rake/testtask'
require 'rspec'

Rake::TestTask.new do |t|
  t.test_files = Dir.glob('tests/**/*_spec.rb')
end

task(default: :test)
