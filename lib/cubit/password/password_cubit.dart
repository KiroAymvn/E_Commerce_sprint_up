import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<bool> {
  PasswordCubit() : super(false);
  void toggle() {
    if (state==false){
      emit(true);
    }
    else {
      emit(false);
    }
}
}
