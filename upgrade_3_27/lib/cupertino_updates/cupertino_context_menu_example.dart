import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upgrade_3_27/app_bar.dart';

class CupertinoContextMenuExample extends StatelessWidget {
  const CupertinoContextMenuExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpdateAppBar(),
      body: Column(
        spacing: 50,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                spacing: 20,
                children: [
                  Text(
                    'Cupertino Context Menu',
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  CupertinoContextMenu(
                    actions: [
                      CupertinoContextMenuAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        isDefaultAction: true,
                        trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                        child: Text('Copy'),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        trailingIcon: CupertinoIcons.share,
                        child: const Text('Share'),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        trailingIcon: CupertinoIcons.heart,
                        child: const Text('Favorite'),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        isDestructiveAction: true,
                        trailingIcon: CupertinoIcons.delete,
                        child: const Text('Delete'),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        isDefaultAction: true,
                        trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                        child: Text('Copy'),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        trailingIcon: CupertinoIcons.share,
                        child: const Text('Share'),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        trailingIcon: CupertinoIcons.heart,
                        child: const Text('Favorite'),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        isDestructiveAction: true,
                        trailingIcon: CupertinoIcons.delete,
                        child: const Text('Delete'),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        isDefaultAction: true,
                        trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                        child: Text('Copy'),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        trailingIcon: CupertinoIcons.share,
                        child: const Text('Share'),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        trailingIcon: CupertinoIcons.heart,
                        child: const Text('Favorite'),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        isDestructiveAction: true,
                        trailingIcon: CupertinoIcons.delete,
                        child: const Text('Delete'),
                      ),
                    ],
                    child: FlutterLogo(
                        size: MediaQuery.sizeOf(context).width * 0.6),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
