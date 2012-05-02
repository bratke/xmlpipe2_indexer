module XMLPipe2

  class XMLSchema

    TEMPLATE = File.read(File.expand_path(File.dirname(__FILE__) + '/../../erb/xml_schema.xml.erb'))

    def initialize(clazz)
      @clazz = clazz
    end

    attr_reader :clazz

    def generate
      fields = clazz.sphinx_indexes.inject({ }) do |hash, index|
        index[:options].has_key?(:as) ? hash.merge!(index[:options][:as] => nil) : hash.merge!(index[:method] => nil)
        hash
      end
      attrs = clazz.sphinx_attributes.inject({ }) do |hash, attr|
        attr[:options].has_key?(:as) ? hash.merge!(attr[:options][:as] => nil) : hash.merge!(attr[:method] => nil)
        hash
      end
      ERB.new(TEMPLATE).result(binding)
    end

  end

end
