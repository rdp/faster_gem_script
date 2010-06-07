Gem.post_install { |gem_installer_instance|
  require 'faster_gem_scripts'
  all = gem_installer_instance.spec.files.select{|file| file =~ /^bin/ }
  bin_dir =  Gem.ruby.split('/')[0..-3].join('/')
  if all.length > 0
   FasterGemScripts.clear_caches!
   all.each{|script_name|
     name = bin_dir + '/' + script_name     
     FasterGemScripts.overwrite name
   }
  end
}

Gem.post_uninstall { |gem_installer_instance|
  require 'faster_gem_scripts'
  require 'sane'
  FasterGemScripts.clear_caches! if (gem_installer_instance.spec.files.select{|file| file =~ /^bin/ }.length > 0)
}