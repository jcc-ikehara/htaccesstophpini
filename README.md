# さくらクラウドへの移転の際の便利ツール

## htaccesstophpini.sh

htaccess内の
php_value
php_flag
を見つけて
php.iniを自動生成するシェル

使い方

対象サーバーにアップロードして引数無しで実行する

## findmysql.sh

mysql4のサーバーのDBを見て、そのDBが書き込まれているファイルを探し出すスクリプト
現在は標準出力に表示している。

### ToDo

探し出した結果から標準的なCMSのコンフィグファイルの中身を見て、置換する方法を考える。
置換したあと、置換した結果を確認する手段が必要。

mysqlのDB名、アクセスユーザ、アクセスパスワードについては自動生成し、すべてのサーバーアカウントに対してユニークにする。
