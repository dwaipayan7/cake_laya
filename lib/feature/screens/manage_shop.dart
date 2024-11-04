import 'package:flutter/material.dart';

class ManageShopScreen extends StatefulWidget {
  const ManageShopScreen({super.key});

  @override
  State<ManageShopScreen> createState() => _ManageShopScreenState();
}

class _ManageShopScreenState extends State<ManageShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MANAGE SHOP"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shop Name:", style: TextStyle(fontSize: 19)),
            SizedBox(height: 5),
            Text("Hub Quality Bakers",
                style: TextStyle(color: Colors.grey, fontSize: 17)),
            SizedBox(height: 10),
            Text("FSSAI License Number:", style: TextStyle(fontSize: 19)),
            SizedBox(height: 5),
            Text("873687HDHJH122",
                style: TextStyle(color: Colors.grey, fontSize: 17)),
            SizedBox(height: 10),
            Text("Commission %:", style: TextStyle(fontSize: 19)),
            SizedBox(height: 5),
            Text("10", style: TextStyle(color: Colors.grey, fontSize: 17)),
            SizedBox(height: 20),
            Text("Add Shop Display Photo (Max 1):",
                style: TextStyle(fontSize: 19)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text("Add Image",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize:
                    Size(double.infinity, 45), // Full-width, custom height
              ),
            ),
            SizedBox(height: 10),
            // Packaging & Delivery Button

            // GestureDetector(
            //   onTap: (){},
            //   child: Container(
            //     padding: EdgeInsets.symmetric(vertical: 16),
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.red),
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(left: 105),
            //           child: Text("Packaging & Delivery",style: TextStyle(color: Colors.red, fontSize: 16),),
            //         ),
            //         Icon(Icons.arrow_forward_ios)
            //       ],
            //     ),
            //   ),
            // ),

            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(double.infinity, 45),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Text(
                        "Packaging & Delivery",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ],
                )),
            SizedBox(height: 10),
            // Promotions Button
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(double.infinity, 45),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 125),
                      child: Text(
                        "Promotions",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ],
                )),

            SizedBox(height: 30,),

            Text("Note:",style: TextStyle(
               fontSize: 19, fontWeight: FontWeight.bold
            ),),
            Padding(padding: EdgeInsets.all(14),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text("1. Shop will not be visible to customers if you have no products added!", style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 5,),
                Text("2. We recommend adding products at menu price to avoid items being delisted in the future!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),)

          ],
        ),
      ),
    );
  }
}
