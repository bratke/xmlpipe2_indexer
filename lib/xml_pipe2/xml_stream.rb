module XMLPipe2

  class XMLStream

    TEMPLATE = File.read(File.expand_path(File.dirname(__FILE__) + '/../../erb/xml_stream.xml.erb'))

    def initialize(instance)
      @instance = instance
      @document_id = instance.id
    end

    attr_reader :instance
    attr_accessor :document_id

    def generate
      fields = instance.class.sphinx_indexes.inject({ }) do |hash, index|
        if index[:options].has_key?(:as) and index[:options][:as] == :document_id
          self.document_id = instance.send(index[:method])
        else
          if index[:options].has_key?(:as)
            hash.merge!(index[:options][:as] => instance.send(index[:method]))
          else
            hash.merge!(index[:method] => instance.send(index[:method]))
          end
        end
        hash
      end
      attrs = instance.class.sphinx_attributes.inject({ }) do |hash, attr|
        if attr[:options].has_key?(:as)
          hash.merge!(attr[:options][:as] => instance.send(attr[:method]))
        else
          hash.merge!(attr[:method] => instance.send(attr[:method]))
        end
        hash
      end
      ERB.new(TEMPLATE).result(binding)
    end

  end

end

