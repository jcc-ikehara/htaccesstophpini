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
/tmp/jccmysql4tmpdir以下にdbごとにファイルを作成する。移転作業時に、仮移転が終わった後一度だけ実行する

## checkmysqlconf.sh

/tmp/jccmysql4tmpdirの下を見て、DB作成コマンドと新しいDB名、パスワードを用意するコマンド

/tmp/jccmysql4tmpdir/dbcommand 
mysql4用のDBとユーザ作成コマンド、コピペでmysql4サーバーにて実行
/tmp/jccmysql4tmpdir/configfilelist
:区切りのCSVで設定ファイルのフルパスと、新しいDB名＝新しいUser名、パスワードを記述、後ほど加工を行えるようにしてある

一旦wordpressのみconfigを変更できそうなので置換した設定ファイルを標準出力に表示しているが別に分けたほうがよさそう

### ToDo

探し出した結果から標準的なCMSのコンフィグファイルの中身を見て、置換する方法を考える。
置換したあと、置換した結果を確認する手段が必要。

