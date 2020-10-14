import 'package:borabora_island/model/borabora.dart';
import 'package:borabora_island/ui/common/borabora_summary.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        // color: Colors.white,
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            // 다른 Sliver를 포함하고 패딩을 적용할 수 있는 간단한 Sliver.
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              // SliverList와 비슷하지만 높이가 고정된 항목의 경우 사용한다.
              sliver: new SliverFixedExtentList(
                // itemExtent는 행의 크기를 설정하는 속성이다. 크기가 모두 같으면
                // 그리는 속도가 빨라진다.
                itemExtent: 160.0,
                // delegate는 대리자이며 자식을 제어하는 속성이다.
                // SliverChildBuilderDelegate 위젯과 함께 사용한다.
                delegate: new SliverChildBuilderDelegate(
                    (context, index) =>
                        new BoraboraSummary(boraboraList[index]),
                    // 자식들이 몇개인지 설정
                    childCount: boraboraList.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
