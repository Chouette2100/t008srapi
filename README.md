# t008srapi
	APIを使用して開催中のイベントのリストを作ります。
	WebサーバあるいはCGIとして動作するように作ってあります。

	ソースのダウンロード、ビルドについて以下簡単に説明します。詳細は以下の記事を参照してください。
	WindowsもLinuxも特記した部分以外は同じです。

		【Windows】かんたんなWebサーバーの作り方
			https://zenn.dev/chouette2100/books/d8c28f8ff426b7/viewer/c5cab5

		---------------------

		【Windows】Githubにあるサンプルプログラムの実行方法
			https://zenn.dev/chouette2100/books/d8c28f8ff426b7/viewer/e27fc9

		【Unix/Linux】Githubにあるサンプルプログラムの実行方法
			https://zenn.dev/chouette2100/books/d8c28f8ff426b7/viewer/220e38

			ロードモジュールさえできればいいということでしたらコマンド一つでできます。


	$ cd ~/go/src

	$ curl -OL https://github.com/Chouette2100/t008srapi/archive/refs/tags/v0.1.0.tar.gz
	$ tar xvf v0.1.0.tar.gz
	$ mv t008srapi-0.1.0 t008srapi
	$ cd t008srapi

	以上4行は、Githubからソースをダウンロードしてます。v0.1.0のところは、ソースのバージョンを指定します。
	バージョンは、Githubのリリースページで確認してください
	ダウンロードはどんな方法でも構わなくて、 とくにWindowsの場合、ZIPをブラウザでダウンロードして
	エクスプローラで解凍した方が簡単でしょう。

	あえてコマンドラインでやる方法も紹介しておきます。

	C:\Users\chouette\go\src\t008srapi>curl -OL https://github.com/Chouette2100/t008srapi/archive/refs/tags/v0.1.0.zip
	C:\Users\chouette\go\src\t008srapi>call powershell -command "Expand-Archive v0.1.0.zip"

	C:\Users\chouette\go\src\t008srapi>tree
	C:\Users\chouette\go\src\t008srapi>xcopy /e v0.1.0\t008srapi-0.1.0\*.*
	C:\Users\chouette\go\src\t008srapi>rmdir /s /q v0.1.0
	C:\Users\chouette\go\src\t008srapi>del v0.1.0.zip

		要するにこのようなフォルダ構成になればOKです。

		C:%HOMEPATH%\go\src\t008srapi --+-- t008srapi.go
                                    |
                                    +-- templates --- t008top.gtpl
                                    |
                                    +-- public    --- index.html

	$ go mod init
	$ go mod tidy
	$ go build t008srapi.go
	$ ./t008srapi
			あるいは
	C:\Users\chouette\go\src\t008srapi>t008srapi.exe

	ここでブラウザを起動し

	　　		http://localhost:8080/t008top

	で、実行時点でのイベントの一覧が表示されます。
