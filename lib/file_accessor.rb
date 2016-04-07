class FileAccessor

  def create_output_file(path, contents, length)
    @path = path
    File.write(path, contents)
    puts length_of_message(length)
  end

  def extract_contents(path)
    File.read(path).chomp
  end

  private

  def length_of_message(length)
    "Created #{@path} containing #{length} characters"
  end

end
