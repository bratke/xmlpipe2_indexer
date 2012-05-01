module XMLPipe2

  class IndexBuilder

    def initialize clazz
      @clazz = clazz

      @xml_schema = Tempfile.new('xml_schema.xml')
      @xml_schema.write(clazz.xml_schema)
      @xml_schema.close

      @sphinx_conf = Tempfile.new('sphinx.conf')
      xml_stream_path = @xml_schema.path
      @sphinx_conf.write(ERB.new(clazz.sphinx_conf).result(binding))
      @sphinx_conf.close
    end

    attr_reader :clazz, :sphinx_conf, :xml_schema

    def build
      system("$(which indexer) -c #{sphinx_conf.path} #{clazz.to_s.downcase}")
      sphinx_conf.unlink
      xml_schema.unlink
    end

  end

end
