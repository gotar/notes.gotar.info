require "date"
require "front_matter_parser"

module Mappers
  class Header
    FRONT_MATTER_LOADER = -> str {
      YAML.safe_load(str, _whitelist_classes = [Date, Time])
    }.freeze

    def call(file)
      parsed = FrontMatterParser::Parser.parse_file(file, loader: FRONT_MATTER_LOADER)

      {
        header: parsed.front_matter,
        body: parsed.content
      }
    end
  end
end
