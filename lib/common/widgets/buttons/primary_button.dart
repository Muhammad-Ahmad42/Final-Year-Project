import 'package:flutter/material.dart';

class WildScanPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // ✅ Nullable now

  const WildScanPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final bool isDisabled = onPressed == null;

    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: isDisabled ? null : onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            gradient: isDisabled
                ? null
                : LinearGradient(
                    colors: isDark
                        ? [
                            const Color(0xFF087F23),
                            const Color.fromARGB(255, 139, 222, 144),
                          ]
                        : [
                            const Color(0xFF2E7D32),
                            const Color.fromARGB(255, 139, 222, 144),
                          ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
            color: isDisabled ? Colors.grey.shade400 : null,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              text,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: isDisabled ? Colors.grey.shade200 : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
