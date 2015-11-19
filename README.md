This repository has example HTML documentation, and scraper code
for devdocs.io.

To run the scraper, first clone this repo, and then clone the
[devdocs repository](https://github.com/Thibaut/devdocs), and
follow the instructions there to set up your environment.

Then, create softlinks for the scraper source code:

```
ln -s `realpath devdocs_example/scraper/docs/scrapers/devdocs_example.rb` \
  devdocs/lib/docs/scrapers/devdocs_example.rb
mkdir devdocs/lib/docs/filters/devdocs_example
ln -s `realpath devdocs_example/scraper/docs/filters/devdocs_example/clean_html.rb` \
  devdocs/lib/docs/filters/devdocs_example/clean_html.rb
ln -s `realpath devdocs_example/scraper/docs/filters/devdocs_example/entries.rb` \
  devdocs/lib/docs/filters/devdocs_example/entries.rb
ln -s `realpath devdocs_example/scraper/docs/filters/devdocs_example/fix_urls.rb` \
  devdocs/lib/docs/filters/devdocs_example/fix_urls.rb
```

In devdocs_examples.rb, edit the `self.dir` to point to the absolute
path of the src_html directory.

In *devdocs*, do:

```
thor docs:generate --force --verbose --debug devdocs_example
rackup
```

Then you should see the "Devdocs Example" documentation in your browser at
[http://localhost:9292/]() (under "DISABLED").


# Branches

## hello_world

Bare minimum.

## basic

Adds:

* Links for home page and source code (in devdocs_example.rb)
* A minimal clean_html filter (filters/devdocs_example/clean_html.rb)
* Selector (#main-content) for the outer-most container in every HTML file
* Skipping individual files (by name) and directories (using a pattern),
  in devdocs_example.rb
* Added attribution, in devdocs_example.rb
* Add get_name method to the entries.rb filter, to get the name of a page
  from its first <h1>
