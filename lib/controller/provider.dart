
import 'package:flutter/material.dart';
import 'package:shopapp/model/itemclass.dart';


class Data extends ChangeNotifier {
  List<cartItem> itemcart = [];
  List<cartItem> favorite=[];
  int currentIndex = 0;


 void removeFavorite(index){
  if (index>=0 &&index<favorite.length) {
    favorite.removeAt(index);
  }
  notifyListeners();

 }
  void addToFavorite(productiD,image,price,name){

      int ishere=favorite.indexWhere((favo)=> favo.productId==productiD); 

      if (ishere!=-1) {
        return;
      }else{
        favorite.add(
          cartItem(name: name, price: price, productId:productiD, image: image)
        );
      }
        notifyListeners();
  }
  void addToCart(productId, image, price, name) {
    final isexisting =
        itemcart.indexWhere((item) => item.productId == productId);

    if (isexisting != -1) {
      itemcart[isexisting].quantity++;
    } else {
      itemcart.add(cartItem(
          name: name, price: price, productId: productId, image: image));
    }
    notifyListeners();
  }

  void removeFromCart(index) {
    if (index >= 0 && itemcart.length > index) {
      itemcart.removeAt(index);
      notifyListeners();
    }
  }

  void increment(index) {
    if (index >= 0 && index < itemcart.length) {
      itemcart[index].quantity++;
      notifyListeners();
    }
  }

  void decrement(index) {
    if (index >= 0 && index < itemcart.length && itemcart[index].quantity > 1) {
      itemcart[index].quantity--;
      notifyListeners();
    }
  }

  void updateQuantity(int index, newproduct) {
    if (index > 1 && index < itemcart.length && newproduct > 1) {
      itemcart[index].quantity = newproduct;
      notifyListeners();
    }
  }

  double get totalPrice {
    return itemcart.fold(0, (sum, item) => sum + item.totalPrice);
  }

  int get cartCount {
    return itemcart.fold(0, (sum, itme) => sum + itme.quantity);
  }

  // ignore: non_constant_identifier_names
   UpdateCurrentIndex(index) {
    currentIndex = index;
    notifyListeners();
  }
}