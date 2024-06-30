class FoodModel {
  String? image;
  String? name;
  String? deal;
  int? productNo;
  dynamic rating;
  int? ratingPeople;
  String? restaurantName;
  String? restaurantAddress;
  String? state;
  String? cafeImage;
  int? productPrice;
  int? addCart;
  int? quantity;
  String? category;
  String? productName;
  String? type;
  String? gram;
  bool? favourite;
  bool? addProduct;
  dynamic ratPeople; //'rating'

  List<FoodModel> foodListDetails = [];

  FoodModel(
      {this.image,
      this.name,
      this.deal,
      this.category,
      this.type,
      this.restaurantName,
      this.restaurantAddress,
      this.rating,
      this.quantity,
      this.productNo,
      this.productName,
      this.favourite,
      this.addProduct,
      this.cafeImage,
      this.addCart,
      this.gram,
      this.productPrice,
      this.ratingPeople,
      this.state,
      this.ratPeople});

  factory FoodModel.fromFood(Map m1) {
    return FoodModel(
      image: m1['image'],
      name: m1['name'],
      deal: m1['deal'],
      type: m1['type'],
      restaurantName: m1['restaurantName'],
      restaurantAddress: m1['restaurantAddress'],
      rating: m1['rating'],
      quantity: m1['quantity'],
      productNo: m1['productNo'],
      productName: m1['productName'],
      favourite: m1['favourite'],
      category: m1['category'],
      addProduct: m1['addProduct'],
      addCart: m1['addCart'],
      cafeImage: m1['cafeImage'],
      gram: m1['gram'],
      productPrice: m1['productPrice'],
      ratingPeople: m1['ratingPeople'],
      state: m1['state'],
      ratPeople: m1['rating'],
    );
  }

  FoodModel.toList({required List list1}) {
    for (int i = 0; i < list1.length; i++) {
      foodListDetails.add(FoodModel.fromFood(list1[i]));
    }
  }
}
