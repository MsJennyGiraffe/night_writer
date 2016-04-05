class FileAccessor

  def create_output_file(path, contents)
    File.write(path, contents)
  end

  def extract_contents(path)
    contents = File.read(path)
  end

end
