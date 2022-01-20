class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each(&method(:update_item))
  end

  def update_item(item)
    case item.name
    when "Aged Brie"
      item.sell_in -= 1
      item.quality += 1
      item.quality += 1 if item.sell_in < 0
      item.quality = item.quality.clamp(0, 50)
    when "Backstage passes to a TAFKAL80ETC concert"
      item.sell_in -= 1
      item.quality += 1
      item.quality += 1 if item.sell_in < 10
      item.quality += 1 if item.sell_in < 5
      item.quality += 1 if item.sell_in < 0
      item.quality = item.quality.clamp(0, 50)
    when "Sulfuras, Hand of Ragnaros"
    else
      item.sell_in -= 1
      item.quality -= 1
      item.quality -= 1 if item.sell_in < 0
      item.quality = item.quality.clamp(0, 50)
    end
  end
end
