require_relative "gilded_rose"
require_relative "gilded_rose_old"

describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items1 = build_items
      items2 = build_items

      100.times do
        GildedRoseOld.new(items1).update_quality
        GildedRose.new(items2).update_quality

        items1.zip(items2).each do |item1, item2|
          expect(item1).to have_attributes(
            name: item2.name,
            sell_in: item2.sell_in,
            quality: item2.quality
          )
        end
      end
    end
  end

  def build_items
    [
      Item.new("Normal Item", 20, 40),
      Item.new("Aged Brie", 20, 20),
      Item.new("Backstage passes to a TAFKAL820ETC concert", 20, 20),
      Item.new("Sulfuras, Hand of Ragnaros", 20, 20),
    ]
  end
end
