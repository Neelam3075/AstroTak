import 'package:astro_tak/src/screens/ask_question/cubit/ask_question_cubit.dart';
import 'package:astro_tak/src/screens/ask_question/repository/ask_question_repo.dart';
import 'package:astro_tak/src/screens/ask_question/view/ask_question_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AskQuestionScreen extends StatelessWidget {
  const AskQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AskQuestionRepo(),
      child: BlocProvider<AskQuestionCubit>(
        create: (BuildContext context) =>
            AskQuestionCubit(askQuestionRepo: context.read<AskQuestionRepo>()),
        child: const AskQuestionUi(),
      ),
    );
  }
}
