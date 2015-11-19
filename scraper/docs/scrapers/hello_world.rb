module Docs
  class HelloWorld < FileScraper
    self.name = 'HelloWorld'
    self.type = 'sphinx'
    self.version = '1.8.6'
    self.dir = '/Users/maloneyc/work/devdocs/hello_world'
    self.base_url = 'https://www.example.com/'
    self.root_path = 'index.html'
    self.links = {
      home: 'https://www.example.com/',
      code: 'https://github.com/klortho/devdocs'
    }

    html_filters.push 'hello_world/entries', 'hello_world/clean_html'
    text_filters.push 'hello_world/fix_urls'

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
