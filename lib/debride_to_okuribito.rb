require "yaml"
require "debride_to_okuribito/version"

module DebrideToOkuribito
  def self.debride_to_hash(debride)
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

  def self.write_yaml(hash)
    yaml = YAML.dump(hash)

    # Workaround...
    yaml.gsub!(/^---\n/, "")
    yaml.gsub!(/^- /, "  - ")

    f = File.open("okuribito.yml", "w")
    f.write(yaml)
    f.close
  end
end
