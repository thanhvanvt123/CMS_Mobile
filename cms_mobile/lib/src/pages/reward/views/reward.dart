import 'package:cms_mobile/src/pages/event_detail/controllers/event_detail_controller.dart';
import 'package:cms_mobile/src/util/formatters.dart';
import 'package:cms_mobile/src/widgets/animate_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

class Reward extends GetView<EventDetailController> {
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
            'Phần thưởng',
            textAlign: TextAlign.center,
            style: TextStyle(
                // color: Color(0xff114B5F),
                // fontSize: 25,
                color: Color(0xFF114B5F),
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          margin: EdgeInsets.only(top: 40),
          child: Obx(() {
            final rewards = controller.listReward.value;
            print("===== " + rewards.toString());

            return AnimationLimiter(
              child: GridView.count(
                childAspectRatio: 3 / 4,
                crossAxisCount: 2,
                children: List.generate(
                  rewards.length,
                  (int index) {
                    final reward = rewards[index];

                    return GestureDetector(
                      //onTap: () => controller.gotoProductComboDetails(),
                      child: AnimateWrapper(
                        index: index,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                          child: Card(
                            child: Container(
                              height: 100,
                              width: 100,
                              padding: const EdgeInsets.only(bottom: 60),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            reward.reward!.image ?? ''),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      Formatter.shorten(
                                          reward.reward!.rewardName),
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
                                              reward.reward!.description),
                                        ),
                                        Text(
                                          Formatter.price(reward.reward!.price),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
