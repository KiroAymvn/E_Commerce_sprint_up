
import '../../model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorite_state.dart';
class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitialState());

  void toggle (ProductModel productModel) {
    var newList = state.favoriteList;

    if (newList.contains(productModel)){
      newList.remove(productModel);
      emit(FavoriteUpdateState(newList)) ;   }
    else if(newList.contains(productModel) !=true ) {
      newList.add(productModel);
      emit(FavoriteUpdateState(newList));
    }
    else {
      if (newList.isEmpty)
        {
          emit(FavoriteInitialState());
        }
    }


  }


}
