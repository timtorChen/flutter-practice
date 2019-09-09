# 🎏 Flutter 開發過程

- 環境: windows10-pro
- 編輯工具: VS Code
- 終端機: git-bash

## 開發環境設定
### I. 安裝 Flutter SDK

1. 從 github 下載穩定版
```
git clone -b stable https://github.com/flutter/flutter.git
```

2. 將執行檔 `flutter/bin` 加入環境變數中，並重新開啟你的 terminal

3. 在 terminal 中執行 `flutter` 並安裝 Dart SDK
> 🐛 如果你使用 `git-bash` 會遇到[問題](https://github.com/flutter/flutter/issues/18953) 
`Unknown operating system. Cannot install Dart SDK.` 請輸入 `cmd` 切換成 CMD 來執行 `flutter` 確認路徑成功

4. 接著執行 `flutter doctor` 自動安裝工具，你可以使用這個指令來確認開發環境是否完整



### II. 安裝 Android Studio

雖然我們以 vscode 作為開發時的編輯器，但 `flutter` 需要 `android SDK` 才能開發 `android` 

1. 下載 android studio，並確認你有最新版的 Android SD， Android SDK Platform-Tools，Android SDK Build-Tools 和 HAXM 或 Hyper-V 二擇一

> 關於模擬器的虛擬化技術 : Android SDK 預設下載 Intel 的虛擬化引擎 HAXM，如果你的系統為 Windows 10 Pro 以上，則可以使用內建 Hyper-V 虛擬化引擎來運行模擬器，運行速度會更快，但要注意的是兩者會衝突，你僅能選擇開啟一個
>> detail: [Xamarin](https://docs.microsoft.com/zh-tw/xamarin/android/get-started/installation/android-emulator/hardware-acceleration?pivots=windows)

2. 打開 SDK Manager 安裝 Plugin Flutter ，同時也會自動安裝 Plugin  Dart

3. 打開 AVD Manager 新增一個虛擬機， API 版本任意

### III. VS Code 擴充功能

- Dart 
- Flutter 

### IV. 運行測試

你可以隨時使用 `flutter doctor` 確認哪些安裝沒有成功，如果一切正常，我們就可以開始運行你的第一個 flutter 應用程式 🎉 

1. 執行 `flutter create myapp` 指令會在你當前資料夾下建立 `myapp` 資料夾

2. 進入 `myapp` 資料夾並執行 `flutter run` 指令會透過 gradle 自動建置 apk 並安裝到模擬器中


## 補充

### 常用指令

#### Android 模擬器
```bash
# 列出你所有的模擬器
flutter emulators

# 啟動模擬器
flutter emulators --launch [emulator_name]
```

### 問答

#### 我需要安裝 JDK 嗎?
在 Android Studio 2.2 以上的版本，OpenJDK 最新版已經被包含在 Android Studio 內部了，因此你不需要額外安裝。


## 參考資料
- [官方文檔](https://flutter.dev/docs/get-started/install/windows)
- [jonny-huang blog](https://jonny-huang.github.io/flutter/flutter_001/)


