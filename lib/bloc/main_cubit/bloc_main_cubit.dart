import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/app/app_data.dart';
import '../../core/app/app_repository.dart';
part 'bloc_main_state.dart';

class BlocMainCubit extends Cubit<BlocMainState> {
  BlocMainCubit({required this.repository}) : super(BlocMainInitial()) {
    _appData = repository.loadAppData();
  }
  final AppRepository repository;
  AppData? _appData;
  AppState get appState {
    if (_appData == null || _appData!.isSeenTutorial != true) {
      return AppState.notSeenTutorial;
    }
    if (_appData!.isGuestUser == null ||
        (_appData!.isGuestUser != null && _appData!.isGuestUser == true)) {
      return AppState.guest;
    }

    if (_appData != null && (_appData!.id == null || _appData!.id!.isEmpty)) {
      return AppState.unauthenticated;
    }
    if (_appData!.isCompleted == false) {
      return AppState.notCompleted;
    }

    if (_appData!.isVerfied == false) {
      return AppState.notVerified;
    }

    return AppState.authenticated;
  }

  void authenticate(
    AppData data,
  ) async {
    _appData = data.copyWith(
        userId: data.id.toString(),
        name: data.displayName,
        phoneCopy: data.phone,
        emailCopy: data.email,
        tokenCopy: data.token,
        isCompleteed: data.isCompleted,
        isverfied: data.isVerfied,
        seenTutorial: data.isSeenTutorial,
        typeUserCopy: data.typeUser,
        title: data.title,
        notificationStatus: data.notificationStatus,
        langCode: data.languageCode);
    await repository.store.setAppData(_appData!);
    emit(UpdateDataState(appData: _appData!));
  }

  void updateData(
    AppData data,
  ) async {
    _appData = _appData!.copyWith(
      userId: data.id.toString(),
      name: data.displayName,
      tokenCopy: data.token,
      typeUserCopy: data.typeUser,
      phoneCopy: data.phone,
      emailCopy: data.email,
      photo: data.photoUrl,
      isCompleteed: data.isCompleted,
      isGuestUserCopy: data.isGuestUser,
      isverfied: data.isVerfied,
      notificationStatus: data.notificationStatus,
      title: data.title,
      // tokenCopy: data.token,
      // typeUserCopy: data.typeUser,
      langCode: data.languageCode,
    );
    await repository.store.setAppData(_appData!);
    emit(UpdateDataState(appData: _appData!));
    emit(BlocMainInitial());
  }

  void seenIntro() async {
    if (_appData == null) {
      _appData = AppData(isSeenTutorial: true, isGuestUser: false);
    } else {
      _appData = _appData!.copyWith(seenTutorial: true, isGuestUserCopy: false);
    }
    await repository.store.setAppData(_appData!);
    emit(UpdateDataState(appData: _appData!));
  }

  void verfied() async {
    if (_appData == null) {
      _appData =
          AppData(isSeenTutorial: true, isGuestUser: false, isVerfied: true);
    } else {
      _appData = _appData!.copyWith(
          seenTutorial: true, isGuestUserCopy: false, isverfied: true);
    }
    await repository.store.setAppData(_appData!);
    emit(UpdateDataState(appData: _appData!));
  }

  void unAuthenticate() async {
    _appData = _appData!.copyWith(
      seenTutorial: true,
      isGuestUserCopy: false,
      isverfied: false,
      tokenCopy: "",
      userId: "",
      phoneCopy: "",
      name: "",
      photo: "",
      typeUserCopy: "",
      notificationStatus: "",
      title: '',
    );

    await repository.store.setAppData(_appData!);
    emit(UpdateDataState(appData: _appData!));
  }
}
