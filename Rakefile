desc "Release gem"
task :release do
  
  system "gem build *.gemspec"
  system "gem push *.gem"
  system "rm *.gem"
  
end
