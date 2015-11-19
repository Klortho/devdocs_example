module Docs
  class DevdocsExample
    class EntriesFilter < Docs::EntriesFilter
      # Remove the "pilcrow" (paragraph mark)
      def get_name
        at_css('h1').content.remove("\u{00b6}") + "foo"
      end

      def get_type
        case subpath
        when /\Aintro/
          'Files in the intro dir are of this type'
        end
      end

      def additional_entries
        entries = []

        css('dl.function', 'dl.class', 'dl.method', 'dl.attribute').each do |node|
          next unless id = node.at_css('dt')['id']
          next unless name = id.dup.sub!('django.', '')

          path = name.split('.')
          type = "django.#{path.first}"
          type << ".#{path.second}" if %w(contrib db).include?(path.first)

          name.remove! 'contrib.'
          name << '()' if node['class'].include?('method') || node['class'].include?('function')

          entries << [name, id, type]
        end

        entries
      end
    end
  end
end
