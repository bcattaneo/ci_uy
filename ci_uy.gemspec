# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'ci_uy'
  s.version     = '1.0.0'
  s.summary     = 'CiUY Validate Uruguayan cedula numbers'
  s.description = 'A gem to validate Uruguayan Identity Documents (Cedula de ' \
    'Identidad Uruguaya)'
  s.authors     = ['Fernando Briano']
  s.email       = 'fernando@picandocodigo.net'
  s.files       = ['lib/ci_uy.rb']
  s.homepage    = 'https://github.com/picandocodigo/ci_uy'
  s.licenses    = ['LGPL-2.1']
  s.executables << 'ci_uy'
end
