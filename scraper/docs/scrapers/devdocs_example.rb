module Docs
  class DevdocsExample < FileScraper
    self.name = 'DevdocsExample'
    self.type = 'sphinx'
    self.version = '0.0.1'
    self.dir = '/Users/maloneyc/git/klortho/devdocs_example/src_html'
    self.base_url = 'https://www.example.com/'
    self.root_path = 'index.html'

    html_filters.push 'devdocs_example/entries'
  end
end
