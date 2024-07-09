import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/constant_colors.dart';
import '../stamp_controller.dart';

class ColorSelectorWidget extends StatelessWidget {
  const ColorSelectorWidget({
    super.key,
    required this.controller,
    this.onColorSelected, // Add this line
  });

  final StampController controller;
  final Function(int)? onColorSelected; // Add this line

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StampController>(
        id: 'color_selection',
        builder: (context) {
          return SizedBox(
            height: 32,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ConstantColors.stampColors.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedColor =
                              ConstantColors.stampColors[index];
                          controller.update(["color_selection"]);
                          controller.loadTravelModeAsset();
                          print("indexOfColor: $index");
                          onColorSelected
                              ?.call(index); // Invoke the callback here
                        },
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: controller.selectedColorIndex == index
                                  ? Border.all(color: Colors.grey)
                                  : null,
                              shape: BoxShape.circle),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: ConstantColors.stampColors[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
