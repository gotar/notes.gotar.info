require "date"
require "front_matter_parser"

module Mappers
  class Header
    def call(file)
      loader = FrontMatterParser::Loader::Yaml.new(whitelist_classes: [Date, Time])
      parsed = FrontMatterParser::Parser.parse_file(file, loader: loader)

      {
        header: parsed.front_matter,
        body: parsed.content
      }
    end
  end
end
