# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "xmlpipe2_indexer"
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ludwig Bratke"]
  s.date = "2012-05-02"
  s.description = "xmlpipe2_indexer provides a small DSL which wrapps sphinx's xmlpipe2"
  s.email = "bratke@servtag.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".rvmrc",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "erb/sphinx.conf.erb",
    "erb/xml_schema.xml.erb",
    "erb/xml_stream.xml.erb",
    "lib/xml_pipe2/configuration.rb",
    "lib/xml_pipe2/delta_indexer.rb",
    "lib/xml_pipe2/index_builder.rb",
    "lib/xml_pipe2/sphinx_conf.rb",
    "lib/xml_pipe2/xml_pipe2.rb",
    "lib/xml_pipe2/xml_schema.rb",
    "lib/xml_pipe2/xml_stream.rb",
    "lib/xmlpipe2_indexer.rb",
    "spec/configuration_spec.rb",
    "spec/spec_helper.rb",
    "spec/sphinx_conf_spec.rb",
    "spec/xml_pipe2_spec.rb",
    "spec/xml_schema_spec.rb",
    "spec/xml_stream_spec.rb",
    "xmlpipe2_indexer.gemspec"
  ]
  s.homepage = "http://github.com/EeCnee/xmlpipe2_indexer"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "xmlpipe2_indexer provides a small DSL which wrapps sphinx's xmlpipe2"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<uuid>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<uuid>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<uuid>, [">= 0"])
  end
end

