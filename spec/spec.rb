require 'sane'
require_rel '../lib/faster_gem_scripts'
require 'spec/autorun'

describe "rewriter" do

  def setup
    File.delete 'abc' if File.exist?('abc')
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

end
