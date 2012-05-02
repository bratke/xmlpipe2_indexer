module XMLPipe2

  class Configuration

    class << self

      def set
        yield(self)
      end

      attr_accessor :index_path
      attr_accessor :searchd
      attr_accessor :indexer

    end

  end

end
