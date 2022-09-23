import 'package:apigetgetx/models/getsapiModel.dart';
import 'package:apigetgetx/services/api.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class getController extends GetxController {
  // late Future<Getapi> futureGetApi;
  var isLoading = false.obs;
  var completeData = <Getapi>[].obs;

  @override
  void onInit() {
    getResult();
    super.onInit();
    // futureGetApi = apiService();
  }

  Future<List<Getapi>> getResult() async {
    var result = await AuthenicationService().apiService();

    completeData.value = result!;

    isLoading.value = false;
    return result;
  }
  //List<Getapi>? result;
  // var Listresult = <Getapi>[].obs;
  // var getApiii = Getapi().obs;

  // var isLoaded = false.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // Future<Getapi?> getApiUser() async {
  //   isLoaded.value = true;

  // }
}
