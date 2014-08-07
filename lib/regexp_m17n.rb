module RegexpM17N
  def self.non_empty?(str)
    str =~ Regexp.new(SetEnc.encode('^.+$', str.encoding))
  end
end


module SetEnc

  # Encodes the given string with the given encoding (even for dummy encodings)
  #
  # There are 2 dummy encodings that fail to convert from 'UTF-8':
  #  - ISO-2022-JP-2
  #  - UTF-7
  # In these 2 special cases it returns the original string back as it is.
  #
  # @param [String] str
  # @param [Encoding] encoding
  #
  # @return [String] encoded str
  #
  # P.S. it changes the given string
  #
  def self.encode(str, encoding)
    str.encode(encoding)
  rescue Encoding::ConverterNotFoundError => e
    puts "%s: %s" % [e.class.name, e.message]
  ensure
    return str
  end
end