# -*- encoding: utf-8 -*-
# stub: rdf-turtle 1.1.7 ruby lib

Gem::Specification.new do |s|
  s.name = "rdf-turtle"
  s.version = "1.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Gregg Kellogg"]
  s.date = "2015-05-21"
  s.description = "RDF::Turtle is an Turtle reader/writer for the RDF.rb library suite."
  s.email = "public-rdf-ruby@w3.org"
  s.homepage = "http://ruby-rdf.github.com/rdf-turtle"
  s.licenses = ["Public Domain"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubyforge_project = "rdf-turtle"
  s.rubygems_version = "2.4.5"
  s.summary = "Turtle reader/writer for Ruby."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rdf>, [">= 1.1.10", "~> 1.1"])
      s.add_runtime_dependency(%q<ebnf>, [">= 0.3.6", "~> 0.3"])
      s.add_development_dependency(%q<open-uri-cached>, [">= 0.0.5", "~> 0.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-its>, ["~> 1.0"])
      s.add_development_dependency(%q<rdf-isomorphic>, ["~> 1.1"])
      s.add_development_dependency(%q<json-ld>, ["~> 1.1"])
      s.add_development_dependency(%q<yard>, ["~> 0.8"])
      s.add_development_dependency(%q<rdf-spec>, ["~> 1.1"])
      s.add_development_dependency(%q<rake>, ["~> 10.4"])
    else
      s.add_dependency(%q<rdf>, [">= 1.1.10", "~> 1.1"])
      s.add_dependency(%q<ebnf>, [">= 0.3.6", "~> 0.3"])
      s.add_dependency(%q<open-uri-cached>, [">= 0.0.5", "~> 0.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<rspec-its>, ["~> 1.0"])
      s.add_dependency(%q<rdf-isomorphic>, ["~> 1.1"])
      s.add_dependency(%q<json-ld>, ["~> 1.1"])
      s.add_dependency(%q<yard>, ["~> 0.8"])
      s.add_dependency(%q<rdf-spec>, ["~> 1.1"])
      s.add_dependency(%q<rake>, ["~> 10.4"])
    end
  else
    s.add_dependency(%q<rdf>, [">= 1.1.10", "~> 1.1"])
    s.add_dependency(%q<ebnf>, [">= 0.3.6", "~> 0.3"])
    s.add_dependency(%q<open-uri-cached>, [">= 0.0.5", "~> 0.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<rspec-its>, ["~> 1.0"])
    s.add_dependency(%q<rdf-isomorphic>, ["~> 1.1"])
    s.add_dependency(%q<json-ld>, ["~> 1.1"])
    s.add_dependency(%q<yard>, ["~> 0.8"])
    s.add_dependency(%q<rdf-spec>, ["~> 1.1"])
    s.add_dependency(%q<rake>, ["~> 10.4"])
  end
end