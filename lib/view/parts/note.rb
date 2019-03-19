require "commonmarker"
require "date"

module View
  module Parts
    class Note < Dry::View::Part
      def slug
        self[:header]["permalink"]
      end

      def title
        self[:header]["title"]
      end

      def published_date
        self[:header]["published_at"].to_date
      end

      def html_content
        CommonMarker.render_html(self[:body], :DEFAULT)
      end
    end
  end
end
