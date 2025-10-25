import 'package:day07_instargram/Utils/color_extensions.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    // 최소 2개 최대 6개
    final crossAxisCount = (width / 120).floor().clamp(2, 6);

    return Scaffold(
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          // 상단 검색바
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            elevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 60,
            titleSpacing: 12,
            title: const _SearchTextField(),
          ),

          // 그리드 (lazy)
          SliverPadding(
            padding: const EdgeInsets.all(2),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: 200,
              itemBuilder: (context, index) {
                return Container(color: ColorsExtensions.randomColor());
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField();

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
    );

    return TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        isDense: true,
        hintText: '검색',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
