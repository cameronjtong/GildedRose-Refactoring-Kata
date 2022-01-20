class GildedRose
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
      when -100..-1
        item.quality = 0
      when 0..5
        item.quality += 3
      when 6..10
        item.quality += 2
      else
        item.quality += 1
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
