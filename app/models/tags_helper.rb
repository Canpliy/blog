module TagsHelper
  def tags_to_s(separator=" ")
    rest = []
    tags.each do |tag|
      rest << tag.name
    end
    rest.join(separator)
  end

  def create_tags(str)
    tags = str.split

    self.tags.clear

    tags.each do |tag|
      self.tags.create(name: tag)
    end
  end
end