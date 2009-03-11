# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fs-familytree-v1}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jimmy Zimmerman"]
  s.date = %q{2009-03-10}
  s.description = %q{TODO}
  s.email = %q{jimmy.zimmerman@gmail.com}
  s.files = ["VERSION.yml", "lib/communicator.rb", "lib/fs_familytree_v1.rb", "spec/communicator_spec.rb", "spec/fixtures", "spec/fixtures/person", "spec/fixtures/person/KJ86-3VD.xml", "spec/fixtures/search.xml", "spec/fs_familytree_v1_spec.rb", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jimmyz/fs-familytree-v1}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}

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
