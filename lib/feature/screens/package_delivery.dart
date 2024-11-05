import 'package:cake_laya/feature/widget/InputValues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cake_bloc.dart';
import '../models/shop_model.dart';

class PackageDelivery extends StatefulWidget {
  const PackageDelivery({super.key});

  @override
  State<PackageDelivery> createState() => _PackageDeliveryState();
}

class _PackageDeliveryState extends State<PackageDelivery> {
  TextEditingController deliveryTimeController = TextEditingController();
  TextEditingController deliveryRadiusController = TextEditingController();
  TextEditingController freeDeliveryController = TextEditingController();
  TextEditingController orderValueController = TextEditingController();
  TextEditingController orderValueLowerController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    deliveryTimeController.dispose();
    deliveryRadiusController.dispose();
    freeDeliveryController.dispose();
    orderValueController.dispose();
    orderValueLowerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("PACKAGING & DELIVERY"),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.grey,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<CakeBloc, CakeState>(
  listener: (context, state) {
     if(state is CakeSaveSuccessState){
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text("Delivery Data Saved"))
       );
     }
     if(state is CakeErrorState){
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text(state.message))
       );
     }
  },
  builder: (context, state) {
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Delivery Time:",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: height * 0.01),
                InputValues(text: "Enter Value", text2: "Minutes", controller: deliveryTimeController,),
      
                SizedBox(height: height * 0.02),
                const Text(
                  "Delivery Radius:",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: height * 0.01),
                InputValues(text: "Enter Value", text2: "KM", controller: deliveryRadiusController,),
      
                SizedBox(height: height * 0.02),
                const Text(
                  "Free Delivery Radius:",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: height * 0.01),
                InputValues(text: "Enter Value", text2: "Minutes", controller: freeDeliveryController,),
      
                SizedBox(height: height * 0.02),
                const Text(
                  "Packaging & Delivery Fees:",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: height * 0.01),
                const Text(
                  "Order Value(OV) Wise:",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: height * 0.01),
                InputValues(text: "OV > ₹500", text2: "0", controller: orderValueController,),
      
                SizedBox(height: height * 0.02),
                const Text(
                  "Order Value(OV) Wise:",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: height * 0.01),
                InputValues(text: "OV < ₹500", text2: "Enter Price in ₹",controller: orderValueLowerController,),
      
                SizedBox(height: height * 0.02),
                const Text(
                  "Note:",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "1. Minimum Value Allowed: ₹0",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "2. Maximum Value Allowed: ₹100",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
      
                SizedBox(height: height * 0.099),
                ElevatedButton(
                  onPressed: () {

                    final deliveryData = DeliverySettings(
                      deliveryTime: int.tryParse(deliveryTimeController.text) ?? 0,
                      deliveryRadius: int.tryParse(deliveryRadiusController.text) ?? 0,
                      freeDeliveryRadius: int.tryParse(freeDeliveryController.text) ?? 0,
                      feesAbove500: int.tryParse(orderValueController.text) ?? 0,
                      feesBelow500: int.tryParse(orderValueLowerController.text) ?? 0,
                    );

                    context.read<CakeBloc>()
                        .add(SaveDeliveryDataEvent(deliveryData: deliveryData));
      
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size(double.infinity, height * 0.056),
                  ),
                  child: const Text("Save", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ),
        );
  },
),
    );
  }
}
