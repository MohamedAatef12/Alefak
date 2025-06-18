import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeepLinkHandler extends StatefulWidget {
  final Widget child;

  const DeepLinkHandler({required this.child, super.key});

  @override
  State<DeepLinkHandler> createState() => _DeepLinkHandlerState();
}

class _DeepLinkHandlerState extends State<DeepLinkHandler> {
  final appLinks = AppLinks();

  @override
  void initState() {
    super.initState();

    // Live link handling
    appLinks.uriLinkStream.listen((Uri? uri) {
      _handleUri(uri);
    });

    // Cold start handling
    handleInitialLink();
  }

  Future<void> handleInitialLink() async {
    final initialLink = await appLinks.getInitialLinkString();
    if (initialLink != null) {
      final initialUri = Uri.tryParse(initialLink);
      _handleUri(initialUri);
    }
  }

  void _handleUri(Uri? uri) {
    if (uri != null &&
        uri.pathSegments.isNotEmpty &&
        uri.pathSegments.first == 'posts') {
      final postId = int.tryParse(uri.pathSegments.last);
      if (postId != null) {
        context.go('/posts/$postId');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
