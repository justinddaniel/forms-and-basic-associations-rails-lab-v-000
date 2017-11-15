class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def note_contents=(contents)
    if !!contents
      self.notes << Note.find_by(content: contents) if Note.find_by(content: contents)
    end
  end

  def note_contents
    self.notes.collect do |n|
      n.content
    end
  end

end
