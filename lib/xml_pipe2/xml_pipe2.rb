module XMLPipe2

  attr_accessor :sphinx_indexes
  attr_accessor :sphinx_index_options
  attr_accessor :sphinx_attributes

  def define_index(&block)

    self.sphinx_indexes = []
    self.sphinx_attributes = []
    self.sphinx_index_options = {}

    block.call

    define_method :xml_stream do
      XMLStream.new(self).generate
    end

    define_method :index! do
      DeltaIndexer.new(self).run
    end

    class << self
      define_method :sphinx_conf do
        SphinxConf.new(self).generate
      end

      define_method :xml_schema do
        XMLSchema.new(self).generate
      end

      define_method :create_index! do
        IndexBuilder.new(self).build
      end

    end

  end

  def index method, options = { }
    self.sphinx_indexes << { method: method, options: options }
  end

  def has method, options = { }
    self.sphinx_attributes << { method: method, options: options }
  end

  def index_options options = { }
    self.sphinx_index_options = options
  end

end
