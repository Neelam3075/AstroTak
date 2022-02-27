import 'package:astro_tak/network/network_config.dart';
import 'package:astro_tak/network/network_util.dart';
import 'package:astro_tak/src/screens/ask_question/models/category_response.dart';

class AskQuestionRepo {
  Future<CategoryResponse?> getQuestionCategories(
      Function(bool loading) isLoading) async {
    try {
      Map<String, dynamic>? getResponse = await NetworkUtil()
          .getApiCall(url: questionCategoryApi, loading: isLoading);

      CategoryResponse? categoryResponse =
          CategoryResponse.fromJson(getResponse);
      return categoryResponse;
    } catch (e) {
      return null;
    }
  }
}
