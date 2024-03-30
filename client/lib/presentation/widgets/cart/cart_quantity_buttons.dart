import 'package:flutter/material.dart';
import 'package:flutter_version/presentation/widgets/widgets.dart';

class QuantityButtons extends StatelessWidget {
  final int currentQty;
  final String productId;
  const QuantityButtons({
    super.key,
    required this.currentQty,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    void decreaseProduct() {}

    void increaseProduct() {}

    const double buttonsSize = 32;
    return Row(
      children: [
        ClipOvalButton(
          icon: Icons.remove_outlined,
          buttonSize: buttonsSize,
          buttonColor: Colors.grey,
          onTapFunction: decreaseProduct,
        ),
        const SizedBox(
          width: 6,
        ),
        Text('$currentQty'),
        const SizedBox(
          width: 6,
        ),
        ClipOvalButton(
          icon: Icons.add,
          buttonSize: buttonsSize,
          buttonColor: Theme.of(context).colorScheme.primary,
          onTapFunction: increaseProduct,
        ),
      ],
    );
  }
}
