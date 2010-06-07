  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "faster_gem_script"
    gemspec.summary = "A utility to make ruby \"command line scripts\" run much faster by using gem prelude instead of full rubygems"
    gemspec.email = "rogerdpack@gmail.com"
    gemspec.homepage = "http://github.com/rdp/faster_gem_scripts"
    gemspec.authors = ["Roger Pack"]
    gemspec.add_dependency('sane', '>= 0.17.0')
    gemspec.add_dependency('faster_require')
    gemspec.add_development_dependency('rspec')
    # don't need faster_rubygems here, as we auto install it
    gemspec.extensions = 'ext/mkrf_conf.rb'
  end