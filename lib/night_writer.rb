require_relative 'file_accessor'

class NightWriter

  attr_reader :files

  def initialize
    @files = FileAccessor.new
  end

  def count_output_characters
    @files.extract_contents(ARGV[0]).length
  end

  def output_file(contents)
    @files.create_output_file(ARGV[1], contents)
    "Created #{ARGV[1]} containing #{count_output_characters} characters"
  end

end
