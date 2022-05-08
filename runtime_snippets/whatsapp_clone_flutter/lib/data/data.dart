final List<String> names = const [
  'Arman',
  'Afshin',
  'Adil',
  'John',
  'Doe',
  'Arman',
  'Afshin',
  'Adil',
  'John',
  'Doe'
];
final List<String> imagePaths = const [
  'assets/1.jpeg',
  'assets/2.jpeg',
  'assets/3.jpeg',
  'assets/4.jpeg',
  'assets/5.jpeg',
  'assets/1.jpeg',
  'assets/2.jpeg',
  'assets/3.jpeg',
  'assets/4.jpeg',
  'assets/5.jpeg'
];

class Message {
  const Message(
      {required this.name,
      required this.message,
      required this.time,
      required this.unreadCount,
      required this.hasStory,
      required this.profile});

  final int unreadCount;
  final String name, message, time, profile;
  final bool hasStory;
}

const List<Message> messages = [
  Message(
      hasStory: true,
      name: 'Abolfazl',
      message: 'The unseen of spending three',
      time: '09:11',
      unreadCount: 2,
      profile: 'assets/1.jpeg'),
  Message(
      hasStory: false,
      name: 'Hooman Hatefi',
      message: 'Hi How are you',
      time: '09:11',
      unreadCount: 2,
      profile: 'assets/2.jpeg'),
  Message(
      hasStory: true,
      name: 'Afshin',
      message: 'Hello bro',
      time: '09:11',
      unreadCount: 0,
      profile: 'assets/3.jpeg'),
  Message(
      hasStory: false,
      name: 'Yaganeh',
      message: 'The unseen of spending three',
      time: '09:11',
      unreadCount: 0,
      profile: 'assets/4.jpeg'),
  Message(
      hasStory: false,
      name: 'Saeed',
      message: 'The unseen of spending three at Programming competitions',
      time: '09:11',
      unreadCount: 0,
      profile: 'assets/5.jpeg'),
  Message(
      hasStory: false,
      name: 'Leila',
      message: 'The unseen of spending three at Programming competitions',
      time: '09:11',
      unreadCount: 0,
      profile: 'assets/1.jpeg'),
];
