ruby-baidu
==========


#to get the result list by querying "abc"
Query::Engine::Baidu.new.query("abc").ranks().each do |id,value|
    puts id,value
end

#to get the result list with host "www.abc.com.cn" by querying "abc"
Query::Engine::Baidu.new.query("abc").ranks("www.abc.com.cn").each do |id,value|
    puts id,value
end

#to get the result list with host which fit the regex /com.cn/ by querying "abc"
Query::Engine::Baidu.new.query("abc").ranks(/com.cn/).each do |id,value|
    puts id,value
end

# to get the top rank of host "www.abc.com.cn" by querying "abc"
Query::Engine::Baidu.new.query("abc").rank("www.abc.com.cn")

TODO:
查询结果不多,翻页不存在时的处理,及rspec