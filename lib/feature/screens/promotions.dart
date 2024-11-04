import 'package:flutter/material.dart';

class PromotionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROMOTIONS"),
        centerTitle: true,
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey,)
        ),
        iconTheme: IconThemeData(
            color: Colors.grey
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Add Image",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("You Have Added No Banners!"),
          ],
        ),
      ),
    );
  }
}
