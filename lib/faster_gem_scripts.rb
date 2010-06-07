require 'sane'

class FasterGemScripts

  def self.overwrite full_path
    contents_should_be = File.read File.dirname(__FILE__) + '/template'
    if File.file?(full_path)
       puts 'faster_gem_scripts: optimizing ' + full_path + '...'
       File.open(full_path, 'wb') do |f| f.write(contents_should_be); end
       bin_loc = full_path + '_bin_location'
       File.delete(bin_loc) if File.exist?(bin_loc)
    else
      puts "unable to find the binary:" + full_path + " you may want to find it and overwrite it yourself using C:\>faster_gem_script file_name (no .bat)"
    end
  end
  
  def self.clear_caches!
   bin_dir = File.dirname(OS.ruby_bin)
   Dir[bin_dir + '/*_bin_location'].each{|file|
     puts 'faster_gem_scripts clearing previously cached file ' + file
     File.delete file   
  }    
  end

end
