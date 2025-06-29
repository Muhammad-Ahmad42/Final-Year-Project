import 'package:flutter/material.dart';
import 'package:wildscan/common/widgets/customShapes/containers/circular_container.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanChoiceChip extends StatelessWidget {
  const WildScanChoiceChip({
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
    final isColor = WildScanHelperFunctions.getColor(text) != null;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? WildScanColors.white : null),
        avatar: isColor
            ? WildScanCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: WildScanHelperFunctions.getColor(text)!)
            : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor:
            isColor ? WildScanHelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
