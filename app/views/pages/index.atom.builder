atom_feed :language => 'en-US' do |feed|
  feed.title I18n.t("title")
  feed.updated @photos.first.updated_at
  @photos.each do |photo|
    url = URI.join(@host, photo.file.url(:medium))
    feed.entry(photo, url: url)  do |entry|
      entry.title photo.shot_at
      entry.url URI.join(@host, photo.file.url(:large))
      entry.content "<img src='#{url}'/>", type: "html"
      entry.enclosure url: url, type: photo.file.content_type
    end
  end
end
