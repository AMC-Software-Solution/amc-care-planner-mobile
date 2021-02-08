part of 'more_bloc.dart';


class MoreState extends Equatable {
  final User currentUser;
  const MoreState({
    this.currentUser = const User('', '', '', '', '', ''),
  });

  MoreState copyWith({
    User currentUser,
  }) {
    return MoreState(
      currentUser: currentUser ?? this.currentUser,
    );
  }

  @override
  List<Object> get props => [currentUser];

  @override
  bool get stringify => true;
}
