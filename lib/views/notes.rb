require_relative "./site"

module Views
  class Notes < Site
    config.template = "notes/index"

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
