require "dry/view"
require "slim"

require_relative "../view/parts/note"

module Views
  class Notes < Dry::View
    config.paths = [File.join(__dir__, "../templates")]
    config.layout = "application"
    config.template = "notes/index"
    config.part_namespace = View::Parts

    attr_reader :notes_repo

    def initialize(notes_repo:)
      @notes_repo = notes_repo
      super()
    end

    expose :notes do
      notes_repo
    end
  end
end
