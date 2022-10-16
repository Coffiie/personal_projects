import 'package:instagram_redesign_sc_app/data/data.dart';

class NotificationData {
  NotificationData(
      {required this.hasStory,
      required this.profilePhoto,
      required this.commentImage,
      required this.date,
      required this.isFollow,
      required this.subText,
      required this.username});
  final String profilePhoto, commentImage, username, date, subText;
  final bool isFollow, hasStory;
}

final List<NotificationData> notificationData = [
  NotificationData(
    hasStory: true,
    isFollow: true,
    profilePhoto: imagePaths[0],
    commentImage: '',
    date: '25 sep',
    subText: 'started following you.',
    username: 'luka333',
  ),
  NotificationData(
    hasStory: false,
    isFollow: false,
    profilePhoto: imagePaths[1],
    commentImage: highlightImages[0],
    date: '1 min',
    subText:
        'Commented: Great content, without a doubt I am your fan, you get great pictures in incredible pleaces.',
    username: 'erickmiller',
  ),
  NotificationData(
    hasStory: true,
    isFollow: true,
    profilePhoto: imagePaths[2],
    commentImage: '',
    date: '2 min',
    subText: 'started following you.',
    username: 'natash08',
  ),
  NotificationData(
    hasStory: false,
    isFollow: true,
    profilePhoto: imagePaths[3],
    commentImage: '',
    date: '3 min',
    subText: 'started following you.',
    username: 'lara_22',
  ),
  NotificationData(
    hasStory: true,
    isFollow: false,
    profilePhoto: imagePaths[4],
    commentImage: highlightImages[1],
    date: '4 min',
    subText:
        'Commented: 2 years ago I was in that beautiful place, great landscapes and delicious food, I hope to return one day and feel that good energy, I must also say that I love the filter you use, it is very professional.',
    username: 'cynthia21',
  ),
  NotificationData(
    hasStory: false,
    isFollow: true,
    profilePhoto: imagePaths[5],
    commentImage: '',
    date: '6 min',
    subText: 'started following you.',
    username: 'loren0',
  ),
  NotificationData(
    isFollow: false,
    hasStory: true,
    profilePhoto: imagePaths[0],
    commentImage: highlightImages[2],
    date: '6 min',
    subText: 'Commented: How cute!',
    username: 'luka333',
  ),
  NotificationData(
    hasStory: false,
    isFollow: false,
    profilePhoto: imagePaths[5],
    commentImage: highlightImages[4],
    date: '10 min',
    subText:
        'Commented: Absolutely amazing! I had a old BMW when I was in high school!',
    username: 'loren0',
  ),
];
