import '../models/person.dart';

/// The same family used throughout the backend build (kinverse-api's test
/// fixtures and manual verification) - kept in sync deliberately.
class MockFamily {
  MockFamily._();

  static const you = Person(
    id: 'sunil', firstName: 'Sunil', lastName: 'Narayanan',
    relationship: 'You', location: 'New Jersey', isYou: true,
  );
  static const father = Person(
    id: 'john', firstName: 'John', lastName: 'Smith',
    relationship: 'Father', location: 'New Jersey', birthday: 'June 25', occupation: 'Civil Engineer',
  );
  static const mother = Person(
    id: 'mary', firstName: 'Mary', lastName: 'Smith',
    relationship: 'Mother', location: 'New Jersey',
  );
  static const spouse = Person(
    id: 'priya', firstName: 'Priya', lastName: 'Narayanan',
    relationship: 'Spouse', location: 'New Jersey',
  );
  static const son = Person(
    id: 'arjun', firstName: 'Arjun', lastName: 'Narayanan',
    relationship: 'Son', location: 'New Jersey',
  );
  static const daughter = Person(
    id: 'meera', firstName: 'Meera', lastName: 'Narayanan',
    relationship: 'Daughter', location: 'New Jersey',
  );
  static const grandfather = Person(
    id: 'ramesh', firstName: 'Ramesh', lastName: 'Kumar',
    relationship: 'Grandfather', location: 'Chennai, India',
  );
  static const grandmother = Person(
    id: 'lakshmi', firstName: 'Lakshmi', lastName: 'Kumar',
    relationship: 'Grandmother', location: 'Chennai, India',
  );
  static const aunt = Person(
    id: 'deepa', firstName: 'Deepa', lastName: 'Rao',
    relationship: 'Aunt', location: 'Bangalore, India',
  );
  static const cousin = Person(
    id: 'kiran', firstName: 'Kiran', lastName: 'Rao',
    relationship: 'Cousin', location: 'Bangalore, India',
  );

  static const immediate = [father, mother, you, spouse, son, daughter];
  static const extended = [grandfather, grandmother, father, aunt, you, cousin];
  static const all = [
    you, father, mother, spouse, son, daughter,
    grandfather, grandmother, aunt, cousin,
  ];

  static Person byId(String id) => all.firstWhere(
        (p) => p.id == id,
        orElse: () => you,
      );
}
