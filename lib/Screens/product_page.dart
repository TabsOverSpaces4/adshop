import 'package:adshop/Services/Firebase_services.dart';
import 'package:adshop/Widgets/custom_action_bar.dart';
import 'package:adshop/Widgets/image_swiper.dart';
import 'package:adshop/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  ProductPage({this.productId});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  FirebaseServices _firebaseServices = FirebaseServices();

  

  Future _addToCart() {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Contacted")
        .doc(widget.productId)
        .set({"Name": 1});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        FutureBuilder(
          future: _firebaseServices.productsRef.doc(widget.productId).get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text("Error: ${snapshot.error}"),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              // Firebase document data map
              Map<String, dynamic> documentData = snapshot.data.data();

              //List of the images
              List imageList = documentData['Images'];

              return ListView(
                padding: EdgeInsets.all(0),
                children: [
                  ImageSwipe(
                    imageList: imageList,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24.0,
                      right: 24.0,
                      left: 24.0,
                      bottom: 4.0,
                    ),
                    child: Text(
                      "${documentData['Type']}" ?? "Type Not Mentioned",
                      style: Constants.boldHeading,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                    child: Text(
                      "${documentData['Age']}" ?? "Age Not Mentioned",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                    child: Text(
                      "${documentData['Gender']}" ?? "Gender Not mentioned",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                    child: Text(
                      "${documentData['Description']}" ??
                          "Description Not given",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                    child: Text(
                      "Given Name :  ${documentData['Name']}" ??
                          "Name Not mentioned",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 65.0,
                            height: 65.0,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange[100],
                                borderRadius: BorderRadius.circular(12.0)),
                            alignment: Alignment.center,
                            child: Image(
                              image:
                                  AssetImage("lib/Assets/images/tab_saved.png"),
                              height: 22.0,
                            )),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await _addToCart();
                              print("${documentData['Name']} was contacted");
                            },
                            child: Container(
                              height: 65.0,
                              margin: EdgeInsets.only(
                                left: 16.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Contact ${documentData['Name']}" ?? "Us",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }

            //loading state
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
        CustomActionBar(
          hasTitle: false,
          hasBackArrow: true,
          hasBackground: false,
        )
      ],
    ));
  }
}
