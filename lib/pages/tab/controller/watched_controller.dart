import 'package:fehviewer/generated/l10n.dart';
import 'package:fehviewer/network/gallery_request.dart';
import 'package:fehviewer/route/routes.dart';
import 'package:get/get.dart';

import 'tabview_controller.dart';

class WatchedViewController extends TabViewController {
  String get title => L10n.of(Get.context!).tab_watched;

  @override
  void onInit() {
    fetchNormal = Api.getWatched;
    tabTag = EHRoutes.watched;
    super.onInit();
  }
}
