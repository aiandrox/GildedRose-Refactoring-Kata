# frozen_string_literal: true

class GildedRose
  def initialize(items)
    @items = items
  end

  # 1日経過時に実行する
  def update_quality
    @items.each do |item|
      update_each_quality(item)
    end
  end

  private

  def update_each_quality(item)
    return if item.name == 'Sulfuras, Hand of Ragnaros'
    return decline_sell_in(item) if item.quality >= 50 || item.quality.zero?

    if (item.name == 'Aged Brie') || (item.name == 'Backstage passes to a TAFKAL80ETC concert')
      item.quality = item.quality + 1
      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        item.quality = item.quality + 1 if item.sell_in < 11
        item.quality = item.quality + 1 if item.sell_in < 6
      end
    else
      item.quality = item.quality - 1
    end

    decline_sell_in(item)

    if item.sell_in.negative?
      return if item.name == 'Aged Brie'

      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        item.quality = 0
      else
        item.quality = item.quality - 1
      end
    end
  end

  def decline_sell_in(item)
    item.sell_in = item.sell_in - 1
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
