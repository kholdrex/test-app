namespace :news do
  desc "parse news"
  task :parse => :environment do
    Settings.parsed_pages_count.to_i.times do
      HackerNewsParser.instance.parse.each do |article|
        Article.find_or_create_by(article)
      end

      HackerNewsParser.instance.next_page
    end
  end
end