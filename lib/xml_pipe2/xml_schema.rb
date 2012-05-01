module XMLPipe2

  class XMLSchema < XMLStream

    TEMPLATE = File.read(File.expand_path(File.dirname(__FILE__) + '/../../erb/xml_schema.xml.erb'))

    def initialize(clazz)
      @clazz = clazz
    end

    attr_reader :clazz

    def generate
      fields = clazz.sphinx_indexes.inject({ }) do |hash, index|
        unless index[:options].has_key?(:as) and index[:options][:as] == :document_id
          if index[:options].has_key?(:as)
            hash.merge!(index[:options][:as] => nil)
          else
            hash.merge!(index[:method] => nil)
          end
        end
        hash
      end
      attrs = clazz.sphinx_attributes.inject({ }) do |hash, attr|
        if attr[:options].has_key?(:as)
          hash.merge!(attr[:options][:as] => nil)
        else
          hash.merge!(attr[:method] => nil)
        end
        hash
      end
      ERB.new(TEMPLATE).result(binding)
    end

  end

end
