import 'package:day07_instargram/Data/feed_data.dart';
import 'package:day07_instargram/UI/sub_widgets/feed_icon_button.dart';
import 'package:day07_instargram/Utils/color_extensions.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // 스토리(가로 스크롤) 섹션
        SliverToBoxAdapter(child: StoryArea()),
        const SliverToBoxAdapter(child: Divider(height: 1)),

        // 피드(세로) 섹션 - 지연 방식
        FeedList(feedListData: FeedData.mockData()),
      ],
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 바깥 여백만 주고, 높이는 자동 결정
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            UserStory(userName: '김유신'),
            UserStory(userName: '김예찬'),
            UserStory(userName: '권지용'),
            UserStory(userName: '손흥민'),
            UserStory(userName: '박찬호'),
          ],
        ),
      ),
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;
  const UserStory({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // EdgeInsetsGeometry.symmetric -> EdgeInsets.symmetric 로 사용
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 🔑 자식 높이에 맞춰 최소만 차지
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorsExtensions.randomColor(),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          const SizedBox(height: 4),
          Text(userName, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

class FeedList extends StatelessWidget {
  final List<FeedData> feedListData;
  const FeedList({super.key, required this.feedListData});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => FeedItem(feedData: feedListData[index]),
        childCount: feedListData.length,
      ),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;
  const FeedItem({super.key, required this.feedData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade300,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(feedData.userName),
                ],
              ),
              Icon(Icons.more_vert),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 300,
          color: ColorsExtensions.randomColor(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FeedIconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                  ),

                  FeedIconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.chat_bubble),
                  ),
                  FeedIconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.paperplane),
                  ),
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bookmark)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            '좋아요 ${feedData.likeCount}개',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: feedData.userName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: feedData.content),
              ],
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}


/*
Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            feedData.userName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            height: 220,
            color: Colors.grey.shade300,
            alignment: Alignment.center,
            child: const Text('피드 Placeholder'),
          ),
          const SizedBox(height: 8),
          Text('좋아요 ${feedData.likeCount}개'),
        ],
      ),
    );
*/