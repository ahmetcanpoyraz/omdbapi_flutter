// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  bool? isActive;
  String? text;
  Size? fixedSize;
  Function()? onPressed;
  TextStyle? textStyle;
  CustomButton(
      {Key? key,
      this.isActive,
      this.onPressed,
      this.text,
      this.textStyle,
      this.fixedSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: textStyle,
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(160.sp, 40.sp),
            primary:ColorConstants.instance.kBlue)
                );
  }
}

// Widget button(
//     bool? isActive, String text, Function()? onPressed, TextStyle? textStyle) {
//   return ElevatedButton(
//       onPressed: onPressed,
//       child: Text(
//         text,
//         style: textStyle,
//       ),
//       style: ElevatedButton.styleFrom(
//           fixedSize: Size(140.w, 40.h),
//           primary: isActive!
//               ? ColorConstants.instance.kBlue
//               : ColorConstants.instance.kLightGrey));
// }


/* 
NASIL KULLANILIR? 

  * longButton(

      *Aktif buton mu Pasif buton mu olacağını belirleyen TRUE ya da FALSE değerini veriyoruz
      *Butonun içinde görünecek yazıyı veriyoruz
      *OnPress metodu ile butona basılınca yapılmasını istediğimiz işlemi gönderiyoruz
      *texyStyle ile butonun içinde görünen yazının stilini ve rengini belirliyoruz

      ÖRNEK:

      longButton(
                false, => AKTİF Mİ DEĞİL Mİ
                'deneme', => BUTON YAZISI
                () {}, => ONPRESS METODU
                AppTextStyle().getLoginButtonTextStyle(context, Colors.red), => BUTON YAZI STİLİ
              )
  )

*/