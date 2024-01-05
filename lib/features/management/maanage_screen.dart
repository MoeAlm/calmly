import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/constant.dart';

class ManageScreen extends StatelessWidget {
  const ManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ادارة مهامك'),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'مشاريعك',
                style: theme.textTheme.headlineMedium!.copyWith(fontSize: 22),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('عرض الكل'),
              )
            ],
          ).pSymmetric(v: 8, h: 12),
          SizedBox(
            height: size.height * 0.34,
            width: double.infinity,
            child: CarouselSlider.builder(
              itemCount: 4,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Container(
                  decoration: BoxDecoration(
                    color: itemIndex == 1
                        ? theme.primaryColor
                        : theme.primaryColor.swatch.shade50,
                    borderRadius: BorderRadius.circular(kRadius * 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child:
                            Icon(CupertinoIcons.book, color: theme.primaryColor)
                                .p(15),
                      ),
                      Text(
                        'قراءة 10 كتب',
                        style: theme.textTheme.headlineMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: itemIndex == 1
                                ? Colors.white
                                : theme.primaryColor),
                      ),
                      Text(
                        'قراءة 10 كتب في مجال جديد \n وتعلم مهارة جديدة في نفس المجال',
                        style: theme.textTheme.headlineMedium!.copyWith(
                            fontSize: 18,
                            color: itemIndex == 1
                                ? Colors.white
                                : theme.primaryColor),
                      ),
                    ],
                  ).p(16),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                reverse: true,
                enlargeCenterPage: true,
                viewportFraction: 0.55,
                aspectRatio: 1.5,
                initialPage: 1,
              ),
            ),
          ).pOnly(bottom: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'مهامك',
                style: theme.textTheme.headlineMedium!.copyWith(fontSize: 22),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('عرض الكل'),
              )
            ],
          ).pSymmetric(v: 8, h: 12),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: size.height * 0.1,
                  child: Card(
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              value: index == 1,
                              onChanged: (value) {}),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'تعديل الالوان في تطبيق المطاعم',
                              style: theme.textTheme.labelLarge!
                                  .copyWith(color: theme.primaryColor.swatch.shade400),
                            ),
                            Text(
                              'تعديل الالوان في تطبيق المطاعم',
                              style: theme.textTheme.labelLarge!
                                  .copyWith(color: theme.primaryColor.swatch.shade400),
                            ),
                          ],
                        ).px8()
                      ],
                    ),
                  ).pSymmetric(h: 12),
                );
              })
        ],
      ),
    );
  }
}
