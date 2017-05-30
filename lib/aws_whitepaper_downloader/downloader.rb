module AwsWhitepaperDownloader
  class Downloader

    WHITE_PAPPER_ROOT_DIR = "#{__dir__}/white pappers"

    def initialize
    end

    def run( hash, download_path )
      download_path = download_path ? "#{ download_path }/white pappers" : WHITE_PAPPER_ROOT_DIR
      check_dir_created( nil, download_path )

      hash.each_pair do |key, value|
        current_dir = check_dir_created( key, download_path )
        case value['type']
        when 'normal'
          Dir.chdir current_dir
          puts 'normal'
          hash.each_pair do |k1, v1|
            next if k1 == 'type'
            v1.each do |k2, v2|
              next if k2 == 'type'
              download( k2, v2,"#{current_dir}/#{v2}")
            end
          end
        when 'nested'
          puts 'nested'
          value.each_pair do |k1, v1|
            next if k1 == 'type'
            nested_dir = check_dir_created( k1, current_dir )
            Dir.chdir( nested_dir )

            v1.each do |k2, v2|
              next if k2 == 'type'
              download( k2, v2,"#{nested_dir}/#{v2}")
            end
          end
        end

      end
    end
    # def run( download_dir )
    # end

    private

    def download( file_name, path, download_dir )
      unless File.exist? "#{file_name}.pdf"
        `wget "#{file_name}.pdf" #{path}`
      end
    end
    def check_dir_created( name, path )
      location = "#{path}/#{name}"
      Dir.mkdir location unless Dir.exist?( location )
      return location
    end

  end
end