import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:ecommercefinalproj/model/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());
bool isAddedToCart=false;
  void toggleCart(ProductModel productModel){
    var newList =state.cartList;
      if(newList.contains(productModel)){
        productModel.quantity=null;
        newList.remove(productModel);
        isAddedToCart=false;
            emit(CartUpdateState(newList));
      }
      else {
        productModel.quantity=1;
        newList.add(productModel);
        isAddedToCart=true;

        emit(CartUpdateState(newList));

      }
  }
  void remove( ProductModel productModel){
    var newList=state.cartList;
    productModel.quantity=null;
    newList.remove(productModel);
    emit(CartUpdateState(newList));
  }
  void increment(ProductModel productModel){
    productModel.quantity=productModel.quantity!+1 ;
    emit(CartUpdateState(state.cartList));

  }
  void decrement(ProductModel productModel){
    if (productModel.quantity ==1){
      productModel.quantity=1;
      emit(CartUpdateState(state.cartList));
    }
    else {
      productModel.quantity=(productModel.quantity!-1);
      emit(CartUpdateState(state.cartList));
    }
  }
void clearList(){
    var newList=state.cartList;
    newList.clear();
    // for(var item in state.cartList){
    //   item.quantity=null;
    // }
    emit(CartUpdateState(newList));
}
  int totalPrice (){
    int total=0;
    for(var i in state.cartList)
      {
        total=total+ i.quantity!*i.price ;
      }
  return total;
  }
  double totalPriceAfterDiscount(double?discount){
    if (discount!=null){
      double total=(totalPrice()-totalPrice()*discount as num).toDouble();
      return total;
    }
    else {
      return totalPrice().toDouble();
    }
  }

}
