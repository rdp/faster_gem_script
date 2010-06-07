require 'rubygems'
  require 'rubygems/command.rb'
  require 'rubygems/dependency_installer.rb' 
  begin
    Gem::Command.build_args = ARGV
    rescue NoMethodError
  end 
  inst = Gem::DependencyInstaller.new
  begin
    if RUBY_VERSION < "1.9" # need the helper
      inst.install "faster_rubygems"
    end
  rescue => e
    puts 'failed' + e + ' ' + e.backtrace.join(' ')
      exit(1)
      
  end 

  f = File.open(File.join(File.dirname(__FILE__), "Rakefile"), "w")   # create dummy rakefile to indicate success
  f.write("task :default\n")
  f.close
