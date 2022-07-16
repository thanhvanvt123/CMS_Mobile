import 'package:carousel_slider/carousel_slider.dart';
import 'package:cms_mobile/src/pages/home/controllers/home_controller.dart';
import 'package:cms_mobile/src/widgets/custom_bottom_bar.dart';
import 'package:cms_mobile/src/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage1 extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  children: [
                    // Obx(() {
                    //   return Container(
                    //     height: controller.showSlider.value ? 340 : 140,
                    //     width: screenSize.width,
                    //     color: Colors.white,
                    //   );
                    // }),
                    Container(
                      // margin: const EdgeInsets.only(top: 202),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                      height: 150,
                      
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Thương hiệu nổi bật',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Container(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Xem thêm >>',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Obx(() {
                              var listEvent = controller.listEvents;
                              int eventCount = listEvent.length;
                                  //listEvent.length > 9 ? 9 : listEvent.length;

                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Wrap(
                                      spacing: 18,
                                      children:
                                          List.generate(eventCount, (index) {
                                        final event = listEvent[index];
                                        return GestureDetector(
                                          onTap: () => controller
                                              .goToDetail(event.eventId),
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    right: 5, bottom: 10),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6, vertical: 2),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black12),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Column(
                                                  children: [
                                                    // Container(
                                                    //   width: 60,
                                                    //   height: 60,
                                                    //   child: Image.network(
                                                    //     store.imageUrl ?? '',
                                                    //     fit: BoxFit.contain,
                                                    //   ),
                                                    // ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 10),
                                                      width: 100,
                                                      height: 35,
                                                      child: Text(
                                                        event.eventName ?? '',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 55),
                child:
                    const HomeSearchBar(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottombar(),
      );
    });
  }
}