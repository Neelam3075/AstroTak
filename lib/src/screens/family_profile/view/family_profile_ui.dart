import 'package:astro_tak/res/app_resources.dart';
import 'package:astro_tak/src/common_widgets/base_screen/base_screen_widget.dart';
import 'package:astro_tak/src/screens/family_profile/bloc/family_profile_cubit.dart';
import 'package:astro_tak/src/screens/family_profile/models/get_relatives/all_relatives.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FamilyProfileUi extends StatelessWidget {
  FamilyProfileUi({Key? key, required this.addMember}) : super(key: key);

  final ValueNotifier<bool> addMember;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyProfileCubit, FamilyProfileState>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return BaseScreenWidget(
              backgroundColor: Colors.grey[100],
              height: constraints.maxHeight,
              loading: state.loading,
              dialogMessage: state.msg,
              dialogPositiveButtonClick: () {
                context.read<FamilyProfileCubit>().getAllRelatives();
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: appColorBlueLight,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.account_balance_wallet,
                            color: appColorBlue,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RichText(
                              text: const TextSpan(
                                  text: appStringWalletBalance,
                                  style: appStyleTextSmallBlue,
                                  children: <InlineSpan>[
                                TextSpan(
                                  text: '10',
                                )
                              ])),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 14),
                              decoration: BoxDecoration(
                                  color: appColorPrimary,
                                  border: Border.all(
                                    color: appColorBlue,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child: const Text(
                                appStringButtonAddMoney,
                                style: appStyleButtonMoney,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: const Text(
                                appStringName,
                                style: appStyleTextExtraSmallBlue,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: const Text(
                                appStringDob,
                                style: appStyleTextExtraSmallBlue,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: const Text(
                                appStringTob,
                                style: appStyleTextExtraSmallBlue,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: const Text(
                                appStringRelation,
                                style: appStyleTextExtraSmallBlue,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          state.relativesResponse?.data?.allRelatives?.length ??
                              0,
                      itemBuilder: (context, index) {
                        AllRelatives relative =
                            state.relativesResponse!.data!.allRelatives![index];
                        return Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 18),
                          decoration: BoxDecoration(
                              color: appColorPrimary,
                              border: Border.all(
                                width: 1,
                                color: appColorLightGrey,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4))),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Text(
                                    relative.firstName ?? '',
                                    style: appStyleTextExtraSmallDarkBlue,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Text(
                                    '${relative.birthDetails?.dobDay}-${relative.birthDetails?.dobMonth}-${relative.birthDetails?.dobYear}',
                                    style: appStyleTextExtraSmallDarkBlue,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Text(
                                    '${relative.birthDetails?.tobHour}:${relative.birthDetails?.tobMin}',
                                    style: appStyleTextExtraSmallDarkBlue,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Text(
                                    relative.relation ?? '',
                                    style: appStyleTextExtraSmallDarkBlue,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.edit,
                                            color: appColorOrange,
                                          )),
                                      GestureDetector(
                                          onTap: () {
                                            context
                                                .read<FamilyProfileCubit>()
                                                .deleteRelative(
                                                    relative.uuid ?? '');
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ))
                                    ],
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        addMember.value = true;
                        addMember.notifyListeners();
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 14),
                          decoration: const BoxDecoration(
                              color: appColorOrange,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: const Text(
                            appStringAddNewProfileButtonText,
                            style: appStyleExtraTextSmallLight,
                          )),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
