require 'test_helper'

class JournalTest < ActiveSupport::TestCase
  test "journal attributes must not be empty" do
    journal = Journal.new
    assert journal.invalid?
    assert journal.errors[:title].any?
    assert journal.errors[:subtitle].any?
    assert journal.errors[:image_url].any?
    assert journal.errors[:description].any?
    assert journal.errors[:image].any?
  end

end
