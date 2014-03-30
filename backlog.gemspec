# make sure we can inherit the library for backlog correctly
lib = File.expand_path "./lib" 
$:.unshift lib unless $:.include?(lib)

require 'backlog'

Gem::Specification.new do |s|
  s.name        = "personal-backlog"
  s.version     = Backlog::VERSION
  s.licenses    = ['MIT']
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jon Morehouse"]
  s.email       = ["morehousej09@gmail.com"]
  s.homepage    = "http://github.com/backlog"
  s.summary     = %q{Personal Backlog manager}
  s.description = %q{Personal backlog cli. Wraps a github repository and utilizes markdown as a day to day management software}
 
  s.files        = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  s.executables  = ['backlog']
  s.require_path = 'lib'
end
