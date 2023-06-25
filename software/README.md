# A Python Library for controlling QuEL Clock Master 

クロックマスタと各制御装置との同期を取るためのライブラリと、そのライブラリをシェルからお手軽に使うためのコマンド群を提供します。

# Build and Install with `pip`

適切なPythonの仮想環境にて、次のコマンドを実行してください。パッケージのビルド及びインストールが完了します。
```shell
cd qubemaster/software
rm -rf dist
python setup.py bdist_wheel
pip install dist/*.whl
```

なお、`pipenv` をお使いの場合には、dist 以下に生成された quel_clock_master*.whl を適切な場所にコピーしてご使用ください。

# Console Commands
パッケージをインストールすると、次の4つのコマンドがシェルから利用できるようになります。
各コマンドを `-h` を付けて実行すると、引数の詳細が表示されます。

- `quel_clock_master_read`: マスタのIPアドレスと複数の各制御装置のIPアドレスを指定して使います。マスタと指定の各制御装置のクロックカウンタを取得します。最初のIPアドレスがマスタ、それ以降のIPアドレスが制御装置であるとみなされます。
- `quel_clock_master_kick`: マスタのIPアドレスと複数の制御装置のIPアドレスを指定して使います。マスタと指定の各制御装置とを同期します。
- `quel_clock_master_clear`: 指定したIPアドレスのマスターのクロックカウンタをゼロにクリアします。複数の制御装置のIPアドレスを同時に引数に与えると、クリアに引き続いて、マスタと各制御装置とを同期します。
- `quel_clock_master_reset`: 指定したIPアドレスのマスターをリセットします。**`kick`などのコマンドが動作しなくなった場合に使うと、マスタが復旧します。** ただし、内部のクロックカウントが0にリセットされるので、マスタと各制御装置との再同期が必要になります。   

## 注意点
`quel_clock_master_kick` に与える制御装置のアドレスに不正なものがあると、クロックマスタ内のステートマシンが一部ハングアップします。
これが発生してしまうと、`quel_clock_master_reset` を実行するまで、`kick`が動作しなくなるので注意が必要です。

# Library

まだ、文書化できていないので、ソースコードをご覧ください。
[qubemaster/software/quel_clock_master/quelmasterclient.py](quel_clock_master/qubemasterclient.py) の `if __name__ == '__main___'`
以降が特に参考になると思います。
