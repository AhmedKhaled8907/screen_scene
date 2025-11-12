import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/services/services_locator.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/domain/repos/auth_repo.dart';

part 'display_user_info_state.dart';

class DisplayUserInfoCubit extends Cubit<DisplayUserInfoState> {
  DisplayUserInfoCubit() : super(DisplayUserInfoInitial());

  Future<void> displayUserInfo() async {
    emit(DisplayUserInfoLoading());
    var returnedData = await sl<AuthRepo>().getUser();
    returnedData.fold(
      (error) => emit(
        DisplayUserInfoFailure(errMessage: error.message),
      ),
      (data) => emit(
        DisplayUserInfoSuccess(entity: data),
      ),
    );
  }
}
