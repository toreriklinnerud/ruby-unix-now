begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "ruby-unix-now"
    gemspec.summary = "Run system commands using the best of ruby syntax: symbols, hashes and arrays."
    gemspec.description = "A tiny library which attempts to bridge the gap between ruby code and executing system commands. No more more string concatenation to build up commands."
    gemspec.email = "tel@jklm.no"
    gemspec.homepage = "http://github.com/toreriklinnerud/ruby-unix-now"
    gemspec.authors = ["Tor Erik Linnerud"]
    gemspec.files =  FileList["lib/ruby-unix-now.rb"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler -s http://gemcutter.org"
end