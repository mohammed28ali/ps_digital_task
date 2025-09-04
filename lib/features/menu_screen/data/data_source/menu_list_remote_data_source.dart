import 'dart:developer';

import 'package:ps_digital_task/core/api/api_consumer.dart';
import 'package:ps_digital_task/core/api/end_points.dart';
import 'package:ps_digital_task/core/errors/exceptions.dart';
import 'package:ps_digital_task/features/menu_screen/data/model/restaurant_item_model.dart';

abstract class MenuListRemoteDataSource {
  Future<List<RestaurantItemModel>> getMenuList();
}

class MenuListRemoteDataSourceImpl implements MenuListRemoteDataSource {
  final ApiConsumer apiConsumer;

  const MenuListRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<RestaurantItemModel>> getMenuList() async {
    try {
      final response = await apiConsumer.get(EndPoints.restaurantItems);

      if (response is! List) {
        throw const ServerException('Invalid response format: expected List');
      }

      return response.map((json) {
        if (json is! Map<String, dynamic>) {
          throw const ServerException(
            'Invalid item format: expected Map<String, dynamic>',
          );
        }
        return RestaurantItemModel.fromJson(json);
      }).toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to fetch menu list: ${e.toString()}');
    }
  }
}
