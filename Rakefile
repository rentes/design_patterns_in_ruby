require 'rake/testtask'
require 'rspec'

Rake::TestTask.new do |t|
  t.test_files = Dir.glob('spec/*/*/*_spec.rb')
end

task(default: :test)
