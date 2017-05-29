require 'open-uri'
require 'nokogiri'

module AwsWhitepaperDownloader
  class Crawler

    def initialize
    end

    def run
      count = 0
      start = nil
      output = {}
      flag = 0
      current_hash = nil
      pdfs = nil
      title = nil
      doc = Nokogiri::HTML( open("https://aws.amazon.com/whitepapers/"))
      doc.css(".content > .title-wrapper, .content > .row-builder").each do |div|

        # div == title-wrapper
        if div['class'].match("title-wrapper")
          title = parse_title( div )
          output[title] ||= {}
          current_hash = output[title]
        end

        # div == row-builder
        next unless current_hash
        next unless div['class'].match("row-builder")
        # nested
        if div.css('h3').size > 0
          current_hash['type'] = 'nested'
          sub_divs = div.css(
            ".wrapper > .columns > .parsys > .columnbuilder,
            .wrapper > .columns > .parsys > .title-wrapper"
          )
          sub_divs.each do |sub_div|
            if subtitle = parse_subtitle( sub_div )
              current_hash[subtitle] ||= {}
              pdfs = current_hash[subtitle]
            end
            pdfs = parse_pdfs(sub_div, pdfs)
          end
        # normal
        else
          current_hash['type'] = 'normal'
          pdfs = output[title]
          pdfs = parse_pdfs(div, pdfs)
        end

      end
      return output
    end

    private

    def parse_title( title_wrapper )
      return title_wrapper.css('h1').text.strip
    end

    def parse_subtitle( row_builder )
      h3_title = row_builder.css('h3').text.strip
      return h3_title.size > 0 ? h3_title : nil
    end

    def parse_pdfs( html, pdfs )
      html.css('li').each do |x|
        pdf_name = x.css('b').text()
        pdf_url = "https:#{ x.css('a').first['href'] }" if x.css('a').first
        pdfs[pdf_name] = pdf_url if pdf_name.size > 0 && pdf_url.size > 0
      end
      return pdfs
    end

  end

end