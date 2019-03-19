require "dry/view"
require "slim"

require_relative "../view/parts/note"

module Views
 class Note < Dry::View
    config.paths = [File.join(__dir__, "../templates")]
    config.layout = "application"
    config.template = "notes/show"
    config.part_namespace = View::Parts

    attr_reader :note

    def initialize(note:)
      @note = note
      super()
    end

    expose :note do
      note
    end
  end
end
