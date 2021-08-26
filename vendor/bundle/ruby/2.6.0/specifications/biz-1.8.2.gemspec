# -*- encoding: utf-8 -*-
# stub: biz 1.8.2 ruby lib

Gem::Specification.new do |s|
  s.name = "biz".freeze
  s.version = "1.8.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Craig Little".freeze, "Alex Stone".freeze]
  s.date = "2019-01-14"
  s.description = "Time calculations using business hours.".freeze
  s.email = ["clittle@zendesk.com".freeze, "astone@zendesk.com".freeze]
  s.homepage = "https://github.com/zendesk/biz".freeze
  s.licenses = ["Apache 2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Business hours calculations".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<clavius>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<tzinfo>.freeze, [">= 0"])
    else
      s.add_dependency(%q<clavius>.freeze, ["~> 1.0"])
      s.add_dependency(%q<tzinfo>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<clavius>.freeze, ["~> 1.0"])
    s.add_dependency(%q<tzinfo>.freeze, [">= 0"])
  end
end
