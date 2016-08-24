require 'mechanize'
require 'singleton'

class HackerNewsParser < Mechanize::Page
  include Singleton

  BASE_URL = 'https://news.ycombinator.com/news'
  LIST_SELECTOR = '.itemlist'

  attr_accessor :agent, :page, :page_number

  def initialize
    @agent = Mechanize.new

    preparing
  end

  def next_page
    @page_number += 1

    load_page
  end

  def prev_page
    @page_number = @page_number > 1 ? @page_number - 1 : 1

    load_page
  end

  def parse(page_number = @page_number, reload = false)
    load_page_by_number(page_number) if reload

    authors = get_authors
    posts = get_links_and_titles

    posts.each_with_index do |elem, index|
      posts[index][:author] = authors[index]
    end
  end

  private

  def load_page_by_number(number)
    @page_number = number

    load_page
  end

  def get_links_and_titles
    @page.search("#{LIST_SELECTOR} .storylink").map do |link|
      {
          url: link.attributes['href'].value,
          title: link.children.text
      }
    end
  end

  def get_authors
    @page.search("#{LIST_SELECTOR} .hnuser").map { |link| link.children.text }
  end

  def preparing
    @page_number = 1

    load_page
  end

  def load_page
    @page = @agent.get(BASE_URL + "?p=#{@page_number}")
  end

end
