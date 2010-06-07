require 'sane'

class FasterGemScripts
  def self.overwrite full_path
   contents_should_be = File.read __dir__ + '/template'
   File.write(full_path, contents_should_be)
   bin_loc = full_path + '_bin_location'
   # delete old
   File.delete(bin_loc) if File.exist?(bin_loc)
  end
  
end
