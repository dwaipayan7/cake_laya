import 'package:bloc/bloc.dart';
import 'package:cake_laya/feature/models/shop_model.dart';
import 'package:meta/meta.dart';

part 'cake_event.dart';
part 'cake_state.dart';

class CakeBloc extends Bloc<CakeEvent, CakeState> {
  CakeBloc() : super(CakeInitial()) {



  }
}
