require 'pry'
class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    str = ""
    self.characters.map do |char|
      str += char.name + " - "
      self.shows.map {|show| str += show.name}
    end
    str
  end

end
