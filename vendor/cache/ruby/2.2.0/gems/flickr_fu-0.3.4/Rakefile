# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

# Gem building
require 'jeweler'
Jeweler::Tasks.new do |s|
  s.name = "flickr_fu"
  s.summary = "Provides a ruby interface to flickr via the REST api"
  s.email = "ben@commonthread.com"
  s.homepage = "http://github.com/commonthread/flickr_fu"
  s.description = "Provides a ruby interface to flickr via the REST api"
  s.authors = ["Ben Wyrosdick", "Maciej Bilas"]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
#  s.add_dependency("mime-types", ["> 0.0.0"])
#  s.add_dependency("xml-magic", ["> 0.0.0"])
s.files.exclude("spec/spec.local.opts")
end
Jeweler::RubygemsDotOrgTasks.new

require 'rdoc/task'
desc 'Generate documentation for flickr_fu.'
RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'flickr_fu'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# RSpec support
require 'rspec/core'
require 'rspec/core/rake_task'

task :default => :spec

#spec_common = Proc.new do |t|
#  t.spec_opts = ['--options', "spec/spec.opts"]
#  t.spec_opts << ['--options', "spec/spec.local.opts" ] if File.exist?(File.dirname(__FILE__) + "/spec/spec.local.opts")
#  t.spec_files = FileList['spec/**/*_spec.rb']
#end

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

#desc "Run the specs under spec/models"
#Spec::Rake::SpecTask.new do |t|
#  spec_common.call(t)
#end

#desc "Analyze code coverage with tests"
#Spec::Rake::SpecTask.new("rcov") do |t|
#  spec_common.call(t)
#  t.rcov = true
#  t.rcov_opts = ["-x", "/var/lib", "-x", "spec/", "-T"]
#end
