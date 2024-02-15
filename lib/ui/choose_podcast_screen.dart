import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/widgets/podcast_avatar_widget.dart';

class ChoosePodcastScreen extends StatelessWidget {
  const ChoosePodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            const CustomScrollView(
              slivers: [
                SliverPadding(
                  padding:
                      EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 5),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 75,
                          width: 245,
                          child: Flexible(
                            child: Text(
                              "Now choose some podcasts.",
                              style: TextStyle(
                                fontFamily: "AB",
                                fontSize: 26,
                                color: MyColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SearchBox(),
                PodcastList(),
              ],
            ),
            Positioned(
              bottom: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 55),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  backgroundColor: MyColors.whiteColor,
                ),
                onPressed: () {},
                child: const Text(
                  "Done",
                  style: TextStyle(
                    fontFamily: "AB",
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PodcastList extends StatelessWidget {
  const PodcastList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 40),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return const PodcastAvatarWidget();
          },
          childCount: 30,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 165,
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 35, right: 25, left: 25),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 42,
          decoration: const BoxDecoration(
            color: MyColors.whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Image.asset("images/icon_Search.png"),

                // const Text(
                //   "Search",
                //   style: TextStyle(
                //     fontFamily: "AM",
                //     fontSize: 14,
                //     color: MyColors.blackColor,
                //   ),
                // ),
                const Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 14,
                      color: MyColors.blackColor,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 2, left: 15),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontFamily: "AM",
                        color: MyColors.blackColor,
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.none,
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}