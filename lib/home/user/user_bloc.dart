import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:work_task/home/user/user_event.dart';
import 'package:work_task/home/user/user_state.dart';

import '../../data/repositry/repositry.dart';

class UserBloc extends Bloc<UserPostEvent, UserState> {
  UserBloc() : super(UserLoadingState()) {
    final UserRepository2 apiRepository = UserRepository2();
    on<GetPostList>((event, emit) async {
      try {
        emit(UserLoadingState());
        final mList = await apiRepository.getRestaurantData();

        emit(UserSuccessState(getList: mList));
        if (mList.isEmpty) {
          emit(UserErrorState(
            message: mList.toString(),
          ));
        }
      } catch (e) {
        emit(UserErrorState(message: e.toString()));
      }
    });
  }
}
