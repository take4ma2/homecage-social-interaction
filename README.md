# Homecage Social Interaction test analyzer

## はじめに

Homecage social interaction testの測定データを集計するruby製ツールです。

## 入出力データ説明

DateTime: データ記録時刻
Particle Number: 認識されたパーティクルの数(2なら離れてる。1なら接触状態)

Total contact duration(s)
Total number of contacts(times)
Mean contact duration(s/time)

Contact duration in 1 minutes(s)

## 結果ファイルの見方
N. of contacts(times)：10分間の総接触回数
Duration of contacts(s)：10分間の総接触時間

Duration of contacts in each(s)：1分毎の接触時間
