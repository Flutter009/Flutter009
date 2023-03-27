import 'package:flutter/material.dart';
import 'package:practice/filtered_screens/authors.dart';
import 'package:practice/widgets/sort_options.dart';
import 'package:velocity_x/velocity_x.dart';

class Sort extends StatefulWidget {
  const Sort({super.key});

  @override
  State<Sort> createState() => _SortState();
}

class _SortState extends State<Sort> {
  void navigateToFilter(String filter, String filterType) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                FilterScreen(filter: filter, filtertype: filterType)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray600,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HStack([
            VxBox(child: 'Genres'.richText.semiBold.xl.white.make())
                .p16
                .make()
                .darkTheme()
                .expand(),
          ]).backgroundColor(Vx.black),
          VStack([
            SortOption(
                sort: 'Satire', tap: () => navigateToFilter('genre', 'Satire')),
            SortOption(
                sort: 'Horror', tap: () => navigateToFilter('genre', 'Horror')),
            SortOption(
                sort: 'Mystery',
                tap: () => navigateToFilter('genre', 'Mystery'))
          ]),
          5.heightBox,
          HStack([
            VxBox(child: 'Languages'.richText.semiBold.xl.white.make())
                .p16
                .make()
                .darkTheme()
                .expand(),
          ]).backgroundColor(Vx.black),
          5.heightBox,
          VStack([
            SortOption(
                sort: 'English',
                tap: () => navigateToFilter('language', 'English')),
            SortOption(
                sort: 'Hindi', tap: () => navigateToFilter('language', 'Hindi'))
          ]),
        ],
      ).p8(),
    );
  }
}
