module Jekyll

  # The CategoryIndex class creates a single category page for the specified category.
  class CategoryPage < Page

    # Initializes a new CategoryIndex.
    #
    #  +template_path+ is the path to the layout template to use.
    #  +site+          is the Jekyll Site instance.
    #  +base+          is the String path to the <source>.
    #  +category_dir+  is the String path between <source> and the category folder.
    #  +category+      is the category currently being processed.
    def initialize(template_path, name, site, base, category_dir, category)
      @site  = site
      @base  = base
      @dir   = category_dir
      @name  = name

      self.process(name)

      if File.exist?(template_path)
        @perform_render = true
        template_dir    = File.dirname(template_path)
        template        = File.basename(template_path)
        # Read the YAML data from the layout page.
        self.read_yaml(template_dir, template)
        self.data['category']    = category
        # Set the title for this page.
        title_prefix             = site.config['category_title_prefix'] || 'Category: '
        self.data['title']       = "#{title_prefix}#{category}"
        # Set the meta-description for this page.
        meta_description_prefix  = site.config['category_meta_description_prefix'] || 'Category: '
        self.data['description'] = "#{meta_description_prefix}#{category}"
      else
        @perform_render = false
      end
    end

    def render?
      @perform_render
    end

  end

  # The CategoryIndex class creates a single category page for the specified category.
  class CategoryIndex < CategoryPage

    # Initializes a new CategoryIndex.
    #
    #  +site+         is the Jekyll Site instance.
    #  +base+         is the String path to the <source>.
    #  +category_dir+ is the String path between <source> and the category folder.
    #  +category+     is the category currently being processed.
    def initialize(site, base, category_dir, category)
      template_path = File.join(base, '_layouts', 'category_index.html')
      super(template_path, 'index.html', site, base, category_dir, category)
    end

  end

  # The Site class is a built-in Jekyll class with access to global site config information.
  class Site

    # Creates an instance of CategoryIndex for each category page, renders it, and
    # writes the output to a file.
    #
    #  +category+ is the category currently being processed.
    def write_category_index(category)
      target_dir = GenerateCategories.category_dir(self.config['category_dir'], category)
      index      = CategoryIndex.new(self, self.source, target_dir, category)
      if index.render?
        index.render(self.layouts, site_payload)
        index.write(self.dest)
        # Record the fact that this pages has been added, otherwise Site::cleanup will remove it.
        self.pages << index
      end
    end

    # Loops through the list of category pages and processes each one.
    def write_category_indexes
      if self.layouts.key? 'category_index'
        self.categories.keys.each do |category|
          self.write_category_index(category)
        end

      # Throw an exception if the layout couldn't be found.
      else
        throw "No 'category_index' layout found."
      end
    end

  end


  # Jekyll hook - the generate method is called by jekyll, and generates all of the category pages.
  class GenerateCategories < Generator
    safe true
    priority :low

    CATEGORY_DIR = 'categories'

    def generate(site)
      site.write_category_indexes
    end

    # Processes the given dir and removes leading and trailing slashes. Falls
    # back on the default if no dir is provided.
    def self.category_dir(base_dir, category)
      base_dir = (base_dir || CATEGORY_DIR).gsub(/^\/*(.*)\/*$/, '\1')
      category = category.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-').downcase
      File.join(base_dir, category)
    end

  end

end
