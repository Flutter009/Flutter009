class Book {
  final String uid;
  final String id;
  final String title;
  final String author;
  final String genre;
  final String image;
  final int ratings;
  final String preview;
  final String price;
  final String language;

  Book(
      {required this.uid,
      required this.id,
      required this.title,
      required this.author,
      required this.genre,
      required this.image,
      this.ratings = 0,
      required this.preview,
      required this.language,
      required this.price});

  Book.fromJson(Map<String, dynamic> snap)
      : uid = snap['uid'],
        id = snap['id'],
        title = snap['title'],
        author = snap['author'],
        genre = snap['genre'],
        image = snap['image'],
        ratings = snap['ratings'],
        preview = snap['preview'],
        language = snap['language'],
        price = snap['price'];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'id': id,
        'title': title,
        'author': author,
        'genre': genre,
        'image': image,
        'ratings': ratings,
        'preview': preview,
        'price': price,
        'language': language
      };
}
