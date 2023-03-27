import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/models/book.dart';

class ListWidget extends StatefulWidget {
  final String label;
  final List<Book> books;
  const ListWidget({super.key, required this.label, required this.books});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 240,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      widget.label,
                      style: GoogleFonts.gentiumBookBasic(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.grey.shade200),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SizedBox(
                    height: 175,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.books.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 120,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Image.network(
                                        widget.books[index].image,
                                        width: 100,
                                        height: 120,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4.0, left: 8),
                                      child: Text(
                                        widget.books[index].title,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
