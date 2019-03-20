require "dry/view"
require "slim"

require_relative "../view/parts/note"

module Views
  class Site < Dry::View
    config.paths = [File.join(__dir__, "../../templates")]
    config.layout = "application"
    config.part_namespace = View::Parts
  end
end
