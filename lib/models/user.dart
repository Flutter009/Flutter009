class User {
  final String first;
  final String last;
  final String email;
  final String uid;
  User(
      {required this.uid,
      required this.first,
      required this.last,
      required this.email});

  User.fromJson(Map<String, dynamic> snap)
      : first = snap['first'],
        last = snap['last'],
        email = snap['email'],
        uid = snap['uid'];

  Map<String, dynamic> toJSON() =>
      {'first': first, 'last': last, 'email': email, 'uid': uid};
}
