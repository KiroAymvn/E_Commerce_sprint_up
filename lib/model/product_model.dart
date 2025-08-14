class ProductModel {
  final String name;
  final String image;
  final String desc;
  final int price;
  int?quantity;

  ProductModel(
      {
    required this.name,
    required this.image,
    required this.desc,
    required this.price, required quantity,
  });

  static final List <ProductModel> productList= [
    ProductModel(quantity:null,name: "Basic Top", image: "assets/Products/Basic Top.png", desc: "no desc", price: 120),
    ProductModel(quantity:null,name: "Black long Skirt", image: "assets/Products/Black Long Skirt.png", desc: "no desc", price: 400),
    ProductModel(quantity:null,name: "Black Top", image: "assets/Products/Black Top.png", desc: "no desc", price: 50),
    ProductModel(quantity:null,name: "Brown Top", image: "assets/Products/Brown Top.png", desc: "no desc", price: 300),
    ProductModel(quantity:null,name: "Formal Black Jacket", image: "assets/Products/Formal Black Jacket.png", desc: "no desc", price: 250),
    ProductModel(quantity:null,name: "Formal  Jacket", image: "assets/Products/Formal Jacket.png", desc: "no desc", price: 100),
    ProductModel(quantity:null,name: "Gen Z basic", image: "assets/Products/Gen Z basic.png", desc: "no desc", price: 50),
    ProductModel(quantity:null,name: "Off-White Skirt", image: "assets/Products/Off-White Skirt.png", desc: "no desc", price: 370),
    ProductModel(quantity:null,name: "Red Top", image: "assets/Products/Red Top.png", desc: "no desc", price: 150),
    ProductModel(quantity:null,name: "White Top", image: "assets/Products/White Top.png", desc: "no desc", price: 500),

  ];


}
