# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gondola}
  s.version = "1.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Perry"]
  s.date = %q{2011-06-09}
  s.default_executable = %q{gondola}
  s.description = %q{
    Gondola is Ruby command line utility and as well as a library  which helps
    for integrate the Selenium IDE more tightly with Sauce Labs' Ondemand services and
    provide greater ease for those who would like to use both tools but do not have
    enough technical knowledge
  }
  s.email = %q{mperry@agoragames.com}
  s.executables = ["gondola"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.markdown",
    "Rakefile",
    "bin/gondola",
    "gondola.gemspec",
    "lib/gondola.rb",
    "lib/gondola/commands.rb",
    "lib/gondola/converters.rb",
    "lib/gondola/converters/base_converter.rb",
    "lib/gondola/converters/html_converter.rb",
    "lib/gondola/results.rb",
    "lib/gondola/results/console.rb",
    "lib/gondola/selenium.rb",
    "lib/gondola/suiterunner.rb",
    "lib/gondola/tasks.rb",
    "lib/gondola/tester.rb",
    "lib/gondola/version.rb",
    "test/helper.rb",
    "test/test_converter.rb",
    "test/test_fail.rb",
    "test/test_pass.rb",
    "test/test_projects/config.yml",
    "test/test_projects/example1/config.yml",
    "test/test_projects/example1/gondola_agora_fail.html",
    "test/test_projects/example1/gondola_agora_pass.html",
    "test/test_projects/example2/config.yml",
    "test/test_projects/example2/gondola_agora_fail.rb",
    "test/test_projects/example2/gondola_agora_pass.rb",
    "test/test_suiterunner.rb"
  ]
  s.homepage = %q{http://github.com/perrym5/gondola}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Ruby command line utility and library for integrating the Selenium IDE more tightly with Sauce Labs' Ondemand services}
  s.test_files = [
    "test/helper.rb",
    "test/test_converter.rb",
    "test/test_fail.rb",
    "test/test_pass.rb",
    "test/test_projects/example2/gondola_agora_fail.rb",
    "test/test_projects/example2/gondola_agora_pass.rb",
    "test/test_suiterunner.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sauce>, [">= 0.19.0"])
      s.add_runtime_dependency(%q<parallel>, ["~> 0.5.2"])
      s.add_runtime_dependency(%q<rainbow>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<vcr>, [">= 1.7.1"])
      s.add_development_dependency(%q<fakeweb>, ["~> 1.3.0"])
    else
      s.add_dependency(%q<sauce>, [">= 0.19.0"])
      s.add_dependency(%q<parallel>, ["~> 0.5.2"])
      s.add_dependency(%q<rainbow>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<vcr>, [">= 1.7.1"])
      s.add_dependency(%q<fakeweb>, ["~> 1.3.0"])
    end
  else
    s.add_dependency(%q<sauce>, [">= 0.19.0"])
    s.add_dependency(%q<parallel>, ["~> 0.5.2"])
    s.add_dependency(%q<rainbow>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<vcr>, [">= 1.7.1"])
    s.add_dependency(%q<fakeweb>, ["~> 1.3.0"])
  end
end

