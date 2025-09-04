part of 'menu_cubit.dart';

sealed class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object?> get props => [];
}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuLoaded extends MenuState {
  final List<RestaurantItemEntity> menuList;

  const MenuLoaded({required this.menuList});

  @override
  List<Object?> get props => [menuList];
}

class MenuError extends MenuState {
  final String message;

  const MenuError({required this.message});

  @override
  List<Object?> get props => [message];
}
