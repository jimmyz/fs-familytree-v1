require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "fs-familytree-v1"
    s.summary = %Q{TODO}
    s.email = "jimmy.zimmerman@gmail.com"
    s.homepage = "http://github.com/jimmyz/fs-familytree-v1"
    s.description = "TODO"
    s.authors = ["Jimmy Zimmerman"]
    if s.respond_to? :specification_version then
      current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
      s.specification_version = 2

      if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
        s.add_runtime_dependency(%q<jimmyz-happymapper>, [">= 0.3.3"])
        s.add_runtime_dependency(%q<jimmyz-fs-communicator>, [">= 0.2.0"])
      else
        s.add_dependency(%q<jimmyz-happymapper>, [">= 0.3.3"])
        s.add_dependency(%q<jimmyz-fs-communicator>, [">= 0.2.0"])
      end
    else
      s.add_dependency(%q<jimmyz-happymapper>, [">= 0.3.3"])
      s.add_dependency(%q<jimmyz-fs-communicator>, [">= 0.2.0"])
    end
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'fs-familytree-v1'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.libs << 'lib' << 'spec'
  t.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |t|
  t.libs << 'lib' << 'spec'
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.rcov = true
end

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features)
rescue LoadError
  puts "Cucumber is not available. In order to run features, you must: sudo gem install cucumber"
end

task :default => :spec
