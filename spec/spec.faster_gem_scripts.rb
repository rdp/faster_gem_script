require 'rubygems'
require 'sane'
require_relative '../lib/faster_gem_scripts'
require 'spec/autorun'

describe "rewriter" do

  def setup
    File.delete 'abc' if File.exist?('abc')
    FileUtils.touch 'abc'
    FasterGemScripts.overwrite 'abc'
  end

  it "should overwrite a file" do
    setup
    new_contents = File.read('abc')
    assert new_contents.contain?("faster_rubygems")
  end

  it "should nuke the cache on write" do
    require 'fileutils'
    FileUtils.touch 'abc_bin_location'
    setup
    assert !File.exist?('abc_bin_location')
  end
  
  it "should clear olds on request" do
    old_file = File.dirname(OS.ruby_bin) + '/yo_bin_location' 
    FileUtils.touch old_file
    ARGV << 'yoyo'
    load __dir__ + '/../bin/faster_gem_script'
    assert !File.exist?(old_file)
  end
  
  it 'should overwrite zero length files'

end
