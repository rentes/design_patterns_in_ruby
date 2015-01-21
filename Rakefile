require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = Dir.glob('spec/*_helper.rb')
end

task(default: :test)
