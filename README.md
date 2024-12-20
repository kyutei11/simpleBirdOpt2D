# simpleBirdOpt2D

バードマン滑空機の最適軌道をエネルギ形式で記述した方程式を用いて導くOctave/Matlabプログラムです。

```
SimpleEnergyOpt2D.m
最適化を実行するメインプログラム

setParam.m
機体などパラメータを設定するファイル

outputSimpleVDH.m
最適化結果からEnergyPlot.mで描画可能な時歴データを出力する関数

simpleVDH.dat：outputSimpleVDH.mからの出力例

EnergyPlot.m
SSSプレゼンの主題である等高線プロットと最適軌道を出力

AR_by_ARe.m：地面効果を考慮した有効アスペクトレシオを出力する関数
D.m：抗力を出力する関数
E_m.m：単位質量あたりの全エネルギを出力する関数。gh+0.5V^2

CEQ.m：SQPで使用する等式境界条件	
CNE.m：SQPで使用する不等式境界条件
PHI.m：SQPで使用する評価関数。その積分は区分線形領域につき2点ガウス積分で行われる。

getK.m：kappaの積分を行う関数
```
	
背景と理論を記したSSSプレゼン資料，上記内容説明などについては後日順次追加します。

Copyright (C) 2024− Koichi Takasaki

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
