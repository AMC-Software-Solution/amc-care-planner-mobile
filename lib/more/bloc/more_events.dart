part of 'more_bloc.dart';

abstract class MoreEvent extends Equatable {
  const MoreEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

// class Init extends MoreEvent {}
