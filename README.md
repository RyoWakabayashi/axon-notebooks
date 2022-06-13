# axon-notebooks

Axon の学習用

## 参考

以下のリポジトリーを参考にしている

<https://github.com/thehaigo/live_onnx_qiita>

## コンテナの実行

```bash
docker-compose up
```

しばらくすると、 URL が2種類表示される

- Jupyter: `http://127.0.0.1:8888/lab?token=...`
- Livebook: `http://localhost:8080/?token=...`

それぞれにアクセスして Jupyter と Livebook を開く

## Axon による VGG16 モデルの推論

### PyTorch モデルを ONNX モデルに変換する

Jupyter で `notebooks/vgg16_torch_to_onnx` を開き、実行する

### ONNX モデルを dets に変換する

Livebook で `notebooks/vgg16_onnx_to_dets` を開き、実行する

### Axon で推論を実行する

Livebook で `notebooks/vgg16_detection` を開き、実行する
