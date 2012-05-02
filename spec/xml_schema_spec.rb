require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "XMLSchema" do

  it "should generate a valid XMLSchema" do

    XMLPipe2::XMLSchema.new(Article).generate.should ==
        %(<?xml version="1.0" encoding="utf-8"?>

<sphinx:docset>

<sphinx:schema>
<sphinx:field name="title"/>
<sphinx:field name="data"/>
<sphinx:attr name="id" type="string"/>
<sphinx:attr name="uuid" type="string"/>
</sphinx:schema>

</sphinx:docset>
)
  end
end
