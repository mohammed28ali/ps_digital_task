import 'package:fpdart/src/either.dart';
import 'package:ps_digital_task/core/errors/failures.dart';
import 'package:ps_digital_task/core/usecases/usecase.dart';
import 'package:ps_digital_task/features/menu_screen/domain/repositories/menu_repositry.dart';
import 'package:ps_digital_task/features/menu_screen/domain/entities/restaurant_Item_entity.dart';

class GetMenuListUseCase
    implements UseCase<List<RestaurantItemEntity>, NoParams> {
  final MenuRepository repository;

  const GetMenuListUseCase({required this.repository});

  @override
  Future<Either<Failure, List<RestaurantItemEntity>>> call(
    NoParams params,
  ) async {
    return await repository.getMenuList();
  }
}
