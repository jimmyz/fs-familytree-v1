require 'spec'

require File.join(File.dirname(__FILE__), '..', 'lib', 'fs_familytree_v1')

Spec::Runner.configure do |config|
  
end

def fixture_file(filename)
  File.read(File.dirname(__FILE__) + "/fixtures/#{filename}")
end