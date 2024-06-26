import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:education_system/account/domain/account.dart';
import 'package:education_system/lesson/domain/lesson.dart';
import 'package:education_system/lesson/domain/teacherLesson.dart';
import 'package:education_system/utils/pub.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class titleTxt extends StatelessWidget {
  final String text;
  const titleTxt(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
    );
  }
}

class contentTxt extends StatelessWidget {
  final String text;
  const contentTxt(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 14),
    );
  }
}

class customDateContent extends StatelessWidget {
  final void Function()? onTap;
  final String? date;
  const customDateContent({this.date, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5.sw,
      height: 35.sh,
      alignment: Alignment.center,
      child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black26),
              color: Color(0xFFF1F1F1),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5),
                Text(
                    date == null
                        ? '請選擇日期'
                        : date == ''
                            ? '請選擇日期'
                            : Pub_Function.formatDate(date!),
                    style: TextStyle(color: Colors.grey)),
                Spacer(),
                Icon(Icons.date_range, color: Colors.grey),
                SizedBox(width: 10),
              ],
            ),
          )),
    );
  }
}

class customPhoneField extends StatelessWidget {
  final double? width;
  final double height;
  final TextEditingController? ctr;
  final bool enable;
  final void Function()? onTap;
  const customPhoneField({
    this.width,
    this.height = 35,
    this.ctr,
    this.enable = true,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(children: [
        Expanded(
          child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(5, 8, 5, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black26),
                color: Color(0xFFF1F1F1),
              ),
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: ctr,
                          decoration: const InputDecoration.collapsed(hintText: '請輸入', hintStyle: TextStyle(color: Colors.grey)),
                          style: TextStyle(height: 1.2, fontSize: 14.sp),
                          maxLines: null,
                          minLines: null,
                          expands: true,
                          enabled: enable,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: onTap,
                            child: Icon(Icons.close, color: Colors.grey, size: 16.sp),
                          )),
                    ],
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}

class customEditField extends StatelessWidget {
  final double? width;
  final double height;
  final TextEditingController? ctr;
  final bool enable;
  final void Function()? trailingIconOnTap;
  final TextInputType? keyboardType;
  final IconData? trailingIcon;
  const customEditField({
    this.width,
    this.height = 35,
    this.ctr,
    this.enable = true,
    this.trailingIconOnTap,
    this.keyboardType,
    this.trailingIcon = Icons.close,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(children: [
        Expanded(
          child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(5, 8, 5, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black26),
                color: Color(0xFFF1F1F1),
              ),
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          keyboardType: keyboardType,
                          controller: ctr,
                          decoration: const InputDecoration.collapsed(hintText: '請輸入', hintStyle: TextStyle(color: Colors.grey)),
                          style: TextStyle(height: 1.2, fontSize: 14.sp),
                          maxLines: null,
                          minLines: null,
                          expands: true,
                          enabled: enable,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: trailingIconOnTap,
                            child: Icon(trailingIcon, color: Colors.grey, size: 16.sp),
                          )),
                    ],
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}

class customDropBtn extends StatelessWidget {
  final String title;
  final int? selectInd;
  final List<String> items;
  final double btnWidth;
  final double btnHeight;
  final void Function(String?)? onChanged;
  const customDropBtn(
    this.title,
    this.selectInd,
    this.items, {
    this.btnWidth = 100,
    this.btnHeight = 35,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 5),
            Text(
              title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  alignment: Alignment.centerLeft,
                  value: item,
                  child: Row(
                    children: [
                      SizedBox(width: 5),
                      Text(
                        item,
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ))
            .toList(),
        value: selectInd == null ? null : items[selectInd!],
        onChanged: onChanged,
        //button skin
        buttonStyleData: ButtonStyleData(
          height: btnHeight,
          width: btnWidth,
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          // padding: everyItemPadding,
          elevation: 0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black26),
            color: Color(0xFFF1F1F1),
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 20,
          iconEnabledColor: Colors.grey,
          iconDisabledColor: Colors.grey,
        ),
        //dropDown button skin
        dropdownStyleData: DropdownStyleData(
          maxHeight: btnHeight * 5,
          // width: btnWidth,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
          // offset: const Offset(-5, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        //drop every item skin
        menuItemStyleData: MenuItemStyleData(
          height: btnHeight, padding: EdgeInsets.only(left: 10),
          // padding: everyItemPadding,
        ),
      ),
    );
  }
}

class customBtn extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final void Function()? onPressed;
  const customBtn({required this.text, required this.onPressed, this.width = 80, this.height = 40, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 13)),
      style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),
    );
  }
}

