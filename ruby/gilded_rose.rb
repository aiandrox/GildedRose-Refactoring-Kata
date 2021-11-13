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
    return if item.quality >= 50

    if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
      item.quality = item.quality - 1 if item.quality.positive? && (item.name != 'Sulfuras, Hand of Ragnaros')
    elsif
      item.quality = item.quality + 1
      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        item.quality = item.quality + 1 if item.sell_in < 11
        item.quality = item.quality + 1 if item.sell_in < 6
      end
    end
    item.sell_in = item.sell_in - 1
    if item.sell_in.negative?
      if item.name != 'Aged Brie'
        if item.name != 'Backstage passes to a TAFKAL80ETC concert'
          item.quality = item.quality - 1 if item.quality.positive?
        else
          item.quality = item.quality - item.quality
        end
      end
    end
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
