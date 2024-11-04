import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cake_laya/feature/models/shop_model.dart';
import 'package:cake_laya/feature/repository/repository.dart';
import 'package:meta/meta.dart';

part 'cake_event.dart';
part 'cake_state.dart';

class CakeBloc extends Bloc<CakeEvent, CakeState> {
  final Repository repository;

  CakeBloc(this.repository) : super(CakeInitial()) {

  on<FetchInitialEvent>(fetchInitialEvent);

  on<NavigateToPromotion>(navigateToPromotion);
  on<NavigateToPackage>(navigateToPackage);

  }

  FutureOr<void> navigateToPackage(NavigateToPackage event, Emitter<CakeState> emit) {

    print("Navigate to Package");
    emit(NavigateToPackageDeliveryActionState());

  }

  FutureOr<void> navigateToPromotion(NavigateToPromotion event, Emitter<CakeState> emit) {

    print("Navigate to Promotion");
    emit(NavigateToPromotionActionState());

  }

  Future<void> fetchInitialEvent(
      FetchInitialEvent event,
      Emitter<CakeState> emit) async{

    emit(CakeLoadingState());

    await Future.delayed(Duration(seconds: 2));

    if(event is CakeLoadingState){
      emit(CakeLoadingState());
    }
    try{
      
      final shop = await repository.fetchShopData();
      emit(CakeLoadedSuccessState(shop: shop));

    }catch(e){
      emit(CakeErrorState(message: e.toString()));
    }

  }

}
