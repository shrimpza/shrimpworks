require 'pathname'

module Jekyll
    module Filters
        @imgmap = nil
        @ext = "png"

        def smilify(text)
            sitecontext = @context.registers[:site];

            theme = sitecontext.config['smileytheme']
            path = sitecontext.config['smileypath']
            mappath = (Pathname.new(sitecontext.source) + "_includes/smileys").expand_path

            unless theme == false

                if @imgmap == nil
                    @imgmap = YAML.load_file("#{mappath}/default.yml");
                    if File.exists?("#{mappath}/#{theme}.yml")
                        newmap = YAML.load_file("#{mappath}/#{theme}.yml")
                        @imgmap = @imgmap.merge(newmap)
                    end
                    ext = (@imgmap.shift)[1]
                end

                @imgmap.each do |smiley, regex|
                    if File.exists?((Pathname.new(sitecontext.source) + "#{path}/#{theme}/#{smiley}.#{ext}").expand_path)
                        if regex != ""
                            text.sub!(regex, "<img src='/#{path}/#{theme}/#{smiley}.#{ext}' alt='[#{smiley}]' class='smiley'/>")
                        end
                    end
                end
            end

            text
        end
    end
end
