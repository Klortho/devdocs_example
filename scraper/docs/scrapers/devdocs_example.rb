module Docs
  class DevdocsExample < FileScraper
    self.name = 'DevdocsExample'
    self.type = 'sphinx'
    self.version = '0.0.1'
    self.dir = '/Users/maloneyc/git/klortho/devdocs_example/src_html'
    self.base_url = 'https://www.example.com/'
    self.root_path = 'index.html'
    self.links = {
      home: 'https://www.example.com/',
      code: 'https://github.com/klortho/devdocs_example'
    }

    html_filters.push 'devdocs_example/entries', 'devdocs_example/clean_html'

    options[:container] = '#main-content'

    options[:attribution] = <<-HTML
      Public domain.
    HTML
  end
end
