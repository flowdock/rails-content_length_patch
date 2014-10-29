require 'action_controller'
require 'rails/content_length_patch'

ActionController::Base.send(:include, Rails::ContentLengthPatch::Renderer)
