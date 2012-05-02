require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "XMLPipe2" do

  before(:all) do
    @article = Article.new
  end

  describe "instance methods" do

    subject { @article }

    [:xml_stream,
     :index!].each do |method|
      it { subject.should respond_to method }
    end

    describe "#xml_stream" do

      it "should generate a XMLStream" do
        mock = mock(:xml_stream)
        XMLPipe2::XMLStream.should_receive(:new).with(@article).and_return(mock)
        mock.should_receive(:generate)

        @article.xml_stream
      end

    end

    describe '#index!' do

      it "should run a DeltaIndexer" do
        mock = mock(:delta_indexer)
        XMLPipe2::DeltaIndexer.should_receive(:new).with(@article).and_return(mock)
        mock.should_receive(:run)

        @article.index!
      end

      it "should call system correctly" do
        XMLPipe2::DeltaIndexer.any_instance.should_receive(:system).exactly(1).
            with(/\$\(which indexer\) -c \/tmp\/sphinx.conf.* article_delta && \$\(which indexer\) -c \/tmp\/sphinx.conf.* --merge article article_delta --rotate/)

        @article.index!
      end

    end

  end



  describe "methods on class instance" do
    subject { Article }

    [:sphinx_indexes,
     :sphinx_attributes,
     :sphinx_index_options,
     :sphinx_conf,
     :xml_schema,
     :create_index!,
     :index,
     :has,
     :index_options,
     :sphinx_id].each do |method|
      it { subject.should respond_to method }
    end

    describe '#sphinx_conf' do

      it "should generate a SphinxConf" do
        mock = mock(:sphinx_conf)
        XMLPipe2::SphinxConf.should_receive(:new).with(Article).and_return(mock)
        mock.should_receive(:generate)

        Article.sphinx_conf
      end

    end

    describe "#xml_schema" do

      it "should generate a XMLSchema" do
        mock = mock(:xml_schema)
        XMLPipe2::XMLSchema.should_receive(:new).with(Article).and_return(mock)
        mock.should_receive(:generate)

        Article.xml_schema
      end

    end

    describe "#create_index!" do

      it "should build an index" do
        mock = mock(:index_builder)
        XMLPipe2::IndexBuilder.should_receive(:new).with(Article).and_return(mock)
        mock.should_receive(:build)

        Article.create_index!
      end

      it "should call system correctly" do
        XMLPipe2::IndexBuilder.any_instance.should_receive(:system).
            with(/\$\(which indexer\) -c \/tmp\/sphinx.conf.*article/)
        Article.create_index!
      end

    end


  end

end
