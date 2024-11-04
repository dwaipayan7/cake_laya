import 'package:cake_laya/feature/bloc/cake_bloc.dart';
import 'package:cake_laya/feature/repository/repository.dart';
import 'package:cake_laya/feature/screens/manage_shop.dart';
import 'package:cake_laya/feature/screens/promotions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CakeBloc(repository: Repository())..add(FetchInitialEvent()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cake Laya',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ManageShopScreen(),
      ),
    );
  }
}
