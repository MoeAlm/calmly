import 'package:calmly/core/models/podcast_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.sizeOf(context);
    var textScale = MediaQuery.textScalerOf(context);
    List category = [
      'الكل',
      'تطوير الذات',
      'ريادة الاعمال',
      'التصميم الابداعي',
      'البرمجة',
      'علم النفس',
    ];
    List<Podcast> podcasts = [
      Podcast(image: 'assets/images/coding.png', title: 'التفكير البرمجي'),
      Podcast(image: 'assets/images/stress.png', title: 'ادارة الازمات'),
      Podcast(image: 'assets/images/thinking.png', title: 'ايجاد الحلول'),
      Podcast(image: 'assets/images/coding.png', title: 'التفكير البرمجي'),
    ];
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        shrinkWrap: true,
        children: [
          Text(
            'اهلا, محمد!',
            style: theme.textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w500, fontSize: textScale.scale(22)),
          ).px(12),
          Text(
            'هل انت مستعد للتغيير؟',
            style: theme.textTheme.headlineMedium!.copyWith(
                fontSize: textScale.scale(24), fontWeight: FontWeight.w600),
          ).px(12),
          SizedBox(
            height: size.height * 0.05,
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedValue = index;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          // border: Border.all(),
                          color: index == selectedValue
                              ? theme.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        category[index],
                        style: theme.textTheme.titleLarge!.copyWith(
                            color: index == selectedValue
                                ? Colors.white
                                : theme.primaryColor.swatch.shade400,
                            fontSize: textScale.scale(16),
                            fontWeight: FontWeight.w600),
                      ).p(10),
                    ).pSymmetric(h: 8),
                  );
                }),
          ).py12(),
          SizedBox(
            height: size.height * 0.2,
            width: double.infinity,
            child: CarouselSlider.builder(
              itemCount: 2,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: theme.primaryColor),
                    borderRadius: BorderRadius.circular(kRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'القيادة وريادة الاعمال: \n النقطة الفاصلة لنجاح مشروعك',
                        style: theme.textTheme.headlineMedium!
                            .copyWith(fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/business.png',
                            width: size.width * 0.2,
                          ),
                          FloatingActionButton(
                            elevation: 0,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(kRadius * 2)),
                            child: const Icon(Icons.play_arrow),
                          )
                        ],
                      )
                    ],
                  ).p(16),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                reverse: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                initialPage: 2,
              ),
            ),
          ).pOnly(bottom: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الرائج الان',
                style: theme.textTheme.headlineMedium!
                    .copyWith(fontSize: textScale.scale(22)),
              ),
              TextButton(onPressed: () {}, child: const Text('عرض الكل')),
            ],
          ).pSymmetric(v: 8, h: 12),
          SizedBox(
            height: size.height * 0.2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: podcasts.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: index == 0
                              ? Colors.transparent
                              : theme.primaryColor),
                      color:
                          index == 0 ? theme.primaryColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(kRadius),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(kRadius),
                            image: DecorationImage(
                                image: AssetImage(podcasts[index].image),
                                fit: BoxFit.contain),
                          ),
                          height: size.height * 0.1,
                        ),
                        const Spacer(),
                        Text(
                          podcasts[index].title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge!.copyWith(
                              color: index == 0
                                  ? Colors.white
                                  : theme.primaryColor,
                              fontSize: 17),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ).p(10),
                  ).px12();
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'اخر التحديثات',
                style: theme.textTheme.headlineMedium!
                    .copyWith(fontSize: textScale.scale(22)),
              ),
              TextButton(onPressed: () {}, child: const Text('عرض الكل')),
            ],
          ).pSymmetric(v: 8, h: 12),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius),
                      border: Border.all()),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: theme.primaryColor,
                        child: const Text('UI'),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تصميم الواجهات',
                            style: theme.textTheme.headlineSmall!
                                .copyWith(color: theme.primaryColor),
                          ),
                          Text(
                            'التصميم الابداعي',
                            style: theme.textTheme.headlineSmall!.copyWith(
                                color: theme.primaryColor.swatch.shade400,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      const Spacer(flex: 4),
                    ],
                  ).pSymmetric(v: 8, h: 12),
                ).pSymmetric(v: 8, h: 12);
              })
        ],
      ),
    );
  }
}
