require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Configuration' do

  describe 'set configuration' do

    it 'should set index_path' do
      XMLPipe2::Configuration.index_path.should == File.expand_path(File.dirname(__FILE__))
    end

    { listen: '127.0.0.1:9312',
      log: File.expand_path(File.dirname(__FILE__) +"/searchd.log"),
      query_log: File.expand_path(File.dirname(__FILE__) +"/searchd.query.log"),
      pid_file: File.expand_path(File.dirname(__FILE__) +"/searchd.pid") }.each_pair do |setting, value|

      it "should set searchd ##{setting}" do
        XMLPipe2::Configuration.searchd[setting].should == value
      end

    end

    it 'should set indexer #mem_limit' do
      XMLPipe2::Configuration.indexer[:mem_limit].should == '256M'
    end

  end


end
