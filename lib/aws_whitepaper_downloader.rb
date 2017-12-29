require "aws_whitepaper_downloader/crawler"
require "aws_whitepaper_downloader/downloader"

module AwsWhitepaperDownloader
  def self.run( dir_path=nil )
    links_hash = Crawler.new.run
    Downloader.new.run( links_hash, dir_path )
  end
end
