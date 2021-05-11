import 'package:adshop/Screens/product_page.dart';
import 'package:adshop/Services/Firebase_services.dart';
import 'package:adshop/Widgets/custom_input.dart';
import 'package:adshop/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Searchtab extends StatelessWidget {
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        SizedBox(
          height: 45.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 45.0,
          ),
          child: CustomInpt(
            hintText: "Search here..",
            onSubmitted: (value) {
              if (value.isNotEmpty) {}
            },
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        Text(
          "Search Results",
          style: Constants.regularHeading,
        ),
        FutureBuilder<QuerySnapshot>(
          future: _firebaseServices.productsRef.orderBy("Type").startAt(['Bernese Mountain Dog']).endAt(['Golden retriever']).get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text("Error: ${snapshot.error}"),
                ),
              );
            }

            //Collected data is ready to be displayed
            if (snapshot.connectionState == ConnectionState.done) {
              //Display the data inside it
              return ListView(
                padding: EdgeInsets.only(
                  top: 100.0,
                  bottom: 12.0,
                ),
                children: snapshot.data.docs.map((document) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductPage(
                                    productId: document.id,
                                  )));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0)),
                        height: 350.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 350.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network(
                                  "${document.data()}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(
                                  20.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Name",
                                      style: Constants.regularHeading,
                                    ),
                                    Text(
                                      "Age: ",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  );
                }).toList(),
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
      ],
    ));
  }
}
