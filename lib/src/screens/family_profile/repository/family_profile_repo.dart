import 'package:astro_tak/network/network_config.dart';
import 'package:astro_tak/network/network_util.dart';
import 'package:astro_tak/src/screens/add_member/models/add_member_respone.dart';
import 'package:astro_tak/src/screens/family_profile/models/delete_relative/delete_relative_resonse.dart';
import 'package:astro_tak/src/screens/family_profile/models/get_relatives/relatives_response.dart';

class FamilyProfileRepo {
  Future<RelativesResponse?> getAllRelatives(
      Function(bool loading) isLoading) async {
    try {
      Map<String, dynamic>? getResponse = await NetworkUtil()
          .getApiCall(url: getRelativesApi, loading: isLoading);

      RelativesResponse? response =
      RelativesResponse.fromJson(getResponse);
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<DeleteRelativeResonse?> deleteRelatives(String relativeId,
      Function(bool loading) isLoading) async {
    try {
      Map<String, dynamic>? getResponse = await NetworkUtil()
          .postApiCall(url: deleteRelativesApi+relativeId, loading: isLoading);

      DeleteRelativeResonse? response =
      DeleteRelativeResonse.fromJson(getResponse);
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<AddMemberResponse?> addMember(addMemberRequest,
      Function(bool isLoading) isLoading) async {
    try {
      Map<String, dynamic>? getResponse = await NetworkUtil().postApiCall(
          url: addMemberApi, loading: isLoading, requestBody: addMemberRequest);

      AddMemberResponse? addMemberResponse =
      AddMemberResponse.fromJson(getResponse);
      return addMemberResponse;
    } catch (e) {
      return null;
    }
  }
}
