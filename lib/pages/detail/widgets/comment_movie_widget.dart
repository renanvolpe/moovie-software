import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../components/btn_see_more_widget.dart';
import '../../../components/comment_widget.dart';
import '../../../models/mock/comments_movie.dart';
import '../../../models/mock/profile_mock.dart';


class CommentsMovieWidget extends StatelessWidget {
  const CommentsMovieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                AutoSizeText("Comments", style: context.styles.onPrimaryS(40)),
                Spacer(),
                BtnSeeMoreWidget(onTap: () {}),
              ],
            ),
            Expanded(
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: mockComments.length,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      separatorBuilder: (context, index) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return CommentWidget(
                          path: listProfilesMock.reversed.toList()[index].imageAsset,
                          name: mockComments[index].name,
                          comment: mockComments[index].comment,
                          likes: mockComments[index].likes,
                          dislikes: mockComments[index].dislikes,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
