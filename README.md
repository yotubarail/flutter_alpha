# アプリの紹介

ハッカソン部で[勉強会プラットフォーム(の簡易版)](https://flutter-alpha-0819.web.app/#/)を作りました！  

次のような機能を実装しています。
1. 適当なメールアドレスでアカウント作成
2. イベントの確認と申し込み
3. マイイベントの作成、編集、削除

![](https://github.com/kou72/flutter_alpha/raw/master/README_image/%E3%83%87%E3%83%A2%E5%8B%95%E7%94%BB.gif)

開発言語はFlutter、ホスティング/認証/DBにFirebaseを使っています。

![](https://github.com/kou72/flutter_alpha/raw/master/README_image/%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E6%A6%82%E8%A6%81%E5%9B%B3.png)

# この部屋で話したいこと

今回はこのアプリを題材に主にGUIアーキテクチャの話をできればと思います。

- 今回のアプリはMVVMモデルを参考に作っています
- まず、MVVMモデルの解釈が合っているか
- 各区分の責務は分割されているか
- 「このアプリならこっちの設計の方がもっといいんじゃない？」
- 「自分の現場だとこういう感じで設計されてたりするよ」

などなど。  

他にも聞きたいことがあれば何でも聞いてください！  
部屋にいる皆さんからも色々な意見が聞けると嬉しいです。

- そもそもMV〇モデルってなんだ、どんな利点があるんだ
- 実際現場では使ってるもんなのか
- オブジェクト指向の設計の5原則というのがあってね......
- 「業務のコードは案外ぐちゃぐちゃだよ～」
 
などなど

# GUIアーキテクチャ

## GUIアーキテクチャとは

アプリを開発する時の重要な考え方として、**「見た目(UI)」に関するコードと「処理」に関するコードは分けましょう**、というものがあります。  
この考え方に沿った色々なアーキテクチャが考え出されており、それらのことを**GUIアーキテクチャ**と呼びます。  

今回は数あるGUIアーキテクチャのうち**MVVMモデル**を参考に設計しました。

## MVVMモデルとは

MVVMモデルとはコードの役割をView、ViewModel、Modelの3つに分割するアーキテクチャです。

![](https://github.com/kou72/flutter_alpha/raw/master/README_image/MVVM.png)

参考：[iOSアプリ設計パターン入門](https://peaks.cc/books/iOS_architecture)サンプル

- View  
アプリの「見た目」に関するコードが記述されます。

- Model  
アプリの「処理」に関するコードが記述されます。  
また、ログイン情報やDBから取得したデータなどのステータスを保持します。  

- ViewModel  
ViewとModelの仲介役になります。  
Viewと連動するステータスを保持したり、Modelの処理を呼び出します。

## フォルダ構成

Flutterでは「lib」というフォルダの中にコードを記述していきます。  
今回はMVVMモデルを表現するために、次のようなディレクトリ構成にしています。

---

flutter_alpha/lib  
│  main.dart  
│  
├─:file_folder:**view**  
│  │  event_detail_page.dart  
│  │  event_list_page.dart  
│  │  my_event_detail_page.dart  
│  │  my_event_list_page.dart  
│  │  signin_page.dart  
│  │  
│  └─:file_folder:components  
│  
├─:file_folder:**model**  
│      auth_model.dart  
│      events_model.dart  
│      guests_model.dart  
│  
├─:file_folder:**view_model**  
│      event_detail_view_model.dart  
│      my_event_detail_view_model.dart  
│      signin_view_model.dart  

---

## Q. 「マイイベントリストページ」と「マイイベント詳細ページ」のコードはそれぞれどこに書くべきでしょうか？

「マイイベントリストページ」と「マイイベント編集ページ」について、皆さんならそれぞれの処理をView、ViewModel、Modelのどこに書きますか？

- マイイベントリストページ：自分が作成したイベントを一覧で表示するページ
- マイイベント詳細ページ：作成したイベントを編集するページ

![](https://github.com/kou72/flutter_alpha/raw/master/README_image/Q%E3%83%9E%E3%82%A4%E3%82%A4%E3%83%99%E3%83%B3%E3%83%88.png)

## A. このアプリでは次のような書き分けを行っています。

<details>
<summary>開く</summary>

![](https://github.com/kou72/flutter_alpha/raw/master/README_image/A%E3%83%9E%E3%82%A4%E3%82%A4%E3%83%99%E3%83%B3%E3%83%88.png)

意識した点

- ViewからModelを**参照して良い**
- Viewからのインプットに関するステータスはViewModelに持たせる
- ViewModelから**外部DBにはアクセスしない**
- 外部DBとの接点はModelに集約する

</details>

## Q. 「イベントリストページ」と「イベント詳細ページ」のコードはそれぞれどこに書くべきでしょうか？

![](https://github.com/kou72/flutter_alpha/raw/master/README_image/Q%E3%82%A4%E3%83%99%E3%83%B3%E3%83%88.png)

## 鈴木的なMVVMの解釈  

**ViewModelは「見た目」のコードの一部である**

- そのためViewとViewModelは1対1対応
  - 1つのViewModelが複数のModelを参照するのはアリ
- ViewとViewModelは外部の処理とは切り離す
  - 仮にFirestoreがMongoDBに変わったとしても、書き換えが必要なのはModelのみ
