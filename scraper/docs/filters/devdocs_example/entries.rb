module Docs
  class DevdocsExample
    class EntriesFilter < Docs::EntriesFilter

      # This gets the name for a page from its first <h1>. That name
      # appears in the left nav pane.
      # This also removes any pilcrow (¶, used for permalinks)
      def get_name
        at_css('h1').content.remove("\u{00b6}")
      end


      # Assigns a type to every page, based on its path. These show up as
      # collapsible lists in the nav pane, in alphabetical order
      def get_type
        case subpath
          when /\Aintro/
            'Intro pages'
          when /\Aref/
            'API'
          else
            'Other pages'
        end
      end

      def additional_entries
        entries = []

        # In any HTML file, if there is a <dl> element with a @class value
        # of "class", then create a new entry for it.
        css('dl.class').each do |node|

          # The id of the new entry will be the @id attribute on the child
          # <dt> element -- make sure it is unique.
          next unless id = node.at_css('dt')['id']

          # The name will be the same as the id, but with the package name
          # stripped off
          next unless name = id.dup.sub!('myapp.', '')

          # The type will be what appears in the left nav pane
          path = name.split('.')
          type = "myapp.#{path.first}"

          # Push this entry onto the list
          entries << [name, id, type]
        end

        entries
      end

    end
  end
end
