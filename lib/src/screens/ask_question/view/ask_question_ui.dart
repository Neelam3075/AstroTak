import 'package:astro_tak/res/app_colors.dart';
import 'package:astro_tak/res/app_strings.dart';
import 'package:astro_tak/res/app_styles.dart';
import 'package:astro_tak/src/common_widgets/base_screen/base_screen_library.dart';
import 'package:astro_tak/src/screens/ask_question/cubit/ask_question_cubit.dart';
import 'package:astro_tak/src/screens/ask_question/models/question_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AskQuestionUi extends StatelessWidget {
  const AskQuestionUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AskQuestionCubit, AskQuestionState>(
        builder: (context, state) {
      return BaseScreenWidget(
          dialogPositiveButtonClick: () {
            context.read<AskQuestionCubit>().hideDialog();
          },
          dialogNegetiveButtonClick: () {
            context.read<AskQuestionCubit>().hideDialog();
          },
          dialogMessage: state.msg,
          loading: state.loading,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  appStringLabelAskQues,
                  style: appStyleHeadingDark,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  appStringDescriptionAskQues,
                  style: appStyleExtraTextSmallDark,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  appStringLabelCategory,
                  style: appStyleHeadingDark,
                ),
                const SizedBox(
                  height: 10,
                ),
                DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: appColorGrey),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton<QuestionCategory?>(
                          isExpanded: true,
                          value: state.categoryResponse?.data?[state.index],
                          icon: const Icon(Icons.arrow_drop_down),
                          items: state.categoryResponse?.data!
                              .map((QuestionCategory e) {
                            return DropdownMenuItem<QuestionCategory>(
                              value: e,
                              child: Text(e.name ?? ''),
                            );
                          }).toList(),
                          onChanged: (value) {
                            context
                                .read<AskQuestionCubit>()
                                .getSelectedCategories(value);
                          },
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: appColorGrey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: appStringHintQuestion),
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  appStringLabelIdeas,
                  style: appStyleHeadingDark,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.categoryResponse?.data?[state.index]
                          .suggestions?.length ??
                      0,
                  itemBuilder: (context, index) {
                    String? getItem = state.categoryResponse?.data?[state.index]
                        .suggestions?[index];
                    return getIdeaUi(getItem ?? '');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  appStringDescriptionIdeas,
                  style: appStyleExtraTextSmallDark,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: appColorLightOrange,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: const [
                      Text('•$appStringDescriptionIdeas1',
                          style: appStyleExtraTextSmallOrange),
                      Text('•$appStringDescriptionIdeas2',
                          style: appStyleExtraTextSmallOrange),
                      Text('•$appStringDescriptionIdeas3',
                          style: appStyleExtraTextSmallOrange),
                      Text('•$appStringDescriptionIdeas4',
                          style: appStyleExtraTextSmallOrange),
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }

  Widget getIdeaUi(String ideas) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.help_center_sharp, color: appColorOrange),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              ideas,
              style: appStyleTextSmallDark,
              overflow: TextOverflow.clip,
              maxLines: 3,
            )),
          ],
        ),
        const Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
