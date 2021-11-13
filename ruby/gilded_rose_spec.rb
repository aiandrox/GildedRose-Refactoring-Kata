# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    it 'name は変わらない' do
      name = 'foo'
      items = [Item.new(name, 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq name
    end

    it 'sell_in が 1 下がる' do
      sell_in = 10
      items = [Item.new('foo', sell_in, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq sell_in - 1
    end

    it 'quality が 1 下がる' do
      quality = 10
      items = [Item.new('foo', 10, quality)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq quality - 1
    end

    it 'sell_in が 0 になると quality は 2 小さくなる' do
      quality = 10
      items = [Item.new('foo', 0, quality)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq quality - 2
    end

    it 'quality はマイナスにはならない' do
      min_quality = 0
      items = [Item.new('foo', 0, min_quality)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq min_quality
    end

    context 'name が "Aged Brie" のとき' do
      it 'quality は 1 上がる' do
        quality = 10
        items = [Item.new('Aged Brie', 10, quality)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq quality + 1
      end

      it 'quality は 50 より上にならない' do
        max_quality = 50
        items = [Item.new('Aged Brie', 10, max_quality)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq max_quality
      end
    end

    context 'name が　"Sulfuras, Hand of Ragnaros" のとき' do
      it 'sell_in が 0 である（販売できない）' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq 0
      end

      it 'quality が 80 のままである' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 80
      end
    end

    context 'name が "Backstage passes to a TAFKAL80ETC concert" のとき' do
      it 'sell_in が 11 日以上のときは quality が 1 上がる' do
        quality = 10
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 11, quality)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq quality + 1
      end

      it 'sell_in が 6 〜 10 日のときは quality が 2 上がる' do
        quality = 10
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, quality)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq quality + 2

        quality = 10
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 6, quality)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq quality + 2
      end

      it 'sell_in が 5 日以下のときは quality が 3 上がる' do
        quality = 10
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, quality)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq quality + 3
      end

      it 'sell_in が 0 になったら quality が 0 になる' do
        quality = 10
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, quality)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end

      it 'quality は 50 より上にならない' do
        max_quality = 50
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, max_quality)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq max_quality
      end
    end

    xcontext 'name が "Conjured" のとき' do
      it 'quality が 2 下がる' do
        quality = 10
        items = [Item.new('Conjured', 10, quality)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq quality - 2
      end
    end
  end
end
