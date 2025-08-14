
import 'package:flutter/cupertino.dart';

import '../../model/product_model.dart';

@immutable
sealed class FavoriteState {
  final List <ProductModel> favoriteList;

  const FavoriteState( this.favoriteList);
}

final class FavoriteInitialState extends FavoriteState {
  FavoriteInitialState() : super( []);
}
final class FavoriteUpdateState extends FavoriteState{
  const FavoriteUpdateState (super.favoriteList) ;

}
