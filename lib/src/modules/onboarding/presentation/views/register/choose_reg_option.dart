// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:saffron_clarity/src/core/components/custom_outline_button.dart';
// import 'package:saffron_clarity/src/core/components/custom_text.dart';
// import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
// import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
// import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
// import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
// import 'package:saffron_clarity/src/modules/onboarding/presentation/views/login/choose_login_option.dart';
// import 'package:saffron_clarity/src/modules/onboarding/presentation/views/register/register.dart';

// class ChooseRegistrationOptionScreen extends StatelessWidget {
//   const ChooseRegistrationOptionScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: SizeConfig.verticalHeightScaled*3,
//           ),
//           CustomText(text: StringConfig.text.welcome, weight: FontWeight.bold, size: SizeConfig.mediumTextSize,),
//             SizedBox(
//             height: SizeConfig.verticalHeightScaled/2,
//           ),
//            CustomText(text: StringConfig.text.inputDetails, ),
//             SizedBox(
//             height: SizeConfig.verticalHeightScaled/2,
//           ),
//           Container(height: SizeConfig.midHeightScaled,
//                               width: SizeConfig.screenWidth,
//                               child: Image.asset(
//                                 AppImageAssets.reg_illustrator_mobile1,
//                                 fit: BoxFit.fill,
//                               ),
//                       ),
//                       SizedBox(
//             height: SizeConfig.verticalHeightScaled *2,
//           ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal:20.0),
//               child: CustomOutlineButton(label: StringConfig.text.signUpUsingEmailOrPhone, key: Key("withEmail"), onPressed: (){
//                 Get.off(RegisterScreen());
//               }, prefixIcon: Image.asset(AppImageAssets.email),),
//             ),
//             SizedBox(
//             height: SizeConfig.verticalHeightScaled ,
//           ),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal:20.0),
//               child: CustomOutlineButton(label: StringConfig.text.signUpUsingGoogle, key: Key("withGoogle"), onPressed: (){},prefixIcon:Image.asset(AppImageAssets.google),),
//             ),
//             Expanded(child: Container()),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//             CustomText(text: StringConfig.text.alreadyHaveAccount),
//             CustomText(text: StringConfig.text.signIn, color: Pallet.primary, weight: FontWeight.bold, isUnderlined: true,
//             onTap: (){
//               Get.off(ChooseLoginOptionScreen());
//             },
//             )
//           ],),
//           SizedBox(
//             height: SizeConfig.verticalHeightScaled ,
//           ),
        
//         ],
//       ),
//     );
//   }
// }
