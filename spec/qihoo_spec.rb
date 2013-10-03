#coding:UTF-8
require 'spec_helper'
describe Query::Engine::Qihoo do
    qihoo = Query::Engine::Qihoo.new
    page = qihoo.query '奇虎'
    page2 = page.next
    page3 = page2.next
    it "查询关键词'奇虎'后,应返回正确的实例" do
        page.class.should == Query::Result::Qihoo
    end
    it "查询关键词'奇虎'后,下一页也应是MbaiduResult的实例" do
        page2.class.should == Query::Result::Qihoo
    end
    it "查询关键词'奇虎'后,下一页,再下一页也应是MbaiduResult的实例" do
        page3.class.should == Query::Result::Qihoo
    end

    it "查询关键词'奇虎'后,奇虎首页域名应该等于1" do
        page.rank('www.qihoo.com').should == 1
    end
    it "查询已经被收录的页面收录情况时,应返回true" do
        qihoo.indexed?('http://www.360.cn').should == true
    end
    it "查询一个不存在的页面收录情况时,应返回true" do
        qihoo.indexed?('http://zxv.not-exists.com').should == false
    end
end