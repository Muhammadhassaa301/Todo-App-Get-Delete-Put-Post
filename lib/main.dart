import 'package:apigetgetx/apiget.dart';
import 'package:apigetgetx/controllers/getcontroller.dart';
import 'package:apigetgetx/post.dart';
import 'package:apigetgetx/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final getController controller = Get.put(getController());

  void _onRefresh() {
    controller.getResult();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    _refreshController.loadComplete();
  }

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo'),
          actions: [
            GestureDetector(
                onTap: () {
                  Get.to(PostApi());
                },
                child: Icon(Icons.post_add))
          ],
        ),
        body: SmartRefresher(
          enablePullDown: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: apiGet(),
        ),
      ),
    );
  }
}
