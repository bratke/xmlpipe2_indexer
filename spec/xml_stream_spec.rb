require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "XMLStream" do

  it "should generate a valid XMLStream" do

    XMLPipe2::XMLStream.new(Article.new).generate.should ==
        %(<?xml version="1.0" encoding="utf-8"?>

<sphinx:docset>

<sphinx:schema>
<sphinx:field name="title"/>
<sphinx:field name="data"/>
<sphinx:attr name="id" type="string"/>
<sphinx:attr name="uuid" type="string"/>
</sphinx:schema>

<sphinx:document id="4133693989">
<title>any title</title>
<data>some content</data>
<id>8b49b130-7664-012f-15fa-18a905d9fec6</id>
<uuid>8b49b130-7664-012f-15fa-18a905d9fec6</uuid>
</sphinx:document>

</sphinx:docset>
)
  end
end
