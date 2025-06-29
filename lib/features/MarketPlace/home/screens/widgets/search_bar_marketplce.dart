import 'package:flutter/material.dart';
import 'package:wildscan/common/widgets/appbar/search_bar.dart';

class SearchBarMarketPlace extends StatelessWidget {
  const SearchBarMarketPlace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WildScanSearchBar(
      hintText: "Serach in store",
      onSubmitted: (value) {},
    );
  }
}
