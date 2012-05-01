module XMLPipe2

  class Configuration

    class << self

      def set
        yield(self)
      end

      cattr_accessor :index_path
      cattr_accessor :searchd
      cattr_accessor :indexer

      def delta_index_path
        index_path + '_delta'
      end

    end

  end

end
