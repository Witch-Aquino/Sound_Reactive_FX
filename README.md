![SRFX_120pix](https://github.com/user-attachments/assets/ca5e7b53-d3e6-44ef-88f7-e51dc4a186d0) 
# Sound_Reactive_FX
#### Sound Reactive FX's for BGV & VJing

<mark>OS/アプリの起動前にマイクを接続してください</mark>  

- Processing環境の準備  
	https://processing.org/  
	使用環境に応じてダウンロード～インストールを行ってください。 

- ソースコードの入手  
	https://github.com/Witch-Aquino/Sound_Reactive_FX/releases  
	からSource code(ZIP)をダウンロードします。  
	ダウンロード完了後に適宜、展開～コンパイルを行ってください  
	 (Processingのエディタ＞ファイル＞アプリケーションとしてエクスポート)  
	※エフェクト(pdeファイル)毎にコンパイルが必要です。  

- ロゴの作成と配置  
	logo.png というファイルネームでロゴを作成して  
	<mark>各エフェクトのバイナリと同じフォルダに設置してください</mark>  
	(例えばWindowsではwindows-amd64というフォルダが作られるのでそちらに配置してください  
	また、コンパイルの度に当該フォルダはいったん空になるのでロゴデータは適宜バックアップしておいてください)  

- 動作確認  
	マイク入力に応じてロゴのサイズなどが変化することを確認してください

## 使用例(OBS studio, Cantabile, VSを併用した構成)  


  
![image](https://github.com/user-attachments/assets/a09cfb6f-89b6-4110-8303-045437678415)  

- OBS Studio  
	https://obsproject.com/ja/download    
	ダウンロード～インストールを行い    
	適宜設定を行ってください  
	SPOUTで映像を転送しますので    
	obs-spout2-pluginを導入してください。  
	https://github.com/Off-World-Live/obs-spout2-plugin

- Cantabile(ホットキーを使用するのにsoloライセンス以上が必要)  
	https://www.cantabilesoftware.com/  
	VSTホストに Cantabile を使用します。使用するVSTプラグインは下記を推奨  
	- sonible pureLimit(レベル調整)  
	- SSL X-Gate(ビート検出調整)  
	- VS(Visual Synthesizer) 無くてもよいが派手な動く背景が作りやすい  
 

- プログラマブルキーボード  
	足などで操作する場合は用意してください  
	

