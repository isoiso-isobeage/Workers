# アプリ名:Workers

# イメージ
![Workers](https://user-images.githubusercontent.com/86566390/176180677-4bae5f46-7cc6-4ce6-b5d3-6a5b7a7294a8.jpeg)　

## サイト概要
工事現場の予定を記録し共有するサイトです。

### サイトテーマ
工事現場の作業内容や予定人数をカレンダーに記録し、それを共有する事ができます.
建築工事、土木工事は日々の作業内容や天候によって作業員や警備員の必要人数が変わります。
Workersは手軽に作業内容や予定人数をカレンダーに記録し、共有することにより人的要因での
トラブルを減らすことを目的としています。

### テーマを選んだ理由
気軽に予定管理ができて、日々の予定管理や打ち合わせで人的要因でのトラブルを少しでも無くしたいと思いこのテーマにしました。

### ターゲットユーザー
下請け業者が複数いる現場の責任者
現場責任者と予定の刷り合わせをしている営業マンもしくは管理者

### 主な利用シーン
日々の工事現場の状況や作業員の必要人数を記録し共有。

####　機能
・ユーザー認証(devise)
・フォロー機能（Ajax）
・検索機能（Ajax）
・FullCalendarの導入（ドラッグ&ドロップで作成した予定を更新できるように）
・現場管理機能（現場を作成、編集）
・現場ユーザー機能（現場に特定のユーザーを追加、削除）
・予定作成機能（gemのcocoonを使用）
・通知機能（各アクションに応じて通知をユーザーに送る）
・Action Mailer(メール送信機能)を実装。


## 設計書

ER図

https://app.diagrams.net/#G1f1lGkR5qf7fPxy29uSyyuihOT0ix4TKv

テーブル定義書

https://docs.google.com/spreadsheets/d/1fIopcjYqARhTuEkyZkiDaO3VblUCnvsgjYq3f_fwrQw/edit#gid=287770824

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery FullCalendar
- IDE：Cloud9


