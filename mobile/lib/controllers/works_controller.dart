import 'package:get/get.dart';
import '../services/api_service.dart';

class WorksController extends GetxController {
  final apiService = ApiService();
  RxList<dynamic> works = <dynamic>[].obs;
  RxBool isLoading = false.obs;
  RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWorks();
  }

  Future<void> fetchWorks() async {
    try {
      isLoading.value = true;
      final data = await apiService.getWorks();
      works.value = data;
      error.value = '';
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchWorks(String query) async {
    try {
      isLoading.value = true;
      final data = await apiService.searchWorks(query);
      works.value = data;
      error.value = '';
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