//頭像
class accountPhotoView extends StatelessWidget {
  final double radius;
  final networkPhoto;
  final void Function()? onTap;
  const accountPhotoView({this.radius = 40, required this.networkPhoto, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: networkPhoto == '' ? null : NetworkImage(networkPhoto),
        backgroundColor: Colors.grey,
        child: networkPhoto == '' ? Icon(Icons.person) : null,
      ),
    );
  }
}

class lessonCard extends StatelessWidget {
  final lessonData lesson;
  final void Function()? onTap;
  final String btnTxt;
  final void Function()? onBtnTap;
  const lessonCard({required this.lesson, this.onTap, this.btnTxt = '刪除', this.onBtnTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 80,
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 0.8),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('課程名稱:${lesson.lessonName}', style: TextStyle(color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.w500)),
                Text(
                  '課程內容:${lesson.lessonContent}',
                  style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '上課時間:${Pub_Function.dateTimeToHHmm(lesson.startTime)} ~ ${Pub_Function.dateTimeToHHmm(lesson.endTime)}',
                  style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Spacer(),
            onBtnTap == null ? SizedBox() : customBtn(text: btnTxt, onPressed: onBtnTap)
          ],
        ),
      ),
    );
  }
}

class accountCard extends StatelessWidget {
  final accountData account;
  final void Function()? onTap;
  final void Function()? onDelete;
  const accountCard({required this.account, this.onTap, this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 0.8),
            ),
          ],
        ),
        child: Row(
          children: [
            accountPhotoView(
              radius: 30,
              networkPhoto: account.InternetPhoto,
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Text(account.identity.name, style: TextStyle(color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w500)),
                Text(
                  account.name,
                  style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Spacer(),
            customBtn(text: '刪除', onPressed: onDelete)
          ],
        ),
      ),
    );
  }
}

class teacherInfoCard extends StatelessWidget {
  final teacherLesson data;
  const teacherInfoCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 0.8),
          ),
        ],
      ),
      child: ListTileTheme(
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 0.0,
        minLeadingWidth: 0,
        dense: true,
        child: customExpansionTile(
          shape: Border(),
          leading: accountPhotoView(
            networkPhoto: data.InternetPhoto,
          ),
          tilePadding: const EdgeInsets.only(right: 0),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Text(data.identity.name, style: TextStyle(color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                        Text(
                          data.name,
                          style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ],
          ),
          children: [
            Divider(indent: 20, endIndent: 20),
            SizedBox(height: 15),
            ...List.generate(data.lessons.length, (index) => lessonTileCard(data: data.lessons[index])),
          ],
        ),
      ),
    );
  }
}

class customExpansionTile extends StatefulWidget {
  final Widget title;
  final ShapeBorder? shape;
  final Widget? leading;
  final EdgeInsetsGeometry? tilePadding;

  final List<Widget> children;
  const customExpansionTile({
    required this.title,
    this.shape,
    this.leading,
    this.tilePadding,
    this.children = const <Widget>[],
    super.key,
  });

  @override
  State<customExpansionTile> createState() => _customExpansionTileState();
}

class _customExpansionTileState extends State<customExpansionTile> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: widget.title,
      shape: widget.shape,
      leading: widget.leading,
      tilePadding: widget.tilePadding,
      initiallyExpanded: _isExpanded,
      trailing: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Icon(_isExpanded ? Icons.remove : Icons.add),
      ),
      onExpansionChanged: (expanded) {
        setState(() {
          _isExpanded = expanded;
        });
      },
      children: widget.children,
    );
  }
}

class lessonTileCard extends StatelessWidget {
  final lessonData data;
  const lessonTileCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15, bottom: 15),
      width: double.infinity,
      child: Row(children: [
        SizedBox(width: 12),
        Icon(Icons.calendar_month, size: 30, color: Colors.grey),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.lessonName,
                style: TextStyle(color: Colors.black.withOpacity(0.9), fontSize: 14.sp, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${Pub_Function.weekDay(data.weekNumber.ind)} , ${DateFormat('HH:mm').format(data.startTime)}~${DateFormat('HH:mm').format(data.endTime)}',
                style: TextStyle(color: Colors.grey, fontSize: 12.sp, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Icon(Icons.arrow_forward_ios, size: 15, color: Colors.black),
        SizedBox(width: 5),
      ]),
    );
  }
}

class noDataWidget extends StatelessWidget {
  final String text;
  const noDataWidget({this.text = '無資料', super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text, style: TextStyle(color: Colors.grey, fontSize: 15.sp)));
  }
}
