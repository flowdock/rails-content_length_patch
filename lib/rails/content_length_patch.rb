require "rails/content_length_patch/version"
require "rack/utils"

module Rails
  module ContentLengthPatch
    module Renderer
      def render(*args)
        add_content_length(super)
      end

      def add_content_length(body)
        if !::Rack::Utils::STATUS_WITH_NO_ENTITY_BODY.include?(status.to_i) &&
           !headers['Content-Length'] &&
           !headers['Transfer-Encoding'] &&
           body.respond_to?(:to_ary)

          obody = body
          body, length = [], 0
          obody.each { |part| body << part; length += ::Rack::Utils.bytesize(part) }
          obody.close if obody.respond_to?(:close)
          self.headers['Content-Length'] = length.to_s
        end
        body
      end
    end
  end
end
