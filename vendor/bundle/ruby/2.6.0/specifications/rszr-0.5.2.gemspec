# -*- encoding: utf-8 -*-
# stub: rszr 0.5.2 ruby lib ext
# stub: ext/rszr/extconf.rb

Gem::Specification.new do |s|
  s.name = "rszr".freeze
  s.version = "0.5.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze, "ext".freeze]
  s.authors = ["Matthias Grosser".freeze]
  s.date = "2019-03-07"
  s.description = "Fast image resizer - do one thing and do it fast.".freeze
  s.email = ["mtgrosser@gmx.net".freeze]
  s.extensions = ["ext/rszr/extconf.rb".freeze]
  s.files = ["ext/rszr/extconf.rb".freeze]
  s.homepage = "https://github.com/mtgrosser/rszr".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Fast image resizer".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.9"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rake-compiler>.freeze, [">= 0"])
      s.add_development_dependency(%q<byebug>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<gd2-ffij>.freeze, [">= 0"])
      s.add_development_dependency(%q<mini_magick>.freeze, [">= 0"])
      s.add_development_dependency(%q<memory_profiler>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.9"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rake-compiler>.freeze, [">= 0"])
      s.add_dependency(%q<byebug>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<gd2-ffij>.freeze, [">= 0"])
      s.add_dependency(%q<mini_magick>.freeze, [">= 0"])
      s.add_dependency(%q<memory_profiler>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.9"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rake-compiler>.freeze, [">= 0"])
    s.add_dependency(%q<byebug>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<gd2-ffij>.freeze, [">= 0"])
    s.add_dependency(%q<mini_magick>.freeze, [">= 0"])
    s.add_dependency(%q<memory_profiler>.freeze, [">= 0"])
  end
end
