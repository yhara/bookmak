module SummonHelper
  def escape_quotes(str)
    str.gsub(/"/, '\\"') #.gsub(/'/){ "\\'" }  # to avoid "\'"... ('A`)
  end

  def use_parent_location(javascript)
    javascript.gsub(/\blocation\b/, "parent.location")
  end

  def to_embed(javascript)
    escaped = escape_quotes(javascript) #.sub(/\Ajavascript:/, '')
    (h escaped).gsub(/'/, "&#039;");
  end
end
