import 'package:apigetgetx/controllers/getcontroller.dart';
import 'package:apigetgetx/models/getsapiModel.dart';
import 'package:apigetgetx/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class apiGet extends StatefulWidget {
  apiGet({super.key});

  @override
  State<apiGet> createState() => _apiGetState();
}

class _apiGetState extends State<apiGet> {
  final getController controller = Get.put(getController());

  final mycontroller = TextEditingController();
  final myController2 = TextEditingController();

  void _printLatestValue() {
    print('First text field: ${mycontroller.text}');
  }

  void _printLatestValue2() {
    print('Second text field: ${myController2.text}');
  }

  @override
  void initState() {
    super.initState();
    mycontroller.addListener(_printLatestValue);
    myController2.addListener(_printLatestValue2);
  }

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
    return Scaffold(
        appBar: AppBar(title: Text('Todo')),
        body: Obx((() => ListView.builder(
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
                                        controller: mycontroller,
                                        decoration: InputDecoration(
                                            hintText:
                                                '${controller.completeData.value[index].id}'),
                                      ),
                                      TextFormField(
                                        controller: myController2,
                                        decoration: InputDecoration(
                                            hintText:
                                                '${controller.completeData.value[index].title}'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          authenicationPut()
                                              .updateAlbum("21", "Hassaan"
                                                  // mycontroller.toString(),
                                                  // myController2.toString()
                                                  );
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
                    )
                  ],
                );
              },
            ))));
  }
}
