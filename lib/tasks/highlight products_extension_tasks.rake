namespace :spree do
  namespace :extensions do
    namespace :highlight_products do
      
      desc "Copies all migrations (NOTE: This will be obsolete with Rails 3.1)"
      task :migrations do
        source = File.join(File.dirname(__FILE__), '..', '..', 'db')
        destination = File.join(Rails.root, 'db')
        puts "INFO: Mirroring assets from #{source} to #{destination}"
        Spree::FileUtilz.mirror_files(source, destination)
      end
      
      desc "Copies public assets of the highlight products extension to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[HighlightProductsExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(HighlightProductsExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end