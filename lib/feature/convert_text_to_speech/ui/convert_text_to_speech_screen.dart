import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/convert_text_to_speech/ui/widgets/convert_text_to_speech_and_reverse_list_view.dart';
import 'package:sanad/feature/convert_text_to_speech/ui/widgets/convert_text_to_speech_and_reverse_list_view_item.dart';
import 'package:sanad/feature/convert_text_to_speech/ui/widgets/convert_to_speech_body.dart';
import 'package:sanad/feature/convert_text_to_speech/ui/widgets/convert_to_text_body.dart';
import 'package:sanad/feature/convert_text_to_speech/ui/widgets/translate_text_and_speech_app_bar.dart';

import '../../../core/helper/spaces.dart';
import '../../../core/themeing/colors.dart';

class ConvertTextToSpeechScreen extends StatefulWidget {
  const ConvertTextToSpeechScreen({super.key});

  @override
  State<ConvertTextToSpeechScreen> createState() => _ConvertTextToSpeechScreenState();
}

class _ConvertTextToSpeechScreenState extends State<ConvertTextToSpeechScreen> {
  @override
  int selectedIndex=0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(180), child:TranslateTextAndSpeechAppBar() ),
      body:SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            child: SingleChildScrollView(
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 SizedBox(
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
              ),
              verticalSpace(60),
              selectedIndex==0?ConvertToTextBody():ConvertToSpeechBody()
                ],
              ),
            ),
          )
      ),
      //bottomNavigationBar: ,
    );
  }
}
