import 'dart:developer';

import 'package:astro_tak/res/app_resources.dart';
import 'package:astro_tak/res/app_strings.dart';
import 'package:astro_tak/src/common_widgets/base_screen/base_screen_library.dart';
import 'package:astro_tak/src/common_widgets/custom_text_field.dart';
import 'package:astro_tak/src/screens/add_member/bloc/add_member_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMemberScreen extends StatelessWidget {
  AddMemberScreen({Key? key, required this.addMember}) : super(key: key);
  final ValueNotifier<bool> addMember;

  showDatePickerDialog(BuildContext context, AddMemberState state) async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year),
        helpText: "SELECT  DATE",
        cancelText: "CANCEL",
        confirmText: "SELECT",
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (dateTime != null) {
      dateController.text = dateTime.day.toString();
      monthController.text = dateTime.month.toString();
      yearController.text = dateTime.year.toString();

      state.addMemberRequest?.birthDetails?.dobDay = dateTime.day;
      state.addMemberRequest?.birthDetails?.dobMonth = dateTime.month;
      state.addMemberRequest?.birthDetails?.dobYear = dateTime.year;
    }
  }

  showTimePickerDialog(BuildContext context, AddMemberState state) async {
    TimeOfDay? tod = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(
            hour: TimeOfDay.hoursPerPeriod, minute: TimeOfDay.minutesPerHour));

    if (tod != null) {
      hourController.text = tod.hour.toString();
      minuteController.text = tod.minute.toString();
      /*   state.addMemberRequest?.birthDetails?.tobHour = tod.hour;
      state.addMemberRequest?.birthDetails?.tobMin = tod.minute;
      state.addMemberRequest?.birthDetails?.meridiem = tod.period.name;*/
      context.read<AddMemberCubit>().setTime(tod);
    }
  }

  final List<String> relation = [
    'Father',
    'Mother',
    'Brother',
    'Sister',
    'Spouse',
    'Son',
    'Daughter',
    'Father in law',
    'Mother in law'
  ];

  final List<String> gender = [
    'MALE',
    'FEMALE',
  ];

  final _formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();

  TextEditingController monthController = TextEditingController();

  TextEditingController yearController = TextEditingController();

  TextEditingController hourController = TextEditingController();

  TextEditingController minuteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<AddMemberCubit, AddMemberState>(
          builder: (context, state) {
        return BaseScreenWidget(
          loading: state.loading,
          dialogMessage: state.msg,
          height: constraints.maxHeight,
          backgroundColor: Colors.white,
          dialogPositiveButtonClick: () {
            addMember.value = false;
            addMember.notifyListeners();
          },
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        InkWell(
                          child: const Icon(Icons.arrow_back_ios),
                          onTap: () {
                                addMember.value = false;
                                addMember.notifyListeners();
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                appStringAddNewProfile,
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            CustomRectTextField(
                          title: appStringName,
                          onChanged: (name) {
                            state.addMemberRequest?.fullName = name;
                          },
                          validator: (name) {
                            return context
                                .read<AddMemberCubit>()
                                .isNameValid(name);
                          },
                        ),
                            Row(
                              children: [
                                Flexible(
                                    child: CustomRectTextField(
                              readOnly: true,
                              hintText: appStringDd,
                              controller: dateController,
                              onTap: () {
                                showDatePickerDialog(context, state);
                              },
                              showHintText: true,
                              validator: (date) {
                                return context
                                    .read<AddMemberCubit>()
                                    .isDateValid(date);
                              },
                              title: appStringDOB,
                            )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                    child: CustomRectTextField(
                              onTap: () {
                                showDatePickerDialog(context, state);
                              },
                              controller: monthController,
                              validator: (month) {
                                return context
                                    .read<AddMemberCubit>()
                                    .isDateValid(month);
                              },
                              readOnly: true,
                              hintText: appStringMm,
                            )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                    child: CustomRectTextField(
                              hintText: appStringYear,
                              controller: yearController,
                              readOnly: true,
                              onTap: () {
                                showDatePickerDialog(context, state);
                              },
                              validator: (year) {
                                return context
                                    .read<AddMemberCubit>()
                                    .isYearValid(year);
                              },
                            )),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                child: CustomRectTextField(
                              controller: hourController,
                              onTap: () {
                                showTimePickerDialog(context, state);
                              },
                              validator: (hour) {
                                return context
                                    .read<AddMemberCubit>()
                                    .isHourValid(hour);
                              },
                              readOnly: true,
                              title: appStringTime,
                              hintText: appStringHh,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                child: CustomRectTextField(
                              controller: minuteController,
                              hintText: appStringMm,
                              readOnly: true,
                              onTap: () {
                                showTimePickerDialog(context, state);
                              },
                              validator: (minute) {
                                return context
                                    .read<AddMemberCubit>()
                                    .isMinuteValid(minute);
                              },
                            )),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 36),
                                height: 48,
                                width: 50,
                                child: const Center(
                                  child: Text(
                                    appStringAm,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: state.addMemberRequest?.birthDetails
                                                ?.meridiem ==
                                            'Am'
                                        ? appColorDarkBlue
                                        : appColorGrey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                              ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 36),
                                height: 48,
                                width: 50,
                                child: const Center(
                                  child: Text(
                                    appStringPm,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: state.addMemberRequest?.birthDetails
                                                ?.meridiem ==
                                            'Pm'
                                        ? appColorDarkBlue
                                        : appColorGrey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                              ),
                                ),
                              ],
                            ),
                            CustomRectTextField(
                          title: appStringPlace,
                          onChanged: (place) {
                            state.addMemberRequest?.birthPlace?.placeName =
                                place;
                          },
                          validator: (place) {
                            return context
                                .read<AddMemberCubit>()
                                .isPlaceValid(place);
                          },
                        ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                        child: Text(
                                          appStringGender,
                                          style: appStyleAddProfileText,
                                        ),
                                      ),
                                      DecoratedBox(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: appColorGrey, width: 2.5),
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: DropdownButton<String?>(
                                            value:
                                                state.addMemberRequest?.gender,
                                            items: gender.map((String e) {
                                              return DropdownMenuItem<String>(
                                                  value: e, child: Text(e));
                                            }).toList(),
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.arrow_drop_down),
                                            onChanged: (g) {
                                              context
                                                  .read<AddMemberCubit>()
                                                  .setGender(g ?? 'OTHER');
                                            },
                                          ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                        child: Text(
                                          appStringRelation,
                                          style: appStyleAddProfileText,
                                        ),
                                      ),
                                      DecoratedBox(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: appColorGrey, width: 2.5),
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: DropdownButton<String?>(
                                            value: relation[(state
                                                        .addMemberRequest
                                                        ?.relationId ??
                                                    0) -
                                                1],
                                            items: relation.map((e) {
                                              return DropdownMenuItem<String>(
                                                  value: e, child: Text(e));
                                            }).toList(),
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.arrow_drop_down),
                                            onChanged: (r) {
                                              int? getIndex =
                                                  relation.indexOf(r ?? '');

                                              /*state.addMemberRequest
                                                      ?.relationId =
                                                  (getIndex );*/

                                              context
                                                  .read<AddMemberCubit>()
                                                  .setRelation(getIndex + 1);
                                            },
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                      log('State://///////// ${state.addMemberRequest?.toJson()}');
                      if (_formKey.currentState!.validate()) {
                        context.read<AddMemberCubit>().addMember();
                      }
                    },
                        child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 30,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 14),
                        decoration: const BoxDecoration(
                            color: appColorOrange,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: const Text(
                          appStringSaveChanges,
                          style: appStyleExtraTextSmallLight,
                        )),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
