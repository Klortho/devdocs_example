module Docs
  class DevdocsExample
    class FixUrlsFilter < Filter
      def call
        html.gsub! %r{#{Regexp.escape(DevdocsExample.base_url)}([^"']+?)\.html}, "#{DevdocsExample.base_url}\\1/"
        html
      end
    end
  end
end
