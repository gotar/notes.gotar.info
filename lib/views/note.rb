require_relative "./site"

module Views
  class Note < Site
    config.template = "notes/show"

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
