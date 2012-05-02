module XMLPipe2

  class DeltaIndexer

    def initialize instance
      @instance = instance

      @xml_stream = Tempfile.new('xml_stream.xml')
      @xml_stream.write(instance.xml_stream)
      @xml_stream.close

      @sphinx_conf = Tempfile.new('sphinx.conf')
      xml_stream_path = @xml_stream.path
      @sphinx_conf.write(ERB.new(instance.class.sphinx_conf).result(binding))
      @sphinx_conf.close
    end

    attr_reader :instance, :sphinx_conf, :xml_stream

    def run
      config = '-c ' + sphinx_conf.path
      index = instance.class.to_s.downcase
      system("$(which indexer) #{config} #{index}_delta && $(which indexer) #{config} --merge #{index} #{index}_delta --rotate")
      sphinx_conf.unlink
      xml_stream.unlink
    end

  end

end

