require "debride"
require "yaml"

module DebrideToOkuribito
  class Converter
    FILE_NAME = "okuribito.yml".freeze

    def convert_yaml(argv)
      hash = read_debride(argv)
      write_yaml(hash)
    end

    def read_debride(argv)
      puts "--- Run debride..."
      debride = Debride.run(argv)
      puts "--- Convert yaml..."
      debride_to_hash(debride)
    end

    def debride_to_hash(debride)
      hash = {}
      debride.missing.each do |klass, methods|
        ary = []
        methods.each do |method|
          if debride.method_locations["#{klass}##{method}"]
            ary << "##{method}"
          elsif debride.method_locations["#{klass}::#{method}"]
            ary << ".#{method}"
          end
        end
        hash.store(klass, ary) unless ary.empty?
      end
      hash
    end

    def write_yaml(hash)
      yaml = YAML.dump(hash)

      # Workaround...
      yaml.gsub!(/^---\n/, "")
      yaml.gsub!(/^- /, "  - ")

      generate_file(yaml, FILE_NAME)
      puts "--- 'okuribito.yml' has been generated."
    end

    private

    def generate_file(obj, filename)
      f = File.open(filename, "w")
      f.write(obj)
      f.close
    end
  end
end
