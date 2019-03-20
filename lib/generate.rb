require_relative './importers/files'
require_relative 'mappers/header'
require_relative 'exporters/files'
require_relative 'views/notes'
require_relative 'views/note'

class Generate
  attr_reader :loader, :extract_header, :render

  NOTES = File.join(__dir__, "../notes/").freeze
  EXPORT_DIR = File.join(__dir__, "../build").freeze

  def initialize
    @loader = Importers::Files.new
    @extract_header = Mappers::Header.new
    @render = Exporters::Files.new
  end

  def call
    data = loader.(NOTES).map do |file|
      extract_header.(file)
    end

    render.(EXPORT_DIR, "index.html", Views::Notes.new(notes_repo: data).call.to_s)

    data.each do |note|
      render.(EXPORT_DIR, "#{note[:header]["permalink"]}/index.html", Views::Note.new(note: note).call.to_s)
    end
  end
end
