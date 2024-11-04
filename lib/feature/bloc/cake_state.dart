part of 'cake_bloc.dart';

@immutable
sealed class CakeState {}

final class CakeInitial extends CakeState {}

abstract class CakeActionState extends CakeState{}

class CakeLoadingState extends CakeState{}

class CakeLoadedSuccessState extends CakeState{

  final List<ShopModel> shop;

  CakeLoadedSuccessState({required this.shop});

}

class CakeErrorState extends CakeState{

  final String message;

  CakeErrorState({required this.message});

}

class NavigateToPackageDeliveryActionState extends CakeActionState{}

class NavigateToPromotionActionState extends CakeActionState{}
