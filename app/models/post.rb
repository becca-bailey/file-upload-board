class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  before_save :default_values
  validates :title, presence: true

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  has_attached_file :document, styles: {thumbnail: "60x60#"}

  validates_attachment :document, content_type: { content_type: "application/pdf" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def default_values
    self.image_url ||= nil
    self.link_url ||= nil
  end
end
