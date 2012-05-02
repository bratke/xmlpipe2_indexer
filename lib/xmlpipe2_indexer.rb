require 'tempfile'
require 'erb'

Dir[File.join(File.dirname(__FILE__) + "/xml_pipe2", "**/*.rb")].each { |file| require file }
