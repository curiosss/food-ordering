import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rokus/core/utils/dimens.dart';
import 'package:rokus/features/home/presentation/controller/home_page_controller.dart';
import 'package:rokus/features/home/presentation/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageCtrl homePageCtrl = HomePageCtrl();
  @override
  void initState() {
    Get.put<HomePageCtrl>(homePageCtrl);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<HomePageCtrl>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   children: [
    //     const HomeDrawer(),
    //     Expanded(
    //       child: Scaffold(
    //         appBar: AppBar(
    //           title: const Text("Homies"),
    //         ),
    //       ),
    //     ),
    //   ],
    // );

    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        title: const Text("Homies"),
      ),
      body: Obx(() {
        if (homePageCtrl.isloading.value) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.gMargin,
            vertical: Dimens.hMargin,
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            // mainAxisExtent: 240,
            childAspectRatio: 1.4,
            crossAxisSpacing: Dimens.sMargin,
            mainAxisSpacing: Dimens.sMargin,
          ),
          itemCount: homePageCtrl.departments.length,
          itemBuilder: (context, index) {
            var e = homePageCtrl.departments[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.gBorder),
              ),
              // margin: const EdgeInsets.symmetric(vertical: Dimens.hMargin),
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(Dimens.gBorder),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: e.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Dimens.hMargin,
                      horizontal: Dimens.sMargin,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            e.name,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          e.count.toString(),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
