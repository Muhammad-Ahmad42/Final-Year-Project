import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/features/Scan/controllers/species_info_controller.dart';

class DetailsOfSpeciesScreen extends StatelessWidget {
  final String scientificName;
  final File imageFile;
  final String? location;

  const DetailsOfSpeciesScreen({
    super.key,
    required this.scientificName,
    required this.imageFile,
    this.location,
  });
  List<String> _getCharacteristics(dynamic raw) {
    if (raw == null) return [];
    if (raw is List) {
      return raw
          .map((e) => e?.toString() ?? '')
          .where((e) => e.isNotEmpty)
          .toList();
    }
    if (raw is String && raw.trim().isNotEmpty) return [raw.trim()];
    return [];
  }

  Widget imageHeader(
    BuildContext context,
    Map<String, dynamic>? speciesInfo,
    File imageFile,
  ) {
    final imageUrl = (speciesInfo?['PrimaryImage'] ?? '').toString();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    bool isLikelyImage =
        imageUrl.endsWith('.jpg') ||
        imageUrl.endsWith('.jpeg') ||
        imageUrl.endsWith('.png') ||
        imageUrl.endsWith('.webp') ||
        imageUrl.endsWith('.gif');
    bool isDirectUrl =
        imageUrl.startsWith('http') && !imageUrl.contains('<html');
    bool shouldLoad = isLikelyImage && isDirectUrl;

    final identifiedName = (speciesInfo?['identifiedName'] as String?)?.trim();
    final scientificName = (speciesInfo?['ScientificName'] as String?)?.trim();
    final textColor = Theme.of(context).colorScheme.onSurface;

    Widget headerOverlay() => Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.black.withOpacity(0.7)
            : Colors.white.withOpacity(0.82),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (identifiedName?.isNotEmpty ?? false)
                ? identifiedName!
                : this.scientificName,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: 26,
            ),
          ),
          if ((scientificName?.isNotEmpty ?? false) &&
              scientificName != identifiedName)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "Scientific Name: $scientificName",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: textColor.withOpacity(0.9),
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                ),
              ),
            ),
        ],
      ),
    );

    if (shouldLoad) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(32),
            ),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) => progress == null
                  ? child
                  : Container(
                      height: 240,
                      color: Colors.grey[900],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
              errorBuilder: (context, error, stackTrace) {
                if (imageFile.existsSync()) {
                  return Image.file(
                    imageFile,
                    width: double.infinity,
                    height: 240,
                    fit: BoxFit.cover,
                  );
                } else {
                  return Container(
                    height: 240,
                    width: double.infinity,
                    color: Colors.grey[800],
                    child: const Icon(
                      Icons.broken_image,
                      size: 70,
                      color: Colors.white70,
                    ),
                  );
                }
              },
            ),
          ),
          Positioned(left: 0, right: 0, bottom: 0, child: headerOverlay()),
        ],
      );
    } else {
      if (imageFile.existsSync()) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(32),
              ),
              child: Image.file(
                imageFile,
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(left: 0, right: 0, bottom: 0, child: headerOverlay()),
          ],
        );
      } else {
        return Stack(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[900] : Colors.grey[200],
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.image_not_supported,
                  size: 60,
                  color: Colors.grey,
                ),
              ),
            ),
            Positioned(left: 0, right: 0, bottom: 0, child: headerOverlay()),
          ],
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(SpeciesInfoController(scientificName: scientificName));
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = Theme.of(context).colorScheme.surface;
    final shadowColor = isDark
        ? Colors.black.withOpacity(0.32)
        : Colors.grey.withOpacity(0.10);
    final borderRadius = BorderRadius.circular(28);
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      appBar: WildScanAppBar(
        showBackArrow: true,
        title: Text(
          scientificName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Obx(() {
        if (ctrl.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (ctrl.speciesInfo.value == null) {
          return Center(
            child: Text(ctrl.errorMsg.value ?? "No information found."),
          );
        }
        final info = ctrl.speciesInfo.value!;
        return Container(
          width: double.infinity,
          color: isDark ? const Color(0xFF191B22) : const Color(0xFFF6F8FA),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imageHeader(context, info, imageFile),
                // --- CONTENT CARD ---
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    top: 32,
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor,
                        blurRadius: 18,
                        offset: const Offset(0, 7),
                      ),
                    ],
                    borderRadius: borderRadius,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if ((info['commonName'] ?? '').toString().isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Icon(Icons.label, color: textColor, size: 22),
                              const SizedBox(width: 7),
                              Flexible(
                                child: Text(
                                  info['commonName'],
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: textColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if ((info['Description'] ?? '').toString().isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            info['Description'],
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  fontSize: 17,
                                  color: textColor,
                                  height: 1.5,
                                ),
                          ),
                        ),
                      if (_getCharacteristics(
                        info['Characteristics'],
                      ).isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.notes_rounded,
                                    color: textColor,
                                    size: 21,
                                  ),
                                  const SizedBox(width: 7),
                                  Text(
                                    "Characteristics",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: textColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            ..._getCharacteristics(info['Characteristics']).map(
                              (item) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.5,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 7,
                                      color: textColor.withOpacity(0.80),
                                    ),
                                    const SizedBox(width: 7),
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontSize: 16,
                                              color: textColor,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                          ],
                        ),
                      if ((info['Habitat'] ?? '').toString().isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.nature, color: textColor, size: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  "Habitat: ${info['Habitat']}",
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        fontSize: 16,
                                        color: textColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if ((info['conservationStatus'] ?? '')
                          .toString()
                          .isNotEmpty)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.verified, color: textColor, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Conservation Status: ${info['conservationStatus']}",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: textColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 16,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: cardColor,
                          side: BorderSide(color: Colors.green[400]!, width: 2),
                          shadowColor: shadowColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Buy it clicked!')),
                          );
                        },
                        child: Text(
                          "Buy it",
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
