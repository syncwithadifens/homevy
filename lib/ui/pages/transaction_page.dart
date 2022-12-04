import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/controllers/transaction_controller.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/pages/rate_product_page.dart';
import 'package:homevy/ui/widgets/custom_bottom_navigation.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    CustomBottomNavigationBar.currentId = 2;
    final transactionController = Get.put(TransactionController());
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: const CustomFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
          child: DefaultTabController(
        length: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  'My Order',
                  style: subtitleStyle.copyWith(
                      fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Container(
              height: 30,
              margin: const EdgeInsets.only(top: 20),
              child: TabBar(
                  padding: const EdgeInsets.only(left: 10),
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                  tabs: [
                    Tab(
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Unpaid",
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Delivering",
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Delivered",
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: redColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Cancelled"),
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: Obx(() => transactionController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : TabBarView(children: [
                      transactionController.transactionList!.data!.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset('assets/unpaid.json',
                                      repeat: false, width: 300, height: 300),
                                  Text(
                                    'Transaction is empty',
                                    style: titleStyle,
                                  )
                                ],
                              ),
                            )
                          : RefreshIndicator(
                              onRefresh: () =>
                                  transactionController.getTransaction(),
                              child: ListView.builder(
                                itemCount: transactionController
                                    .transactionList!.data!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(
                                        top: 15, left: 20, right: 20),
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: greyColor,
                                              offset: const Offset(0, 5),
                                              blurRadius: 10,
                                              spreadRadius: 1)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Information:',
                                                style: subtitleStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                DateFormat('d MMM yyyy').format(
                                                    transactionController
                                                        .transactionList!
                                                        .data![index]
                                                        .createdAt),
                                                style:
                                                    TextStyle(color: greyColor),
                                              ),
                                            ],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 3),
                                            child: Text('Address:'),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  transactionController
                                                      .transactionList!
                                                      .data![index]
                                                      .alamat,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text('Total Amount:',
                                                        style: TextStyle(
                                                            color: greyColor)),
                                                    Text(
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: 'Rp',
                                                              decimalDigits: 2)
                                                          .format(
                                                              transactionController
                                                                  .transactionList!
                                                                  .data![index]
                                                                  .total),
                                                      style: subtitleStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () => Get.to(
                                                      () => RateProductPage(
                                                            transactionData:
                                                                transactionController
                                                                    .transactionList!
                                                                    .data![index],
                                                          )),
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                            top: 5,
                                                            bottom: 5),
                                                    decoration: BoxDecoration(
                                                        color: secondaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Text(
                                                      'Rate ⭐',
                                                      style: subtitleStyle
                                                          .copyWith(
                                                              fontSize: 14,
                                                              color: whiteColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  transactionController
                                                          .transactionList!
                                                          .data![index]
                                                          .status
                                                          .capitalizeFirst ??
                                                      '',
                                                  style: subtitleStyle.copyWith(
                                                      color: redColor,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/delivery.json',
                                repeat: false, width: 300, height: 300),
                            Text(
                              'Item is Delivering',
                              style: titleStyle,
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/delivered.json',
                                repeat: false, width: 300, height: 300),
                            Text(
                              'Item Delivered',
                              style: titleStyle,
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/cancel.json',
                                repeat: false, width: 300, height: 300),
                            Text(
                              'Transaction Cancelled',
                              style: titleStyle,
                            )
                          ],
                        ),
                      )
                    ])),
            )
          ],
        ),
      )),
    );
  }
}
