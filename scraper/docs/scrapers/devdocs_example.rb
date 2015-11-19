module Docs
  class DevdocsExample < FileScraper
    self.name = 'HelloWorld'
    self.type = 'sphinx'
    self.version = '1.8.6'
    self.dir = '/Users/maloneyc/work/devdocs/devdocs_example'
    self.base_url = 'https://www.example.com/'
    self.root_path = 'index.html'
    self.links = {
      home: 'https://www.example.com/',
      code: 'https://github.com/klortho/devdocs_example'
    }

    html_filters.push 'devdocs_example/entries', 'devdocs_example/clean_html'
    text_filters.push 'devdocs_example/fix_urls'

    options[:container] = '#main-content'

    options[:skip] = %w(
      skipped_file.html)

    options[:skip_patterns] = [
      /\Askipped_dir\//]

    options[:attribution] = <<-HTML
      Public domain.
    HTML
  end
end
