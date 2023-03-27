import 'package:flutter/material.dart';
import 'package:practice/filtered_screens/authors.dart';
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
        children: [
          HStack([
            VxBox(child: 'Sort by genre'.richText.semiBold.xl.white.make())
                .p16
                .make()
                .glassMorphic()
                .darkTheme()
                .p4()
                .expand(),
          ]),
          VStack([
            InkWell(
              onTap: () => navigateToFilter('genre', 'Satire'),
              child: VxBox(
                child: 'Satire'.richText.white.make(),
              ).make(),
            ),
            InkWell(
              onTap: () => navigateToFilter('genre', 'Horror'),
              child: VxBox(
                child: 'Horror'.richText.white.make(),
              ).make(),
            ),
            InkWell(
                onTap: () => navigateToFilter('genre', 'Mystery'),
                child: VxBox(child: 'Mystery'.richText.white.make()).make())
          ]),
          5.heightBox,
          HStack([
            VxBox(child: 'Sort by language'.richText.semiBold.xl.white.make())
                .p16
                .make()
                .glassMorphic()
                .p4()
                .expand(),
          ]),
          5.heightBox,
          HStack([
            VxBox(child: 'Sort by author'.richText.semiBold.xl.white.make())
                .p16
                .make()
                .glassMorphic()
                .p4()
                .expand(),
          ]),
        ],
      ).p8(),
    );
  }
}
