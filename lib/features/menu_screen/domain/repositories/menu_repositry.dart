import 'package:ps_digital_task/core/errors/failures.dart';
import 'package:ps_digital_task/features/menu_screen/domain/entities/restaurant_Item_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class MenuRepository {
  Future<Either<Failure, List<RestaurantItemEntity>>> getMenuList();
}
