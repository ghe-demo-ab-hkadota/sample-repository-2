
---
name: code-review
description: >
  Pull Request / diff をレビューし、指摘を「Must/Should/Nit」で分類して提示する。
  可能なら再現手順・影響範囲・提案修正も添える。
---

## Procedure
1. 変更差分（diff）を読み、意図を要約する
2. Must（バグ/セキュリティ/データ破壊/重大性能）を優先的に洗い出す
3. Should（設計/可読性/保守性/例外処理/ログ）を列挙する
4. Nit（命名/軽微なスタイル）を最後に列挙する
5. 各指摘に「根拠」と「提案」を必ず付ける
6. 最後に「確認したテスト観点」と「追加で必要なテスト」を出す

## Output format
- Summary
- Findings
  - [Must] ...
  - [Should] ...
  - [Nit] ...
- Suggested patches (if any)
- Test recommendations
