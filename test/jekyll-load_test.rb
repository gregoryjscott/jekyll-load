require 'jekyll-load'
require 'minitest/autorun'

describe 'Load' do

  let(:config) do
    Jekyll.configuration({
      'source' => 'test/fixtures',
      'permalink' => 'pretty',
      'quiet' => true
    })
  end

  let(:site) { Jekyll::Site.new(config) }

  before(:each) do
    site.process
  end

  it 'loads data into pages' do
    site.pages.each do |page|
      assert_equal 'this is data', page.data['data']
      assert_equal 'this is front matter', page.data['front matter']
    end
  end

  it 'adds item list to index page' do
    page = site.pages.detect { |page| page.path == 'index.md' }
    assert_equal 1, page.data['items'].count
  end

  it 'adds item list to nested index pages' do
    page = site.pages.detect { |page| page.path == 'people/index.md' }
    assert_equal 2, page.data['items'].count
  end

  it 'puts page data into items' do
    pages = site.pages.select { |page| page.path.end_with? 'index.md' }
    pages.each do |page|
      page.data['items'].each do |item|
        assert_equal 'this is data', item['data']
        assert_equal 'this is front matter', item['front matter']
      end
    end
  end

  it 'adds page url to items' do
    pages = site.pages.select { |page| page.path.end_with? 'index.md' }
    pages.each do |page|
      page.data['items'].each do |item|
        assert_instance_of String, item['url']
      end
    end
  end
end
