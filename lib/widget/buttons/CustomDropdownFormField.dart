// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';


// class CustomDropdownFormField extends StatelessWidget {
//   CustomDropdownFormField({
//     super.key,
//     this.radius,
//     this.padding,
//     this.backgroundColor,
//     this.label,
//     this.suffixIcon,
//     this.labelText,
//     this.hint,
//     required this.onChanged,
//     required this.list,
//     this.isSearch = false,
//   });
//   final List<String> list;
//   final double? radius, padding;
//   final Color? backgroundColor;
//   final Widget? label;
//   final Widget? suffixIcon;
//   final String? labelText;
//   final String? hint;
//   final bool isSearch;
//   final void Function(String?) onChanged;
//   final TextEditingController textEditingController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     var txtSyle = AppText.txt15;
//     var border = OutlineInputBorder(
//       borderRadius: BorderRadius.circular(radius ?? 12),
//       borderSide: BorderSide(
//         width: 1,
//         color: Colors.grey[200]!,
//       ),
//     );
//     var isOpen = false;
//     return StatefulBuilder(builder: (context, rebuild) {
//       return DropdownButtonFormField2<String>(
//         iconStyleData: IconStyleData(
//           icon: AnimatedRotation(
//             duration: const Duration(milliseconds: 200),
//             turns: isOpen ? 0.5 : 0,
//             child: SvgPicture.asset(
//               "assets/icons/ic_arrow_down.svg",
//               width: 17,
//             ),
//           ),
//         ),
//         onMenuStateChange: (_) {
//           isOpen = _;
//           rebuild(() {});
//         },
//         isDense: false,
//         isExpanded: false,
//         buttonStyleData: ButtonStyleData(
//           width: double.infinity,
//           overlayColor: MaterialStateProperty.all(Colors.transparent),
//         ),
//         decoration: InputDecoration(
//           // isDense: true,
//           isCollapsed: true,
//           filled: true,
//           fillColor: backgroundColor ?? AppColor.txtFieldColor,
//           hintText: hint,
//           suffixIcon: suffixIcon,
//           hintStyle: AppText.hintStyle(),
//           border: InputBorder.none,
//           label: label,
//           labelText: labelText,
//           enabledBorder: border,
//           errorBorder: border,
//           focusedBorder: border,
//           labelStyle: AppText.hintStyle(),
//           contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//         ),
//         onChanged: onChanged,
//         dropdownStyleData: DropdownStyleData(
//           elevation: 1,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//         dropdownSearchData: isSearch
//             ? DropdownSearchData(
//                 searchController: textEditingController,
//                 searchInnerWidgetHeight: 50,
//                 searchInnerWidget: Container(
//                   padding: const EdgeInsets.only(
//                     top: 8,
//                     bottom: 4,
//                     right: 8,
//                     left: 8,
//                   ),
//                   child: TextFormField(
//                     controller: textEditingController,
//                     decoration: InputDecoration(
//                       isDense: true,
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 15, vertical: 10),
//                       hintText: 'Searching $hint',
//                       hintStyle: AppText.hintStyle(),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             : null,
//         items: List.generate(list.length, (index) {
//           return DropdownMenuItem<String>(
//             value: list[index],
//             child: Text(
//               list[index],
//               overflow: TextOverflow.ellipsis,
//               style: txtSyle,
//             ),
//           );
//         }),
//       );
//     });
//   }
// }
