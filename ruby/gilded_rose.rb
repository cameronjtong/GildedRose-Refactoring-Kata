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
      item.quality = item.quality + 1 if item.quality < 50
      item.sell_in = item.sell_in - 1
      item.quality = item.quality + 1 if item.sell_in < 0 && (item.quality < 50)
    when "Backstage passes to a TAFKAL80ETC concert"
      if item.quality < 50
        item.quality = item.quality + 1
        item.quality = item.quality + 1 if item.sell_in < 11 && (item.quality < 50)
        item.quality = item.quality + 1 if item.sell_in < 6 && (item.quality < 50)
      end
      item.sell_in = item.sell_in - 1
      item.quality = item.quality + 1 if item.sell_in < 0 && (item.quality < 50)
    when "Sulfuras, Hand of Ragnaros"
    else
      item.quality = item.quality - 1 if item.quality > 0
      item.sell_in = item.sell_in - 1
      item.quality = item.quality - 1 if item.sell_in < 0 && item.quality > 0
    end
  end
end
