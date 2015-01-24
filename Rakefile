require 'rake/testtask'
require 'minitest/spec'

Rake::TestTask.new do |t|
  t.test_files = Dir.glob('spec/*_helper.rb')
end

task(default: :test)