require 'active_support'
require 'minitest/autorun'
require 'rails-content_length_patch'

module ActionController
  TestRoutes = ActionDispatch::Routing::RouteSet.new
  TestRoutes.draw do
    match ':controller(/:action)', via: [:all]
  end

  class Base
    include ActionController::Testing
    include TestRoutes.url_helpers
  end

  class ActionController::TestCase
    setup do
      @routes = TestRoutes
    end
  end
end

class ContentLengthTestController < ActionController::Base
  def render_text
    render :text => "Hello world"
  end
end

class ContentLengthTest < ActionController::TestCase
  tests ContentLengthTestController

  def test_render_defaults
    get :render_text
    assert_equal "Hello world".length.to_s, @response.headers["Content-Length"]
  end
end
