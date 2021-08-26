# -*- encoding: utf-8 -*-
# stub: argon2 2.0.2 ruby lib
# stub: ext/argon2_wrap/extconf.rb

Gem::Specification.new do |s|
  s.name = "argon2".freeze
  s.version = "2.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Technion".freeze]
  s.bindir = "exe".freeze
  s.date = "2019-03-18"
  s.description = "Argon2 FFI binding".freeze
  s.email = ["technion@lolware.net".freeze]
  s.extensions = ["ext/argon2_wrap/extconf.rb".freeze]
  s.files = ["ext/argon2_wrap/extconf.rb".freeze]
  s.homepage = "https://github.com/technion/ruby-argon2".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Argon2 Password hashing binding".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>.freeze, ["~> 1.9"])
      s.add_runtime_dependency(%q<ffi-compiler>.freeze, [">= 0.1"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<coveralls>.freeze, ["~> 0.8"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.8"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.4", ">= 10.4.2"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.49"])
    else
      s.add_dependency(%q<ffi>.freeze, ["~> 1.9"])
      s.add_dependency(%q<ffi-compiler>.freeze, [">= 0.1"])
      s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
      s.add_dependency(%q<coveralls>.freeze, ["~> 0.8"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.8"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.4", ">= 10.4.2"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.49"])
    end
  else
    s.add_dependency(%q<ffi>.freeze, ["~> 1.9"])
    s.add_dependency(%q<ffi-compiler>.freeze, [">= 0.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<coveralls>.freeze, ["~> 0.8"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.8"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.4", ">= 10.4.2"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.49"])
  end
end
