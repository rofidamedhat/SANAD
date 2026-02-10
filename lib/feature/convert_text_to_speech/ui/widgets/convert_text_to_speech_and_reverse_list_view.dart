/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/helper/spaces.dart';

import 'convert_text_to_speech_and_reverse_list_view_item.dart';

class ConvertTextToSpeechAndReverseListView extends StatefulWidget {
  const ConvertTextToSpeechAndReverseListView({super.key});

  @override
  State<ConvertTextToSpeechAndReverseListView> createState() => _ConvertTextToSpeechAndReverseListViewState();
}

class _ConvertTextToSpeechAndReverseListViewState extends State<ConvertTextToSpeechAndReverseListView> {
  @override
  int selectedIndex=0;
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: ListView.separated(
         scrollDirection: Axis.horizontal,
          separatorBuilder: (context,index){
           return horizontalSpace(15);
          },
          itemCount: 2,
          itemBuilder: (context,index){
           return GestureDetector(
             onTap: (){
               setState(() {
                 selectedIndex=index;
               });
             },
             child: ConvertTextToSpeechAndReverseListViewItem(
               data: index==0?"تحويل الصوت الي نص ":"تحويل النص الي صوت",
               selectedIndex: selectedIndex,
               index: index,
             ),
           );
          }
      ),
    );
  }
}*/
