require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "SphinxConf" do

  it "should generate a valid SphinxConf" do

    XMLPipe2::SphinxConf.new(Article).generate.should ==
        %(indexer
{
mem_limit = 256M
}

searchd
{
listen = 127.0.0.1:9312
log = #{File.expand_path(File.dirname(__FILE__) +"/searchd.log")}
query_log = #{File.expand_path(File.dirname(__FILE__) +"/searchd.query.log")}
pid_file = #{File.expand_path(File.dirname(__FILE__) +"/searchd.pid")}
}


source article
{
type = xmlpipe2
xmlpipe_command = /bin/cat <%= xml_stream_path %>
xmlpipe_fixup_utf8 = 1
}

index article
{
source = article
path = #{File.expand_path(File.dirname(__FILE__) + '/article')}
charset_type = utf-8
enable_star = 1
min_infix_len = 3
}

index article_delta
{
source = article
path = #{File.expand_path(File.dirname(__FILE__) + '/article_delta')}
charset_type = utf-8
enable_star = 1
min_infix_len = 3
}
)
  end

end
