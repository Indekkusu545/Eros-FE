# FEhViewer

# 应用简介

一个 flutter 编写的 e-hentai/exhentai app

# 说明

其实主要是想写给自己用，因为用的 ios，感觉现有的几个项目感觉不能满足自己的使用 \
然后对原生开发不咋熟悉，就起了用 flutter 自己搞一个的想法 \
就这样从入门到入土，有了现在的版本，虽然问题还缺失的功能还不少。但至少是个能看的版本了

UI 方面主要参考的[E-HentaiViewer](https://github.com/kayanouriko/E-HentaiViewer)\

因为是 flutter 所以也是跨平台支持的，测试的平台主要有\
iOS 14 : iPhone XR / 12 / iPad Pro 2018\
Android 11 : MIUI12.5/ MI K40

现有问题:

- 列表滑动可能会有小卡顿。没有原生应用那么流畅
- 确失一些必要功能(还在开发完善中)

# 感谢

应用借鉴和参考以下项目的部分代码和逻辑进行开发

- [E-HentaiViewer](https://github.com/kayanouriko/E-HentaiViewer)
- [EhViewer](https://github.com/seven332/EhViewer)

ehentai译文数据库

- [EhTagTranslation/Database](https://github.com/EhTagTranslation/Database)

# 应用截图

## 主页列表
<img width="200" src="https://raw.githubusercontent.com/honjow/FEhViewer/nullsafety/screenshot/2021-06-21%2019.15.21.jpg" >

## 画廊
<img width="200" src="https://raw.githubusercontent.com/honjow/FEhViewer/nullsafety/screenshot/2021-06-21%2019.15.27.jpg" >
<img width="200" src="https://raw.githubusercontent.com/honjow/FEhViewer/nullsafety/screenshot/2021-06-21%2019.15.43.jpg" >
<img width="200" src="https://raw.githubusercontent.com/honjow/FEhViewer/nullsafety/screenshot/2021-06-21%2019.16.56.jpg" >

## 搜索
<img width="200" src="https://raw.githubusercontent.com/honjow/FEhViewer/nullsafety/screenshot/2021-06-21%2019.15.53.jpg" >
<img width="200" src="https://raw.githubusercontent.com/honjow/FEhViewer/nullsafety/screenshot/2021-06-21%2019.15.58.jpg" >
<img width="200" src="https://raw.githubusercontent.com/honjow/FEhViewer/nullsafety/screenshot/2021-06-21%2019.16.02.jpg" >

## 阅读
<img width="200" src="https://raw.githubusercontent.com/honjow/FEhViewer/nullsafety/screenshot/2021-06-21%2019.16.08.jpg" >
<img width="200" src="https://raw.githubusercontent.com/honjow/FEhViewer/nullsafety/screenshot/2021-06-21%2019.54.50.jpg" >

# 功能

- [x] 热门,列表画廊,收藏浏览
- [x] 列表视图,瀑布流视图切换
- [x] 画廊信息查看
- [x] 图片浏览
- [x] 里站表站切换
- [x] 标签搜索
- [x] 登录
- [x] 搜索
- [x] 搜索词匹配tag
- [x] 高级搜索
- [x] 单张图片保存于与分享
- [x] 缓存优化
- [x] 高级设置
- [x] 发表评论 赞和踩
- [x] watched 和用户 tag

# TODO


- [ ] 下载功能(开发中)

# 依赖项目/插件（部分）

- 网络 [dio](https://pub.dev/packages/dio)
- 状态管理 [getx](https://pub.dev/packages/get)
- 数据库 [sqflite](https://pub.dev/packages/sqflite)
- 持久化 [shared_preferences](https://pub.dev/packages/shared_preferences)
- 国际化 [intl](https://pub.dev/packages/intl)
- 图片 [cached_network_image](https://pub.dev/packages/cached_network_image)、[extended_image](https://pub.dev/packages/extended_image)

# 编译相关
flutter版本为最新release版本
因项目引入firebase, 需要放置自己的google-services.json文件等
