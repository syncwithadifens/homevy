import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/theme/styles.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe7e7e7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.chevron_left,
              color: blackColor,
            )),
        actions: <Widget>[
          IconButton(
            icon: const Icon(CupertinoIcons.heart),
            color: blackColor,
            onPressed: () {  }, 
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: <Widget>[
          SizedBox(
          child: Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 270, 0, 0),
                  height: 350,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24)
                    ),
                  ),
                  child: Column(children: <Widget>[
                    Row(
                      children:<Widget>[
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: <Widget>[
                          RichText(
                          text: TextSpan(
                          children: [
                          TextSpan(text: "Chair\n",
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                          TextSpan(text: "Sahaja Chair",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                          ]
                        ),
                      ),
                          ],
                        ),
                      Expanded(child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                          children:[
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(0,3),
                                  ),
                                ]
                              ),
                              child: Icon(CupertinoIcons.minus, size: 15,),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "01",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(0,3),
                                  ),
                                ]
                              ),
                              child: Icon(CupertinoIcons.plus, size: 15,),
                            )
                          ],
                      ))                  
                    ],
                    ),
                  Row(
                    children: [
                      Text("..............................................................................")
                    ],
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Description\n",
                        style: TextStyle(fontSize: 14)
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                      Text("Penjelasan Product",
                        style: TextStyle(fontSize: 14)
                        ),
                      ],
                    )
                    ],
                  )
                  ),
            const Spacer(),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(
              horizontal: 10),
              width: Get.width,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius:
                BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: const Icon(
                    CupertinoIcons.bag_fill,
                  color: Colors.white,),
              ),
                Text(
                  'Add to Cart',
                  style: subtitleStyle.copyWith(
                  color: whiteColor),
              ),
              Text(
                  '150',
                  style: subtitleStyle.copyWith(
                  color: const Color(0xffFCA311)),
              )  
            ],
            ),
            )
                  ]),
                ),
                Padding(
                  padding: 
                  const EdgeInsets.symmetric(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text(
                        "Sahaja Chair",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text:"Height : 810 cm\n",
                              style: TextStyle(fontSize: 14,color: Colors.black)),
                              TextSpan(text:"Width : 420 cm\n",
                              style: TextStyle(fontSize: 14,color: Colors.black)),
                              TextSpan(text:"Depth : 500 cm\n",
                              style: TextStyle(fontSize: 14,color: Colors.black)),
                              TextSpan(text:"Seat height : 47,7 cm\n",
                              style: TextStyle(fontSize: 14,color: Colors.black)),
                              TextSpan(text:"Weight : 3,5 kg",
                              style: TextStyle(fontSize: 14,color: Colors.black)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Image.asset('assets/chair.png', height: 230, width: 230),
                        )
                      ],
                    )
                    ],
                  ),
                )
              ],
            ),
          )
         ],)),
    );
  }
}

