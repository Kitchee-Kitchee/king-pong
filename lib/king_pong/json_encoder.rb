require 'oj'
require 'oj_mimic_json'
Oj.default_options = {mode: :compat, indent: 2}

class OjEncoder
  def call(value)
    Oj.load(value)
  end
end
