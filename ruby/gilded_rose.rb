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
      item.quality += item.sell_in < 0 ? 2 : 1
      item.quality = item.quality.clamp(0, 50)
    when "Backstage passes to a TAFKAL80ETC concert"
      item.sell_in -= 1
      case item.sell_in
      when (-100..-1) then item.quality += 4
      when (0..4) then item.quality += 3
      when (5..9) then item.quality += 2
      when (10..100) then item.quality += 1
      end
      item.quality = item.quality.clamp(0, 50)
    when "Sulfuras, Hand of Ragnaros"
    else
      item.sell_in -= 1
      item.quality -= item.sell_in < 0 ? 2 : 1
      item.quality = item.quality.clamp(0, 50)
    end
  end
end
