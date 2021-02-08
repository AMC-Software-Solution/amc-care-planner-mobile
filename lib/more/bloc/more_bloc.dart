import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:amcCarePlanner/generated/l10n.dart';
import 'package:amcCarePlanner/shared/models/user.dart';
import 'package:amcCarePlanner/shared/repository/account_repository.dart';

part 'more_events.dart';
part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  final AccountRepository _accountRepository;

  MoreBloc({@required AccountRepository accountRepository}) : assert(accountRepository != null),
        _accountRepository = accountRepository, super(const MoreState());

  @override
  void onTransition(Transition<MoreEvent, MoreState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<MoreState> mapEventToState(MoreEvent event) async* {
    // if (event is Init) {
       // yield* onInit(event);
  //   }
   }

  // Stream<MoreState> onInit(Init event) async* {
  //   User currentUser = await _accountRepository.getIdentity();
  //
  //   if(currentUser.langKey.compareTo(S.current.locale) != 0) {
  //     S.load(Locale(currentUser.langKey));
  //
  //   }
  //
  //   yield state.copyWith(
  //     currentUser: currentUser,
  //   );
  // }
}
