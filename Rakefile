begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "ruby-unix-now"
    gemspec.summary = "Run system commands using the best of ruby syntax: symbols, hashes and arrays."
    gemspec.description = "A one file library which bridges the gap between ruby code and system commands. No more string concatenation to build up commands."
    gemspec.email = "tel@jklm.no"
    gemspec.homepage = "http://github.com/toreriklinnerud/ruby-unix-now"
    gemspec.authors = ["Tor Erik Linnerud"]
    gemspec.files =  FileList["lib/ruby-unix-now.rb"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler -s http://gemcutter.org"
end