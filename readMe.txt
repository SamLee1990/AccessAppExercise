
Access App Exercise

2022/8/28

李世文 Sam Lee

-------------------------

功能（需求）：
開啟App下載 GitHub API List users 資料（100筆），
並使用 UITableView 呈現。

點擊進入 user detail 頁面，並下載 API Get a user 資料，
使用 static UITableView 呈現。

點擊左上角 navigater item button 返回 users 列表頁面。

-------------------------

架構：
使用 MVVM 架構。

以 Package 的方式分為主要的 Models、ViewModels、Controllers，
以及網路串接服務的 Services 與 功能擴展的 Extensions。

-------------------------

補充：
使用 StoryBoard 並運用 AutoLayout 以符合各 size 螢幕。


