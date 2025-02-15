# Gilded Rose 要件仕様書
こんにちは、チーム・ギルドローズへようこそ。我々はアリソンという気さくな人が経営する、都会の一等地にある小さな宿です。

また、私たちは最高級の商品のみを仕入れて販売しています。残念なことに、商品は販売期限が近づくにつれ、品質が低下していきます。

私たちには在庫を更新するシステムがあります。これは、新たな冒険へと旅立ったリーロイという無神経な性格の人物によって開発されました。

あなたの仕事は、システムに新しい機能を追加して、新しいカテゴリーのアイテムを販売できるようにすることです。

最初にシステムの紹介をします。

* すべてのアイテムには、アイテムを販売するための残り日数（販売期限）を示すSellIn値があります。
* すべてのアイテムには、そのアイテムの価値を示すQuality値があります。
* 毎日の終わりには、私たちのシステムは、両方の項目の値を1小さくします。

簡単でしょ？ここからが面白いところです。

* 販売するための残り日数が無くなると、Quality値は2小さくなります。
* Quality値は決してマイナスにはなりません。
* "Aged Brie"は、日が経つほどQuality値が上がっていきます。
* Quality値は50より上にはなりません。
* "Sulfuras"は伝説のアイテムなので、販売されたり、Quality値が低下したりすることはありません。
* "Backstage passes"は、"Aged Brie"と同様、SellIn値が近づくにつれてQuality値が上昇し、10日以内になると毎日2上がり、5日以内になると毎日3上がりますが、コンサート終了後には0になります。

最近、"Conjured"アイテムのサプライヤーと契約しました。そのため、システムの更新が必要です。

* "Conjured"アイテムは、通常のアイテムの2倍の速さで品質が劣化します。

すべてが正常に動作する限り、UpdateQualityメソッドに変更を加えたり、新しいコードを追加したりすることは自由に行ってください。ただし、ItemクラスやItemsプロパティは変更しないでください。

これらは、隅にいるゴブリンのものなので、コードの共有所有権を信じていないので、怒り狂ってあなたを一発で撃ってきます（UpdateQualityメソッドとItemsプロパティを静的にしても構いません。）

ただし、"Sulfuras "は伝説のアイテムであるため、Quality値は80であり、Quality値が変わることはありません。
