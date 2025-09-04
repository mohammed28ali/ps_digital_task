
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ps_digital_task/core/errors/failures.dart';
import 'package:ps_digital_task/core/usecases/usecase.dart';
import 'package:ps_digital_task/features/menu_screen/domain/entities/restaurant_Item_entity.dart';
import 'package:ps_digital_task/features/menu_screen/domain/usecases/get_menu_list_use_case.dart';
part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final GetMenuListUseCase getMenuListUseCase;

  MenuCubit({required this.getMenuListUseCase}) : super(MenuInitial());

  Future<void> fetchMenuList() async {
    emit(MenuLoading());

    final Either<Failure, List<RestaurantItemEntity>> result =
        await getMenuListUseCase(NoParams());

    result.fold(
      (failure) => emit(MenuError(message: _mapFailureToMessage(failure))),
      (menuList) => emit(MenuLoaded(menuList: menuList)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.message;
  }
}
