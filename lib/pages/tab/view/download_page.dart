import 'package:fehviewer/common/isolate_download/download_manager.dart';
import 'package:fehviewer/generated/l10n.dart';
import 'package:fehviewer/models/index.dart';
import 'package:fehviewer/pages/item/download_archiver_item.dart';
import 'package:fehviewer/pages/item/download_gallery_item.dart';
import 'package:fehviewer/pages/tab/controller/download_view_controller.dart';
import 'package:fehviewer/store/floor/entity/gallery_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

const Color _kDefaultNavBarBorderColor = Color(0x4D000000);

const Border _kDefaultNavBarBorder = Border(
  bottom: BorderSide(
    color: _kDefaultNavBarBorderColor,
    width: 0.2, // One physical pixel.
    style: BorderStyle.solid,
  ),
);

class DownloadTab extends GetView<DownloadViewController> {
  const DownloadTab({Key? key, this.tabIndex, this.scrollController})
      : super(key: key);
  final String? tabIndex;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final String _title = L10n.of(context).tab_download;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Obx(
          () => CupertinoSlidingSegmentedControl<DownloadType>(
            children: <DownloadType, Widget>{
              DownloadType.gallery: Text(
                L10n.of(context).tab_gallery,
                style: const TextStyle(fontSize: 14),
              ).marginSymmetric(horizontal: 6),
              DownloadType.archiver: Text(
                L10n.of(context).p_Archiver,
                style: const TextStyle(fontSize: 14),
              ).marginSymmetric(horizontal: 6),
            },
            groupValue: controller.viewType,
            onValueChanged: (DownloadType? value) {
              controller.viewType = value ?? DownloadType.gallery;
            },
          ),
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverSafeArea(
              top: false,
              sliver: SliverFillRemaining(
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: controller.handOnPageChange,
                  children: <Widget>[
                    DownloadGalleryView(),
                    DownloadArchiverView(),
                  ],
                ),
              ), // sliver: _getGalleryList(),
            ),
          ],
        ),
      ),
    );
  }
}

class DownloadArchiverView extends GetView<DownloadViewController> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, int index) {
        final _id = controller.archiverTasks[index].tag;

        return GetBuilder<DownloadViewController>(
            id: _id,
            builder: (DownloadViewController _controller) {
              final DownloadTaskInfo _taskInfo =
                  _controller.archiverTasks[index];

              return GestureDetector(
                onLongPress: () =>
                    _controller.onLongPress(index, type: DownloadType.archiver),
                behavior: HitTestBehavior.opaque,
                child: DownloadArchiverItem(
                  title: _taskInfo.title ?? '',
                  progress: _taskInfo.progress ?? 0,
                  status: DownloadTaskStatus(_taskInfo.status ?? 0),
                  index: index,
                ),
              );
            });
      },
      separatorBuilder: (_, __) {
        return Divider(
          indent: 20,
          height: 0.6,
          color: CupertinoDynamicColor.resolve(
              CupertinoColors.systemGrey4, context),
        );
      },
      itemCount: controller.archiverTasks.length,
    );
  }
}

class DownloadGalleryView extends GetView<DownloadViewController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.separated(
        itemBuilder: (_, int _taskIndex) {
          final GalleryTask _taskInfo = controller.galleryTasks[_taskIndex];
          final String? _speed = controller.downloadSpeeds[_taskInfo.gid];

          final DateTime date =
              DateTime.fromMillisecondsSinceEpoch(_taskInfo.addTime ?? 0);
          return GestureDetector(
            onLongPress: () => controller.onLongPress(_taskIndex),
            behavior: HitTestBehavior.opaque,
            child: DownloadGalleryItem(
              url: _taskInfo.url,
              title: _taskInfo.title,
              status: TaskStatus(_taskInfo.status ?? 0),
              speed: _speed,
              addTime: _taskInfo.addTime != null
                  ? DateFormat('yyyy-MM-dd HH:mm').format(date)
                  : null,
              filecount: _taskInfo.fileCount,
              completeCount: _taskInfo.completCount ?? 0,
              gid: _taskInfo.gid,
              coverimagePath: _taskInfo.coverImage != null
                  ? path.join(_taskInfo.dirPath ?? '', _taskInfo.coverImage)
                  : null,
            ),
          );
        },
        separatorBuilder: (_, __) {
          return Divider(
            indent: 20,
            height: 0.6,
            color: CupertinoDynamicColor.resolve(
                CupertinoColors.systemGrey4, context),
          );
        },
        itemCount: controller.galleryTasks.length,
      );
    });
  }
}
