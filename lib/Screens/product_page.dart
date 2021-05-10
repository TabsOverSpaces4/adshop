import 'package:adshop/Widgets/custom_action_bar.dart';
import 'package:adshop/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  ProductPage({this.productId});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("Products");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        FutureBuilder(
          future: _productsRef.doc(widget.productId).get(),
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
                  Container(
                    height: 400.0,
                    child: PageView(
                      children: [
                        for(var i=0; i < imageList.length; i++)
                        Container(
                          child: Image.network(
                            "${imageList[i]}"
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
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
                      "${documentData['Description']}" ?? "Description Not given",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  

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
        )
      ],
    ));
  }
}
