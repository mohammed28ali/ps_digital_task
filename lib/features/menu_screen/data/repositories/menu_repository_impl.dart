import 'dart:developer';

import 'package:ps_digital_task/core/errors/exceptions.dart';
import 'package:ps_digital_task/core/errors/failures.dart';
import 'package:ps_digital_task/core/network/netwok_info.dart';
import 'package:ps_digital_task/features/menu_screen/data/data_source/menu_list_remote_data_source.dart';
import 'package:ps_digital_task/features/menu_screen/domain/entities/restaurant_Item_entity.dart';
import 'package:ps_digital_task/features/menu_screen/domain/repositories/menu_repositry.dart';
import 'package:fpdart/fpdart.dart';

class MenuRepositoryImpl implements MenuRepository {
  final MenuListRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const MenuRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<RestaurantItemEntity>>> getMenuList() async {
    if (!(await networkInfo.isConnected)) {
      return Left(NetworkFailure(message: 'No internet connection'));
    }

    try {
      final models = await remoteDataSource.getMenuList();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    } on FormatException catch (e) {
      return Left(ServerFailure(message: 'Data parsing error: ${e.message}'));
    } catch (e) {
      return Left(ServerFailure(message: 'Unexpected error: ${e.toString()}'));
    }
  }
}
