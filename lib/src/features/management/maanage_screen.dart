import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/components/text_field.dart';
import '../../core/constant.dart';
import '../../core/models/tasks_models.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  List<Task> tasks = [
    Task(
      title: 'اتمام المهام المؤجلة',
      description: 'التسويف عادة سيئة ويجب التخلص منها',
    ),
    Task(
      title: 'اتمام المهام المؤجلة',
      description: 'التسويف عادة سيئة ويجب التخلص منها',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.sizeOf(context);
    var textScale = MediaQuery.textScalerOf(context);
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
                            fontSize: textScale.scale(20),
                            fontWeight: FontWeight.bold,
                            color: itemIndex == 1
                                ? Colors.white
                                : theme.primaryColor),
                      ),
                      Text(
                        'قراءة 10 كتب في مجال جديد \n وتعلم مهارة جديدة في نفس المجال',
                        style: theme.textTheme.headlineMedium!.copyWith(
                            fontSize: textScale.scale(18),
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
              itemCount: tasks.length,
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
                              value: tasks[index].isCompleted,
                              onChanged: (value) {
                                setState(() {
                                  tasks[index].isCompleted = value!;
                                });
                              }),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tasks[index].title,
                              style: theme.textTheme.labelLarge!.copyWith(
                                  color: theme.primaryColor.swatch.shade400,
                                  fontWeight: FontWeight.w700,
                                  decoration: tasks[index].isCompleted == false
                                      ? TextDecoration.none
                                      : TextDecoration.lineThrough,
                                  decorationColor: Colors.grey,
                                  decorationThickness: 3),
                            ),
                            Text(
                              tasks[index].description,
                              style: theme.textTheme.labelLarge!.copyWith(
                                  color: theme.primaryColor.swatch.shade400,
                                  decoration: tasks[index].isCompleted == false
                                      ? TextDecoration.none
                                      : TextDecoration.lineThrough,
                                  decorationColor: Colors.grey,
                              decorationThickness: 3),
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
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: size.height * 0.4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          defaultTextField(hintText: 'اكتب مهتمك'),
                          defaultTextField(
                              hintText: 'تفاصيل المهمة', maxLines: 4),
                          SizedBox(
                            width: size.width * 0.5,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: theme.primaryColor,
                              ),
                              child: Text(
                                'اضافة المهمة',
                                style: theme.textTheme.titleLarge!
                                    .copyWith(color: theme.primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
