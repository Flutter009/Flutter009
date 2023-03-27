// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class BuyBook extends StatefulWidget {
  final snap;
  const BuyBook({super.key, @required this.snap});

  @override
  State<BuyBook> createState() => _BuyBookState();
}

class _BuyBookState extends State<BuyBook> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Vx.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Vx.black,
        leading: VStack([
          VxBox().size(20, 2).white.make(),
          5.heightBox,
          VxBox().size(30, 2).white.make(),
          5.heightBox,
          VxBox().size(15, 2).white.make()
        ]).pOnly(left: 16, top: 16),
      ),
      body: VStack([
        VxBox(
                child: [
          VxBox()
              .square(100)
              .roundedFull
              .neumorphic(elevation: 30, color: Vx.gray600)
              .bgImage(
                  DecorationImage(image: NetworkImage(widget.snap['image'])))
              .make()
              .p8(),
          widget.snap['title'].toString().richText.bold.white.xl2.make().p8(),
          widget.snap['author']
              .toString()
              .richText
              .white
              .xl
              .make()
              .paddingOnly(bottom: 32),
        ].column())
            .makeCentered(),
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: SizedBox(
            width: width,
            child: VxBox(
                child: VStack([
              VStack([
                "Price".text.gray600.bold.xl2.make(),
                5.heightBox,
                '${widget.snap['price']}.99 \$'
                    .toString()
                    .richText
                    .gray500
                    .make(),
                20.heightBox,
                "Genre".text.gray600.bold.xl2.make(),
                5.heightBox,
                HStack(
                    [widget.snap['genre'].toString().richText.gray500.make()]),
                20.heightBox,
                "Language".text.gray600.bold.xl2.make(),
                5.heightBox,
                HStack([
                  widget.snap['language'].toString().richText.gray500.make()
                ]),
                20.heightBox,
                "Ratings".text.gray600.bold.xl2.make(),
                5.heightBox,
                VxRating(
                  onRatingUpdate: (newvalue) {},
                  maxRating: 5,
                  size: 20,
                  count: 5,
                  value: widget.snap['ratings'],
                ),
                20.heightBox,
                "Preview".text.gray600.bold.xl2.make(),
                5.heightBox,
                widget.snap['preview'].toString().richText.gray500.make(),
                30.heightBox,
              ]).p16()
            ])).white.make(),
          ),
        ).expand()
      ]),
      bottomNavigationBar: HStack([
        VxBox(
            child: InkWell(
                onTap: () {
                  print('Button tapped');
                },
                child: Container(
                  height: height * 0.06,
                  decoration: const BoxDecoration(
                      color: Vx.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: width,
                  child: 'Buy now'.richText.white.semiBold.make().centered(),
                ))).make(),
      ]),
      // body: Column(
      //   children: [
      //     Center(
      //       child: SizedBox(
      //         width: width / 1.2,
      //         child: Column(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.only(
      //                   left: 52.0, top: 8.0, right: 52.0),
      //               child: Material(
      //                 elevation: 17,
      //                 child: Image.network(
      //                   widget.snap['image'],
      //                   height: height / 2.6,
      //                   width: width,
      //                 ),
      //               ),
      //             ),
      //             SizedBox(
      //               width: width,
      //               child: Column(
      //                 children: [
      //                   Padding(
      //                     padding: EdgeInsets.only(left: width * 0.007),
      //                     child: ShopBoxes(
      //                         label:
      //                             '${widget.snap['title']} by ${widget.snap['author']}'),
      //                   ),
      //                   Padding(
      //                     padding: EdgeInsets.only(left: width * 0.007),
      //                     child: ShopBoxes(label: '${widget.snap['price']} \$'),
      //                   ),
      //                   Padding(
      //                     padding: EdgeInsets.only(left: width * 0.007),
      //                     child: ShopBoxes(label: widget.snap['genre']),
      //                   ),
      //                   Padding(
      //                     padding: EdgeInsets.only(left: width * 0.007),
      //                     child: ShopBoxes(
      //                         label:
      //                             'Ratings : ${widget.snap['ratings'].toString()}'),
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: Card(
      //                       elevation: 12,
      //                       color: Colors.black26,
      //                       child: SizedBox(
      //                         width: 240,
      //                         child: Padding(
      //                           padding: const EdgeInsets.all(8.0),
      //                           child: Text(
      //                             'Preview : ${widget.snap['preview']}',
      //                             overflow: TextOverflow.clip,
      //                             style:
      //                                 GoogleFonts.akshar(color: Colors.white),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                   const ShopButtons(
      //                     label: 'Buy Now',
      //                     icon: Icons.shopping_bag,
      //                   ),
      //                   const ShopButtons(
      //                       label: 'Add to Cart',
      //                       icon: Icons.add_shopping_cart),
      //                   Padding(
      //                     padding: const EdgeInsets.symmetric(horizontal: 38.0),
      //                     child: Card(
      //                       color: Colors.black26,
      //                       child: Padding(
      //                         padding: const EdgeInsets.all(4.0),
      //                         child: Row(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: const [
      //                             IconAvatar(
      //                                 label: '7 Day Delivery',
      //                                 icon: Icons.delivery_dining),
      //                             SizedBox(
      //                               width: 14,
      //                             ),
      //                             IconAvatar(
      //                                 label: 'Easy pay options',
      //                                 icon: Icons.payment),
      //                             SizedBox(
      //                               width: 14,
      //                             ),
      //                             IconAvatar(
      //                                 label: '15 day return',
      //                                 icon: Icons.fire_truck),
      //                             SizedBox(
      //                               width: 14,
      //                             ),
      //                             IconAvatar(
      //                                 label: 'Assured Quality',
      //                                 icon: Icons.check_circle),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
