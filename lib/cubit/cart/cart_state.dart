part of 'cart_cubit.dart';

@immutable
sealed class CartState {
  final List<ProductModel> cartList;

  CartState(this.cartList);
}

final class CartInitialState extends CartState {
  CartInitialState (): super([]);
}
final class CartUpdateState extends CartState {
  CartUpdateState(super.cartList,);
}
