import 'package:equatable/equatable.dart';

import '../../data/model/user_post_model.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  List<UserPostModel> getList;
  UserSuccessState({required this.getList});
  @override
  // TODO: implement props
  List<Object> get props => [getList];
}

class UserErrorState extends UserState {
  String message;
  UserErrorState({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
