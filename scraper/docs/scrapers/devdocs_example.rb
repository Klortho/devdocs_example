module Docs
  class DevdocsExample < FileScraper
    self.name = 'DevdocsExample'
    self.type = 'sphinx'
    self.version = '0.0.1'
    self.dir = '/Users/maloneyc/git/klortho/devdocs_example/src_html'
    self.base_url = 'https://klortho.github.io/devdocs_examples/'
    self.root_path = 'index.html'

    # These links will be rendered at the top of the main page for the 
    # docset, as "Homepage" and "Source code"
    self.links = {
      home: 'https://klortho.github.io/devdocs_examples',
      code: 'https://github.com/klortho/devdocs_example'
    }

    # Filter stack
    html_filters.push 'devdocs_example/entries', 'devdocs_example/clean_html'

    # The outer-most container for content in all HTML files. Everything outside
    # of the element selected here is discarded. (Default is 'body'.)
    options[:container] = '#main-content'

    # Skip an list of individual files, by name
    options[:skip] = %w(
      skipped_file.html)

    # Skip sets of files, by pattern
    options[:skip_patterns] = [
      /\Askipped_dir\//]

    options[:attribution] = <<-HTML
      Attribution to the copyright holder should be given here.
      This repository (devdocs_example) is in the public domain, 
      see LICENSE.txt.
    HTML

  end
end
