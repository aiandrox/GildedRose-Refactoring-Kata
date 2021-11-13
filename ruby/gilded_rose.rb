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

    item.quality = item.quality + addition_quality(item) if within_quality_limit?(item)

    decline_sell_in(item)
  end

  def within_quality_limit?(item)
    item.quality.positive? && item.quality < 50
  end

  def decline_sell_in(item)
    item.sell_in -= 1
  end

  def addition_quality(item)
    sell_in = item.sell_in

    case item.name
    when 'Aged Brie'
      1
    when 'Backstage passes to a TAFKAL80ETC concert'
      if sell_in < 1
        - item.quality
      elsif sell_in < 6
        3
      elsif sell_in < 11
        2
      else
        1
      end
    when 'Conjured Mana Cake'
      sell_in < 1 ? -4 : -2
    else
      sell_in < 1 ? -2 : -1
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
