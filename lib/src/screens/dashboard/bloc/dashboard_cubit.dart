import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<int>{
  DashboardCubit(int initialState) : super(initialState);
  setNavigationIndex(int index){
    emit(index);
  }
}