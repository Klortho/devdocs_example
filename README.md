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

In *devdocs*, make sure that this document set is listed in

```
thor docs:list
```

Then, generate them with:

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
* Created a minimal clean_html filter (filters/devdocs_example/clean_html.rb),
  and added that to `html_filters` in devdocs_example.rb.
* Selector (#main-content) for the outer-most container in every HTML file
* Skipping individual files (by name) and directories (using a pattern),
  in devdocs_example.rb
* Added attribution, in devdocs_example.rb
* Add get_name method to the entries.rb filter, to get the name of a page
  from its first <h1>
* Added another HTML page, in a subdirectory: intro/tutorial.html. Both
  intro/tutorial and install show up as top-level pages under DevDocsExample.


## types

* Created a type, "Intro pages", in the entries.rb get_type method. All pages in
  the intro subdirectory will be of this type.
* Uses a default type, "Other pages", for those that don't match any of the
  given patterns
* Added another type, "API", for all pages that appear in the *ref* directory,
  and added a new page, ref/appconfig.html.
* Modify the get_name method to remove any pilcrow in the headings
* Add a clean_html step that removes permalinks, and fixes up header id's.
* Add a clean_html step that removes markup from inside headers

After this, what we get is a conversion of the source HTML tree:

* src_html/
    * index.html
    * install.html
    * intro/
        * tutorial.html
    * ref/
        * appconfig.html

Into this hierarchy in the left-side nav pane. Note that the nav pane 
order is alphabetical.

* DevdocsExample: [devdocsexample/](http://localhost:9292/devdocsexample/) - 
  content from index.html
    * API: [devdocsexample-api/](http://localhost:9292/devdocsexample-api/) - 
      autogenerated content; list of entries of this type
        * Application configuration: 
          [devdocsexample/ref/appconfig](http://localhost:9292/devdocsexample/ref/appconfig) -
          content from ref/appconfig.html
    * Intro pages: 
      [devdocsexample-intro-pages/](http://localhost:9292/devdocsexample-intro-pages/) -
      autogenerated list of entries of this type
        * Introduction / tutorial: 
          [intro/tutorial](http://localhost:9292/devdocsexample/intro/tutorial) -
          content from intro/tutorial.html
    * myapp.apps:
      [devdocsexample-myapp-apps/](http://localhost:9292/devdocsexample-myapp-apps/) -
      this is an autogenerated *type*, based on the `additional_entries` method in
      *entries.rb*; content is the list of pages of this type.
        * apps.AppConfig: 
          [devdocsexample/ref/appconfig#myapp.apps.AppConfig](http://localhost:9292/devdocsexample/ref/appconfig#myapp.apps.AppConfig) -
          content is the same as "Application configuration"; this links to a subsection
          of that page.
    * Other pages:
      [devdocsexample-other-pages/](http://localhost:9292/devdocsexample-other-pages/) -
      autogenerated list of entries of this type
        * Installation guide:
          [devdocsexample/install](http://localhost:9292/devdocsexample/install)


