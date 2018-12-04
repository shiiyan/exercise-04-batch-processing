# バッチ処理デモ

`Ruby on Rails`というフレームワークの下で`Rake`のタスクを作成してバッチ処理を実装しました。

## バッチ仕様
* 毎日午後３時１０分に一度だけ起動して、前日の`products`テーブルの変化を集計します。
* 集計するのは前日作成された商品数と商品名リストと商品IDリスト、及び削除された商品数と商品名リストと商品IDリストになります。
* 集計結果はDBの`summaries`テーブルにダンプします。
* 毎日の集計終了後に集計成功通知あるいは失敗メッセージをGmailを通して送ります。

## 使用例
バッチ実行失敗した時のメール：
![Failure message](https://github.com/shiiyan/exercise-04-batch-processing/blob/master/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202018-12-04%2016.17.14.png?raw=true "Saving Failed")
`summaries`テーブル例：
![Summary of products](https://github.com/shiiyan/exercise-04-batch-processing/blob/master/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202018-12-04%2016.17.56.png?raw=true "Summary of Products")

