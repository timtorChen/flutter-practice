# Auth

<!-- TODO: 運行時的 gif 圖片 -->


### 安裝
因為後端是由 nodejs 所寫的，確保你有安裝 nodejs 及套件管理工具 yarn
1. 進入 backend 資料夾
```bash
cd ./backend
```

2. 安裝所需要的套件
```bash
yarn install
```

3. 運行後端於電腦上 `localhost:8000`
```bash
yarn dev
```

4. 將模擬器開啟後，為了讓模擬器能與電腦上的後端溝通，使用 `adb reverse` 指令，將手機上的 port 與本機上的 port 互相映射

```bash
# adb reverse [remote] [local]
# 將手機上的 8000 port 映射到本機上的 8000 port
adb reverse tcp:8000 tcp:8000
```

5. 在 VSCode 中執行偵錯或直接使用 `flutter run` 運行