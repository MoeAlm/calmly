import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/constant.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor.swatch.shade50,
      appBar: AppBar(
        backgroundColor: theme.primaryColor.swatch.shade50,
        title: const Text('المقالات'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SearchBar(
            elevation: const WidgetStatePropertyAll(0),
            backgroundColor:
                WidgetStatePropertyAll(theme.primaryColor.swatch.shade100),
            hintText: 'قم بالبحث من هنا',
            trailing: const [Icon(IconlyLight.search)],
          ).pSymmetric(v: 20, h: 24),
          Container(
            height: size.height * 0.8,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(kRadius),
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'مختارات لأجلك',
                      style: theme.textTheme.headlineSmall!.copyWith(
                          color: theme.primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        IconlyBold.filter,
                      ),
                      style: IconButton.styleFrom(
                        side: const BorderSide(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(kRadius * 0.5),
                        ),
                      ),
                    )
                  ],
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: theme.primaryColor.swatch.shade50,
                        borderRadius: BorderRadius.circular(kRadius),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.18,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: size.width * 0.5,
                                  child: Text(
                                    'الذكاء الاصطناعي: الصديق ام العدو؟',
                                    style: theme.textTheme.headlineSmall!
                                        .copyWith(
                                            color: theme.primaryColor,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: size.width * 0.4,
                                  child: Row(
                                    children: [
                                      Text(
                                        'محمد',
                                        style: theme.textTheme.labelLarge!
                                            .copyWith(
                                                color: theme.primaryColor.swatch
                                                    .shade600,
                                                fontWeight: FontWeight.w700),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'قبل دقيقتين',
                                        style: theme.textTheme.labelLarge!
                                            .copyWith(
                                                color: theme.primaryColor.swatch
                                                    .shade300),
                                      ),
                                      const Spacer(
                                        flex: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ).pSymmetric(v: 12, h: 12),
                          ),
                          Container(
                            width: size.width * 0.27,
                            height: size.height * 0.16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kRadius),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/blog.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ).p(12),
                        ],
                      ),
                    ).py(8);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                )
              ],
            ).px12(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
