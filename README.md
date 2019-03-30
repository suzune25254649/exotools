# exotools
ボイスロイドやCeVIOで生成した音声ファイルを元に、aviutl用のひな型プロジェクトを作成してくれるツール群です。

# ダウンロードの仕方
右上にある"Clone or download"をクリックし、"Download ZIP"を選んでください。

# 寄付の仕方
https://www.amazon.co.jp/Amazon%E3%82%AE%E3%83%95%E3%83%88%E5%88%B8-E%E3%83%A1%E3%83%BC%E3%83%AB%E3%82%BF%E3%82%A4%E3%83%97/dp/BT00DHI8G4

こちらのAmazonギフト券で、下記メールアドレスまで贈ってくれると嬉しいです。ボイロ動画制作のために使用します。

suzune25254649@gmail.com

# 使い方
解説動画を作りました：https://www.nicovideo.jp/watch/sm34878566

1. VOICEROID2で会話を作り、複数のWAVファイルとして出力してください
	- 「テキストファイルを音声ファイルと一緒に保存する」でテキストも出力してください。
	- 会話はプリセット指定記法で書いてください（"琴葉 茜 - 通常＞こんばんわやで"って感じのやつ）
	- CeVIOの場合は「セリフをテキスト出力」でテキストも出力してください。
1. "起動.bat"を実行してください。
1. WAVファイルのフォルダパスを聞かれるので、入力してEnterキーを押してください
	- フォルダをウインドウにドラッグインするとパスが自動で入力されるので楽です。
1. 他にも聞かれるので、適切に答えてください。
1. 複数のexoファイルが出力されます。
1. aviutlのプロジェクトにインポートして使ってください。

# ClassifyLayer.setting.txt
toolsフォルダ内にあります。

ボイロの名前を羅列しておきます。（とりあえず有名どころは書いておきました）

プリセット記法でのプリセット名の先頭が、ここに羅列している名前と一致した場合にレイヤー分け処理がなされます。

足りないボイロ名は、適宜足してください。

# SliceObject
exoファイルをドラッグインすると動作します。

指定したレイヤーにあるオブジェクトを分割します。
分割する箇所は、もうひとつ指定したレイヤーにあるオブジェクトの各先頭箇所です。

使い方の例として。
1. 私は「キャラがしゃべる時、必ず立ち絵の表情を変える」ことにしている。
1. レイヤー1に琴葉茜の立ち絵オブジェクトを配置（動画開幕から最後まで）
1. レイヤー5に、琴葉茜の音声オブジェクト群を配置
1. exoとして出力
1. SliceObjectにexoファイルをドラッグイン
1. 分割レイヤーを1、参照レイヤーを5と指定する
1. レイヤー1の立ち絵オブジェクトが、ボイス開始位置で分割されている
1. しゃべりはじめ毎に自分で分割する手間が省けた

# FAQ
## エラーが出る
エラーメッセージを見て対処してください。

## レイヤー分けがされない
ClassifyLayer.setting.txtに存在しないボイロ名は無視されます。

例えば「未来 太郎 -通常-」というプリセット名があったとしても、デフォルトでは対応していません。

ClassifyLayer.setting.txtに「未来」や「未来 太郎」といった行を追加してください。

## 口パクや字幕の使い方が分からない
最新のPSDToolKitを導入している前提です。
