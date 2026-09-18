# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"
require "rubocop/rake_task"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

RuboCop::RakeTask.new(:rubocop)

desc "Run performance benchmarks"
task :benchmark do
  ruby "-Ilib", "benchmark/run.rb"
end

begin
  require "yard"
  YARD::Rake::YardocTask.new do |t|
    t.files = ["lib/**/*.rb", "-", "README.md", "CHANGELOG.md", "LICENSE.txt"]
  end
rescue LoadError
  # YARD not available
end

task default: %i[test rubocop]
