# This inherits from devdocs Filter
# (https://github.com/Thibaut/devdocs/blob/master/lib/docs/core/filter.rb)
# which inherits from HTML::Pipeline::Filter
# (https://github.com/jch/html-pipeline/blob/master/lib/html/pipeline/filter.rb)

module Docs
  class DevdocsExample
    class CleanHtmlFilter < Filter

      # Every filter class must have a call method
      def call

        # This sets the instance variable (`@` denotes instance variable) per
        # the CSS selector
        @doc = at_css('.content')

        # Remove the permalinks, which have class "headerlink"
        css('.headerlink').each do |node|

          # Normally, the id that this references is set on a <span>
          # preceding the header. Let's move that id to the header itself,
          # and delete the <span>

          # Get the id; it's the @href value without the initial '#'
          id = node['href'][1..-1]

          # Set the id on the header element
          node.parent['id'] ||= id

          # Remove the span
          doc.at_css("span##{id}").try(:remove)

          # Remove the permalink
          node.remove
        end

        # This strips any markup out of these elements; converting them
        # into pure text. For example, it gets rid of hyperlinks
        css('h1', 'h2', 'h3', 'dt').each do |node|
          node.content = node.content
        end

        # `doc` is a method that (if necessary, parses the HTML, and then) returns
        # the @doc instance variable.
        # This line causes the call method to return the doc.
        doc

      end
    end
  end
end
