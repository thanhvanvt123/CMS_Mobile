import 'package:cms_mobile/src/pages/event_detail/controllers/event_detail_controller.dart';
import 'package:cms_mobile/src/util/formatters.dart';
import 'package:cms_mobile/src/widgets/animate_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

class Budget extends GetView<EventDetailController> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // foregroundColor: Color(0xFF0C9869).withOpacity(0.05),
          centerTitle: true,
          title: Text(
            'Chi phí',
            textAlign: TextAlign.center,
            style: TextStyle(
                // color: Color(0xff114B5F),
                color: Color(0xFF114B5F),
                // fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          margin: EdgeInsets.only(top: 40),
          child: Obx(() {
            final budgets = controller.listBudget.value;
            return AnimationLimiter(
              child: GridView.count(
                childAspectRatio: 4 / 4,
                crossAxisCount: 2,
                children: List.generate(
                  budgets.length,
                  (int index) {
                    final budget = budgets[index];

                    return GestureDetector(
                      //onTap: () => controller.gotoProductComboDetails(),
                      child: AnimateWrapper(
                        index: index,
                        child: Container(
                          // height: screenSize.height * 0.8,
                          //     width: screenSize.width * 0.5,
                          margin:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                          child: Card(
                            child: Container(
                              height: screenSize.height * 0.7,
                              width: screenSize.width * 0.5,
                              // padding: const EdgeInsets.only(bottom: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ListTile(
                                    title: Text(
                                      Formatter.shorten(
                                          budget.budget!.budgetName),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Formatter.shorten(
                                              budget.budget!.description),
                                        ),
                                        Text(
                                          Formatter.price(budget.price),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    // width: screenSize.width * 0.5,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          // reward.reward!.image ?? ''),
                                          "https://luanvanviet.com/wp-content/uploads/2020/11/hinh-anh-chi-phi-san-xuat-la-gi-4.jpg",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
