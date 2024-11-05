part of 'cake_bloc.dart';

@immutable
sealed class CakeEvent {}

class FetchInitialEvent extends CakeEvent{}

class SaveDeliveryDataEvent extends CakeEvent{
  final DeliverySettings deliveryData;

  SaveDeliveryDataEvent({required this.deliveryData});
}

class NavigateToPackage extends CakeEvent{}

class NavigateToPromotion extends CakeEvent{}


