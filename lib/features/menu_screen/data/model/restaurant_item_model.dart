import 'package:ps_digital_task/features/menu_screen/domain/entities/restaurant_Item_entity.dart';

class RestaurantItemModel extends RestaurantItemEntity {
  const RestaurantItemModel({
    required super.itemID,
    required super.itemName,
    required super.itemDescription,
    required super.itemPrice,
    required super.restaurantName,
    required super.restaurantID,
    required super.imageUrl,
  });

  factory RestaurantItemModel.fromJson(Map<String, dynamic> json) {
    try {
      return RestaurantItemModel(
        itemID: _parseIntField(json, 'itemID'),
        itemName: _parseStringField(json, 'itemName'),
        itemDescription: _parseStringField(json, 'itemDescription'),
        itemPrice: _parseDoubleField(json, 'itemPrice'),
        restaurantName: _parseStringField(json, 'restaurantName'),
        restaurantID: _parseIntField(json, 'restaurantID'),
        imageUrl: _parseStringField(json, 'imageUrl'),
      );
    } catch (e) {
      throw FormatException(
        'Failed to parse RestaurantItemModel: ${e.toString()}',
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'itemID': itemID,
      'itemName': itemName,
      'itemDescription': itemDescription,
      'itemPrice': itemPrice,
      'restaurantName': restaurantName,
      'restaurantID': restaurantID,
      'imageUrl': imageUrl,
    };
  }

  static int _parseIntField(Map<String, dynamic> json, String fieldName) {
    final value = json[fieldName];
    if (value == null) {
      throw FormatException('Missing required field: $fieldName');
    }
    if (value is int) return value;
    if (value is String) {
      final parsed = int.tryParse(value);
      if (parsed != null) return parsed;
    }
    throw FormatException(
      'Invalid $fieldName: expected int, got ${value.runtimeType}',
    );
  }

  static String _parseStringField(Map<String, dynamic> json, String fieldName) {
    final value = json[fieldName];
    if (value == null) {
      throw FormatException('Missing required field: $fieldName');
    }
    if (value is String) return value;
    throw FormatException(
      'Invalid $fieldName: expected String, got ${value.runtimeType}',
    );
  }

  static double _parseDoubleField(Map<String, dynamic> json, String fieldName) {
    final value = json[fieldName];
    if (value == null) {
      throw FormatException('Missing required field: $fieldName');
    }
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      final parsed = double.tryParse(value);
      if (parsed != null) return parsed;
    }
    throw FormatException(
      'Invalid $fieldName: expected number, got ${value.runtimeType}',
    );
  }

  RestaurantItemEntity toEntity() => this;
}
