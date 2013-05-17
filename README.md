**使い方**

    $ pry
    [1] pry(main)> require './roulette.rb'=> true
    [2] pry(main)> %w(okutsu sugawara nakajima fujii).roulette
    ...Okutsu,  9 点。
    ...Sugawara,  3 点。
    ...Nakajima,  7 点。
    ...Fujii,  1 点。
    Fujiiーーー。アウトーーー。
    => true

pry は irb でもおｋです。

*環境*  
* MacOS X 10.8.3 (afplay, say コマンド)


*環境についての追記*  
音声で日本語を使う場合にインストールが必要です。  
手順  
１．「システム環境設定」→「音声入力と読み上げ」でテキスト読み上げタブを選択する  
２．システムの声を選択肢、カスタマイズを選択する  
３．日本語の「kyoko」を選択肢、okする。  
