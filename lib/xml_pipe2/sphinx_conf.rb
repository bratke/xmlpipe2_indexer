module XMLPipe2

  class SphinxConf

    TEMPLATE = File.read(File.expand_path(File.dirname(__FILE__) + '/../../erb/sphinx.conf.erb'))

    def initialize(clazz)
      @clazz = clazz
    end

    attr_reader :clazz

    def generate
      ERB.new(TEMPLATE).result(binding)
    end

  end

end


