import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(
      children: [
        StoryArea(),
        FeedList(),
      ],
    ));
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          children: List.generate(
              10, (index) => UserStoryCard(userName: 'User $index')),
        ),
      ),
    );
  }
}

class UserStoryCard extends StatelessWidget {
  final String userName;

  const UserStoryCard({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          Text(userName),
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData({
    required this.userName,
    required this.likeCount,
    required this.content,
  });
}

final feedDataList = [
  FeedData(userName: 'User1', likeCount: 50, content: '오늘 점심을 맛있게 먹었다. 오늘 점심을 맛있게 먹었다. 오늘 점심을 맛있게 먹었다. 오늘 점심을 맛있게 먹었다. 오늘 점심을 맛있게 먹었다. 오늘 점심을 맛있게 먹었다.'),
  FeedData(userName: 'User2', likeCount: 24, content: '오늘 점심 321'),
  FeedData(userName: 'User3', likeCount: 61, content: '오늘 점심 231'),
  FeedData(userName: 'User4', likeCount: 28, content: '오늘 점심 213'),
  FeedData(userName: 'User5', likeCount: 49, content: '오늘 점심 312'),
  FeedData(userName: 'User6', likeCount: 84, content: '오늘 점심 132'),
  FeedData(userName: 'User7', likeCount: 1, content: '오늘 점심'),
  FeedData(userName: 'User8', likeCount: 14, content: '오늘 점심'),
  FeedData(userName: 'User9', likeCount: 74, content: '오늘 점심'),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (ctx, idx) => FeedItem(feedData: feedDataList[idx]),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

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
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(feedData.userName),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 300,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [

                      IconButton(
                        // padding: EdgeInsets.zero, // 패딩 설정
                        constraints: const BoxConstraints(
                          minWidth: 24,
                          minHeight: 24,
                        ),
                        // visualDensity: VisualDensity.compact,
                        icon: const Icon(Icons.favorite_outline,),
                        onPressed: () {},
                      ),
                      Text(
                        '${feedData.likeCount}',
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(CupertinoIcons.chat_bubble)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.bookmark)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: [
                TextSpan(
                  text: feedData.userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: feedData.content)
              ],
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
