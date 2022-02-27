import 'package:astro_tak/res/app_resources.dart';

mixin AddMemberValidationMixin {
  String? isNameValid(String? name) {
    if (name == null || name.isEmpty) {
      return appStringNameShouldNotBeEmpty;
    }
  }

  String? isDateValid(String? date) {
    if (date == null || date.isEmpty) {
      return appStringDateShouldNotBeEmpty;
    }
  }

  String? isMonthValid(String? month) {
    if (month == null || month.isEmpty) {
      return appStringMonthShouldNotBeEmpty;
    }
  }

  String? isYearValid(String? year) {
    if (year == null || year.isEmpty) {
      return appStringYearShouldNotBeEmpty;
    }
  }

  String? isHourValid(String? hour) {
    if (hour == null || hour.isEmpty) {
      return appStringHourShouldNotBeEmpty;
    }
  }

  String? isMinuteValid(String? minute) {
    if (minute == null || minute.isEmpty) {
      return appStringNameShouldNotBeEmpty;
    }
  }

  String? isPlaceValid(String? place) {
    if (place == null || place.isEmpty) {
      return appStringPlaceOfBirthShouldNotBeEmpty;
    }
  }

  String? isGenderValid(String? gender) {
    if (gender == null || gender.isEmpty) {
      return appStringGenderShouldNotBeEmpty;
    }
  }

  String? isRelativeValid(String? relation) {
    if (relation == null || relation.isEmpty) {
      return appStringRelationShouldNotBeEmpty;
    }
  }
}
