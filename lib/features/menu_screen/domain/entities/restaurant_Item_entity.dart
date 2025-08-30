import 'package:equatable/equatable.dart';

class RestaurantItemEntity extends Equatable {
  final int itemID;
  final String itemName;
  final String itemDescription;
  final double itemPrice;
  final String restaurantName;
  final int restaurantID;
  final String imageUrl;

  const RestaurantItemEntity({
    required this.itemID,
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
    required this.restaurantName,
    required this.restaurantID,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
    itemID,
    itemName,
    itemDescription,
    itemPrice,
    restaurantName,
    restaurantID,
    imageUrl,
  ];
}
