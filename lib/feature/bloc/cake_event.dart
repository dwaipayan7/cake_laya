part of 'cake_bloc.dart';

@immutable
sealed class CakeEvent {}

class FetchInitialEvent extends CakeEvent{}

class NavigateTo extends CakeEvent{}
