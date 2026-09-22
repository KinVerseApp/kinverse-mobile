class Person {
  final String id;
  final String firstName;
  final String lastName;
  final String? relationship; // relationship to "me" - Father, You, Spouse...
  final String? location;
  final String? birthday;
  final String? occupation;
  final bool isYou;

  const Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.relationship,
    this.location,
    this.birthday,
    this.occupation,
    this.isYou = false,
  });

  String get fullName => '$firstName $lastName';

  String get initials {
    final f = firstName.isNotEmpty ? firstName[0] : '';
    final l = lastName.isNotEmpty ? lastName[0] : '';
    return ('$f$l').toUpperCase();
  }

  Person copyWith({String? relationship, String? location}) => Person(
        id: id,
        firstName: firstName,
        lastName: lastName,
        relationship: relationship ?? this.relationship,
        location: location ?? this.location,
        birthday: birthday,
        occupation: occupation,
        isYou: isYou,
      );
}
