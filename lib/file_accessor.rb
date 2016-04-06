class FileAccessor

  def create_output_file(path, contents, length)
    File.write(path, contents)
    puts length_of_message(length)
  end

  def extract_contents(path)
    contents = File.read(path)
  end

  private

  def length_of_message(length)
    "Created #{ARGV[1]} containing #{length} characters"
  end

end
