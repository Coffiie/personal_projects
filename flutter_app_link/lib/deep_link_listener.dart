import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_link/pages/book_details_page.dart';
import 'package:flutter_app_link/pages/book_list_page.dart';

class DeepLinkListener extends StatefulWidget {
  const DeepLinkListener({super.key, required this.child});
  final Widget child;

  @override
  State<DeepLinkListener> createState() => _DeepLinkListenerState();
}

class _DeepLinkListenerState extends State<DeepLinkListener> {
  @override
  void initState() {
    // TODO: implement initState

    final appLinks = AppLinks(); // AppLinks is singleton

// Subscribe to all events (initial link and further)
    final sub = appLinks.uriLinkStream.listen((uri) {
      log('URI: ${uri.toString()}');
      if (uri.pathSegments.first == 'book' && mounted) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const BookListPage()));
        final id = uri.pathSegments.lastOrNull;
        if (id != null && int.tryParse(id) != null) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BookDetailsPage(bookId: id)));
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
