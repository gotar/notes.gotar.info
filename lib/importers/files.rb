module Importers
  class Files
    def call(dir, pattern = "**/*")
      Dir[File.join(dir, pattern)]
        .select(&File.method(:file?))
    end
  end
end
