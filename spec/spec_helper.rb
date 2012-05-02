$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'xmlpipe2_indexer'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|

end

XMLPipe2::Configuration.set do |config|
  config.index_path = File.expand_path(File.dirname(__FILE__))
  config.searchd = { listen: '127.0.0.1:9312',
                     log: File.expand_path(File.dirname(__FILE__) + '/searchd.log'),
                     query_log: File.expand_path(File.dirname(__FILE__) + '/searchd.query.log'),
                     pid_file: File.expand_path(File.dirname(__FILE__) + '/searchd.pid') }
  config.indexer = { mem_limit: '256M' }
end

class Article

  extend XMLPipe2

  def id
    "8b49b130-7664-012f-15fa-18a905d9fec6"
  end

  def custom_id
    4133693989
  end

  def content
    "some content"
  end

  def title
    "any title"
  end

  define_index do
    index :title
    index :content, as: :data
    sphinx_id :custom_id
    index_options enable_star: 1, min_infix_len: 3
    has :id
    has :id, as: :uuid
  end

end
