// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/color_constants.dart';

class CustomButtonWithIcon extends StatelessWidget {
  bool? isActive;
  String? text;
  Function()? onPressed;
  TextStyle? textStyle;
  IconData? icon;
  CustomButtonWithIcon(
      {Key? key,
      this.isActive,
      this.text,
      this.onPressed,
      this.textStyle,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(
              width: 10.w,
            ),
            Text(
              text!,
              style: textStyle,
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(140.w, 40.h),
            primary: isActive!
                ? ColorConstants.instance.kBlue
                : ColorConstants.instance.kLightGrey));
  }
}

// Widget buttonWithIcon(bool? isActive, String text, Function()? onPressed,
//     TextStyle? textStyle, IconData? icon) {
//   return ElevatedButton(
//       onPressed: onPressed,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Icon(icon),
//           SizedBox(
//             width: 10.w,
//           ),
//           Text(
//             text,
//             style: textStyle,
//           ),
//         ],
//       ),
//       style: ElevatedButton.styleFrom(
//           fixedSize: Size(140.w, 40.h),
//           primary: isActive!
//               ? ColorConstants.instance.kBlue
//               : ColorConstants.instance.kLightGrey));
// }


/* 
NASIL KULLANILIR? 

  * buttonWithIcon(

      *Aktif buton mu Pasif buton mu olaca????n?? belirleyen TRUE ya da FALSE de??erini veriyoruz
      *Butonun i??inde g??r??necek yaz??y?? veriyoruz
      *OnPress metodu ile butona bas??l??nca yap??lmas??n?? istedi??imiz i??lemi g??nderiyoruz
      *texyStyle ile butonun i??inde g??r??nen yaz??n??n stilini ve rengini belirliyoruz
      *icon ile buton ??zerinde g??r??ncek ikonu se??iyorux

      ??RNEK:

      longButton(
                false, => AKT??F M?? DE????L M??
                'deneme', => BUTON YAZISI
                () {}, => ONPRESS METODU
                AppTextStyle().getLoginButtonTextStyle(context, Colors.red), => BUTON YAZI ST??L??
                Icons.plus_one => ??KON
              )
  )

*/