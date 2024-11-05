import 'dart:io';
import 'package:cake_laya/feature/bloc/cake_bloc.dart';
import 'package:cake_laya/feature/screens/package_delivery.dart';
import 'package:cake_laya/feature/screens/promotions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../models/shop_model.dart';

class ManageShopScreen extends StatefulWidget {
  const ManageShopScreen({super.key});

  @override
  State<ManageShopScreen> createState() => _ManageShopScreenState();
}

class _ManageShopScreenState extends State<ManageShopScreen> {
  File? image;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("MANAGE SHOP"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
        ),
      ),
      body: BlocConsumer<CakeBloc, CakeState>(
        listenWhen: (previous, current) => current is CakeActionState,
        buildWhen: (previous, current) => current is! CakeActionState,
        listener: (context, state) {
          if (state is NavigateToPromotionActionState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PromotionsScreen()),
            );
          } else if (state is NavigateToPackageDeliveryActionState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PackageDelivery()),
            );
          }
        },
        builder: (context, state) {
          if (state is CakeLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (state is CakeLoadedSuccessState) {
            final shops = state.shop as List<ShopModel>;

            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: shops.length,
              itemBuilder: (context, index) {
                final shop = shops[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Shop Name:", style: TextStyle(fontSize: 19)),
                    const SizedBox(height: 5),
                    Text(
                      shop.shopName ?? 'N/A',
                      style: const TextStyle(color: Colors.grey, fontSize: 17),
                    ),
                    const SizedBox(height: 10),
                    const Text("FSSAI License Number:", style: TextStyle(fontSize: 19)),
                    const SizedBox(height: 5),
                    Text(
                      shop.fssaiLicense ?? 'N/A',
                      style: const TextStyle(color: Colors.grey, fontSize: 17),
                    ),
                    const SizedBox(height: 10),
                    const Text("Commission %:", style: TextStyle(fontSize: 19)),
                    const SizedBox(height: 5),
                    Text(
                      "${shop.commission}",
                      style: const TextStyle(color: Colors.grey, fontSize: 17),
                    ),
                    const SizedBox(height: 20),
                    const Text("Add Shop Display Photo (Max 1):", style: TextStyle(fontSize: 19)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: pickImage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: const Size(double.infinity, 45),
                      ),
                      child: const Text("Add Image", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CakeBloc>().add(NavigateToPackage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: const Size(double.infinity, 45),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 90),
                            child: Text(
                              "Packaging & Delivery",
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CakeBloc>().add(NavigateToPromotion());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: const Size(double.infinity, 45),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 125),
                            child: Text(
                              "Promotions",
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Note:",
                      style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(14),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "1. Shop will not be visible to customers if you have no products added!",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "2. We recommend adding products at menu price to avoid items being delisted in the future!",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 60, thickness: 0.5),
                  ],
                );
              },
            );
          }

          if (state is CakeErrorState) {
            return Center(
              child: Text(state.message, style: const TextStyle(color: Colors.red, fontSize: 18)),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
