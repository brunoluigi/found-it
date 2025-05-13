class ItemView < ApplicationRecord
  belongs_to :item

  # Stores the IP address of the viewer
  # Example: '192.168.1.1'
  validates :ip_address, presence: true

  # Stores the session-based anonymous user hash
  validates :anon_user_hash, presence: true

  # Timestamp for when someone found the item
  # Example: 2025-05-08 16:22:00
  # field: found_it_at :datetime

  # Message describing how/where it was found
  # field: found_it_message :text

  # Prevent duplicate views from the same user/IP for the same item
  validates :item_id, uniqueness: { scope: [ :ip_address, :anon_user_hash ], message: "has already been viewed by this user or IP" }

  scope :found, -> { where.not(found_it_at: nil) }
end
