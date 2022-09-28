// ignore_for_file: invalid_use_of_protected_member

import 'package:apigetgetx/controllers/getcontroller.dart';
import 'package:apigetgetx/models/getsapiModel.dart';
import 'package:apigetgetx/post.dart';
import 'package:apigetgetx/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class apiGet extends StatelessWidget {
  final getController controller = Get.put(getController());

  // void _printLatestValue() {
  //   print('First text field: ${mycontroller.text}');
  // }

  // void _printLatestValue2() {
  //   print('Second text field: ${myController2.text}');
  // }

  // getdata() async {
  //   result = await apiService().getUser();
  //   if (isloaded != null) {
  //     setState(() {
  //       isloaded = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Obx((() => ListView.builder(
          itemCount: controller.completeData.length,
          itemBuilder: (context, index) {
            // return InkWell(
            //     onTap: () {
            //       authenicationPut().updateAlbum(
            //           'hassaan', controller.completeData.value[index].id);
            //     },
            //     child:
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('${controller.completeData.value[index].id}'),
                Text('${controller.completeData.value[index].title}'),
                GestureDetector(
                  onTap: () {
                    showBottomSheet(
                        context: context,
                        builder: (BuildContext) {
                          return Container(
                            height: 200,
                            color: Colors.amber,
                            child: Center(
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: controller.mycontroller,
                                    decoration: InputDecoration(
                                        hintText:
                                            '${controller.completeData.value[index].id}'),
                                  ),
                                  TextFormField(
                                    controller: controller.myController2,
                                    decoration: InputDecoration(
                                        hintText:
                                            '${controller.completeData.value[index].title}'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.onSavePressed(
                                          controller
                                              .completeData.value[index].id
                                              .toString(),
                                          controller
                                              .completeData.value[index].title
                                              .toString());
                                      authenicationPut().updateAlbum(
                                          controller.mycontroller.text
                                              .toString(),
                                          controller.myController2.text
                                              .toString());
                                      Get.back();
                                    },
                                    child: Text('Edit'),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Icon(Icons.edit),
                ),
                GestureDetector(
                  onTap: () {
                    authenicationPut().deleteAlbum(
                        controller.completeData.value[index].id.toString());
                  },
                  child: Icon(Icons.delete),
                )
              ],
            );
          },
        )));
  }
}
