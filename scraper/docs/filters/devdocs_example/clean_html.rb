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

        # `doc` is a method that (if necessary, parses the HTML, and then) returns
        # the @doc instance variable.
        # This line causes the call method to return the doc.
        doc

      end
    end
  end
end
