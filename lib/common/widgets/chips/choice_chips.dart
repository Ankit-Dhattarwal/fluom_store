import 'package:fluom/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';


class ChoiceChips extends StatelessWidget {
  const ChoiceChips({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunction.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor? const SizedBox() :  Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle:   TextStyle(color: selected ? TColors.whites : null),
        avatar: isColor
        ?  CircularContainer(width: 50, height: 50, backgroundColor: THelperFunction.getColor(text)!)
        : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        // Make icon in center
        shape: isColor ?  const CircleBorder() : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
      //  selectedColor: Colors.green,
        backgroundColor: isColor ? THelperFunction.getColor(text)! : null,
      ),
    );
  }
}
