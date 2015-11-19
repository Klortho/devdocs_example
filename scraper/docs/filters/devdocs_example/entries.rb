module Docs
  class DevdocsExample
    class EntriesFilter < Docs::EntriesFilter

      # This gets the name for a page from its first <h1>. That name
      # appears in the left nav pane.
      def get_name
        at_css('h1').content
      end

    end
  end
end
