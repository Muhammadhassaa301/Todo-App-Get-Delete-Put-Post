import 'package:apigetgetx/controllers/getcontroller.dart';
import 'package:apigetgetx/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class PostApi extends StatelessWidget {
  PostApi({super.key});
  final getController controller = Get.put(getController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Api')),
      body: Column(
        children: [
          TextFormField(
            controller: controller.controllerid,
            decoration: InputDecoration(hintText: "Enter Id"),
          ),
          TextFormField(
            controller: controller.controllertitle,
            decoration: InputDecoration(hintText: "Enter title"),
          ),
          TextFormField(
            controller: controller.controllerdescription,
            decoration: InputDecoration(hintText: "Enter Description"),
          ),
          TextFormField(
            controller: controller.controllerpriority,
            decoration: InputDecoration(hintText: "Enter Prority"),
          ),
          TextFormField(
            controller: controller.controllercategory,
            decoration: InputDecoration(hintText: "Enter Category"),
          ),
          TextFormField(
            controller: controller.controlleriscomplete,
            decoration: InputDecoration(hintText: "Enter Iscompleted"),
          ),
          TextFormField(
            controller: controller.controllertimestamp,
            decoration: InputDecoration(hintText: "Enter timestamp"),
          ),
          TextFormField(
            controller: controller.controlleruserid,
            decoration: InputDecoration(hintText: "Enter User Id"),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                controller.onAdd("", "", "", "", "", "", "", "");
                authenticationpost().apiServicePost(
                    controller.controllerid.text,
                    controller.controllertitle.text,
                    controller.controllerdescription.text,
                    controller.controllercategory.text,
                    controller.controllertimestamp.text,
                    controller.controllerpriority.text,
                    controller.controlleruserid.text,
                    controller.controlleriscomplete.text);
                Get.back();
              },
              child: Text('Post'),
            ),

            //     child: ElevatedButton(
            //   onPressed: () {
            //     authenticationpost().apiServicePost();
            //   },
            //   child: Text('Put'),
            // )
          ),
        ],
      ),
    );
  }
}
