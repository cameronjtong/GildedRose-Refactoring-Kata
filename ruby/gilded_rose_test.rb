require_relative 'gilded_rose_old'
require_relative 'gilded_rose'
require 'test/unit'

class TestGildedRose < Test::Unit::TestCase
  def test_behaves_exactly_like_old_implementation
    items1 = build_items
    items2 = build_items_old
    gilded_rose1 = GildedRose.new(items1)
    gilded_rose2 = GildedRoseOld.new(items2)

    50.times do
      gilded_rose1.update_quality
      gilded_rose2.update_quality

      items1.size.times do |i|
        assert_equal items2[i].to_s, items1[i].to_s
      end
    end
  end

  def build_items
    [
      Item.build(name="+5 Dexterity Vest", sell_in=10, quality=20),
      Item.build(name="Aged Brie", sell_in=2, quality=0),
      Item.build(name="Elixir of the Mongoose", sell_in=5, quality=7),
      Item.build(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
      Item.build(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
      Item.build(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
      Item.build(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
      Item.build(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
      # This Conjured item does not work properly yet
      Item.build(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
    ]
  end

  def build_items_old
    [
      ItemOld.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
      ItemOld.new(name="Aged Brie", sell_in=2, quality=0),
      ItemOld.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
      ItemOld.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
      ItemOld.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
      ItemOld.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
      ItemOld.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
      ItemOld.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
      # This Conjured item does not work properly yet
      ItemOld.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
    ]
  end
end
