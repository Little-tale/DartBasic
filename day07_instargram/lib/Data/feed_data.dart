class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData({
    required this.userName,
    required this.likeCount,
    required this.content,
  });

  static List<FeedData> mockData() {
    return [
      FeedData(userName: "user1", likeCount: 1, content: "Test"),
      FeedData(userName: "user2", likeCount: 0, content: "Test"),
      FeedData(userName: "user3", likeCount: 5, content: "Testsada"),
      FeedData(userName: "user4", likeCount: 88, content: "Testb"),
      FeedData(userName: "user5", likeCount: 99, content: "Test4"),
      FeedData(userName: "user6", likeCount: 10, content: "Test"),
      FeedData(userName: "user7", likeCount: 10, content: "Testvasd"),
      FeedData(userName: "user8", likeCount: 10, content: "Test"),
      FeedData(userName: "user9", likeCount: 10, content: "Test"),
      FeedData(userName: "user10", likeCount: 10, content: "Tesbasdt"),
    ];
  }
}
