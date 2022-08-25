# t008srapi

APIを使用して開催中のイベントのリストを作ります。
WebサーバあるいはCGIとして動作するように作ってあります。

ソースのダウンロード、ビルドについて以下簡単に説明します。詳細は以下の記事を参考にしてください。
WindowsもLinuxも特記した部分以外は同じです。

	【Windows】かんたんなWebサーバーの作り方
		https://zenn.dev/chouette2100/books/d8c28f8ff426b7/viewer/c5cab5

	---------------------

	【Windows】Githubにあるサンプルプログラムの実行方法
		https://zenn.dev/chouette2100/books/d8c28f8ff426b7/viewer/e27fc9

	【Unix/Linux】Githubにあるサンプルプログラムの実行方法
		https://zenn.dev/chouette2100/books/d8c28f8ff426b7/viewer/220e38

		ロードモジュールさえできればいいということでしたらコマンド一つでできます。

【Unix/Linux】

	$ cd ~/go/src
	$ curl -OL https://github.com/Chouette2100/t008srapi/archive/refs/tags/v0.2.0.tar.gz
	$ tar xvf v0.2.0.tar.gz
	$ mv t008srapi-0.2.0 t008srapi
	$ cd t008srapi
	$ go mod init
	$ go mod tidy
	$ go build t008srapi.go
	$ ./t008srapi

	ここでブラウザを起動し
	　　		http://localhost:8080/t008top
	で、実行時点でのイベントの一覧が表示されます。

【Windows】

Microsoft Windows [Version 10.0.22000.856]
(c) Microsoft Corporation. All rights reserved.

C:\Users\chouette>cd go

C:\Users\chouette\go>cd src

作業はかならず %HOMEPATH%\go\src の下で行います。

以下、要するに https://github.com/Chouette2100/t008srapi/releases にあるv0.2.0のZIPファイルSource code (zip) からソースをとりだしてくださいということなので、ブラウザでダウンロードしてエクスプローラで解凍というこでもけっこうです。なんならこの記事の最後にあるgithubのソースをエディターにコピペで作るということでもかまいません（この場合文字コードはかならずUTF-8にしてください 改行はLFになっています。というようなことを考えるとやっぱりダウンロードして解凍が安全かも）

C:\Users\chouette\go\src>mkdir t008srapi

C:\Users\chouette\go\src>cd t008srapi

C:\Users\chouette\go\src\t008srapi>curl -OL https://github.com/Chouette2100/t008srapi/archive/refs/tags/v0.2.0.zip
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  6265    0  6265    0     0   6777      0 --:--:-- --:--:-- --:--:-- 16400

C:\Users\chouette\go\src\t008srapi>call powershell -command "Expand-Archive v0.2.0.zip"

C:\Users\chouette\go\src\t008srapi>tree
フォルダー パスの一覧
ボリューム シリアル番号は E2CD-BDF1 です
C:.
└─v0.2.0
    └─t008srapi-0.2.0
        ├─public
        └─templates

C:\Users\chouette\go\src\t008srapi>xcopy /e v0.2.0\t008srapi-0.2.0\*.*
v0.2.0\t008srapi-0.2.0\LICENSE
v0.2.0\t008srapi-0.2.0\README.md
v0.2.0\t008srapi-0.2.0\t008srapi.go
v0.2.0\t008srapi-0.2.0\public\index.html
v0.2.0\t008srapi-0.2.0\templates\t008top.gtpl
5 個のファイルをコピーしました

C:\Users\chouette\go\src\t008srapi>rmdir /s /q v0.2.0

C:\Users\chouette\go\src\t008srapi>del v0.2.0.zip

ここで次のような構成になっていればOKです。top.gtpl と index.html が所定の場所にあることをかならず確かめてください。

C:%HOMEPATH%\go\src\t008srapi --+-- t008srapi.go
                                |
                                +-- \templates --- t008top.gtpl
                                |
                                +-- \public    --- index.html

ここからはコマンド三つでビルドが完了します。

C:\Users\chouette\go\src\t008srapi>go mod init
go: creating new go.mod: module t008srapi
go: to add module requirements and sums:
        go mod tidy

C:\Users\chouette\go\src\t008srapi>go mod tidy
go: finding module for package github.com/dustin/go-humanize
go: downloading github.com/dustin/go-humanize v1.0.0
go: found github.com/dustin/go-humanize in github.com/dustin/go-humanize v1.0.0

C:\Users\chouette\go\src\t008srapi>go build t008srapi.go

あとは

C:\Users\chouette\go\src\t008srapi>t008srapi

でWebサーバが起動します。ここでセキュリティー上の警告が出ると思いますが、説明をよく読んで問題ないと思ったらアクセスを許可してください（もちろん許可しなければWebサーバは使えなくなります）

Webサーバを起動したままにしておいてブラウザを開き

http://localhost:8080/t008top

で、実行時点でのイベントの一覧が表示されます。

	Ver. 0.1.0
	Ver. 0.2.0 stdouへのログ出力されていたので、出力しないようにする。
