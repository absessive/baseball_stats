class Year < ActiveRecord::Base
  has_attached_file :file
  validates :year, numericality: { greater_than: 1900, less_than_or_equal_to: DateTime.now.strftime('%Y').to_i }
  validates :year, presence: true
  validates :year, uniqueness: true
  validates :file, presence: true
  validates_attachment_content_type :file, :content_type => ["text/xml"]
end
