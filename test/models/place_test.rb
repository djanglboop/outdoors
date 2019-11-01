require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  fixtures :places
  test "place attributes must not be empty" do
    place = Place.new
    assert place.invalid?
    assert place.errors[:title].any?
    assert place.errors[:description].any?
    assert place.errors[:image_url].any?
  end

  def new_place(image_url)
    Place.new(title: "Geirangerfjord", subtitle: "NORWAY", description: "yyy", image_url: image_url)
  end

  test "image url" do
    ok = %w{ norway.gif norway.jpg norway.png NORWAY.JPG NORWAY.Jpg 
             http://a.b.c/x/y/z/norway.gif }
    bad = %w{ norway.doc norway.gif/more norway.gif.more }
    
    ok.each do |image_url|
      assert new_place(image_url).valid?,
             "#{image_url} shouldn't be invalid"
    end

    bad.each do |image_url|
      assert new_place(image_url).invalid?,
             "#{image_url} shouldn't be valid"
    end
  end

  test "place is not valid without unique title" do
    place = Place.new(title: places(:norway).title, description: "yyy", image_url: "norway.gif")

    assert place.invalid?
    assert_equal ["has already been taken"], place.errors[:title]
  end

  test "place is not valid without a unique title - i18n" do
    place = Place.new(title: places(:norway).title, description: "yyy", image_url: "norway.gif")

    assert place.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], place.errors[:title]
  end

end
