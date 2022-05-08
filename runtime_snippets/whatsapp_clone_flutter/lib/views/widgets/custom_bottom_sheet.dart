import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp_clone_flutter/data/data.dart';
import 'package:whatsapp_clone_flutter/theme/app_theme.dart';
import 'package:whatsapp_clone_flutter/views/widgets/profile_picture_widget.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {Key? key,
      required this.controllerValue,
      required this.onVerticalDragUpdate})
      : super(key: key);
  final double controllerValue;
  final void Function(DragUpdateDetails) onVerticalDragUpdate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 30,
              child: GestureDetector(
                onVerticalDragUpdate: onVerticalDragUpdate,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  radius: 130,
                  child: CircleAvatar(
                    radius: 115,
                    backgroundColor: Colors.grey.withOpacity(0.7),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height * 0.68,
                      maxHeight: MediaQuery.of(context).size.height * 0.73),
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    duration: const Duration(microseconds: 1),
                    height: controllerValue == 0
                        ? MediaQuery.of(context).size.height * 0.8
                        : MediaQuery.of(context).size.height *
                            (1 - controllerValue),
                    width: MediaQuery.of(context).size.width,
                    child: const _BottomWidget(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _BottomWidget extends StatelessWidget {
  const _BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                    width: 2, color: const Color.fromARGB(255, 45, 45, 45)),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            height: 120,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedIconTheme: IconThemeData(color: AppTheme.green),
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(
                    FontAwesomeIcons.house,
                    size: 20,
                  ),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(FontAwesomeIcons.phone, size: 20),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [AppTheme.blue, AppTheme.green]),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  label: 'School',
                ),
                const BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: FaIcon(FontAwesomeIcons.camera, size: 20),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(FontAwesomeIcons.solidUser, size: 20),
                  label: 'Business',
                ),
              ],
              currentIndex: 0,
              selectedItemColor: Colors.amber[800],
              onTap: (index) {},
            ),
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 0,
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 45),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 50, 50, 50),
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: Theme(
                    data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TabBar(
                        labelColor: Colors.white,
                        indicator: BoxDecoration(
                          color: const Color.fromARGB(255, 34, 34, 34),
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        tabs: const [
                          Tab(icon: Text('Chats')),
                          Tab(icon: Text('Groups')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: const TabBarView(
            children: [
              _FirstChild(),
              _FirstChild(),
            ],
          )),
    );
  }
}

class _FirstChild extends StatelessWidget {
  const _FirstChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, i) => _ListTile(index: i)),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // minVerticalPadding: 16,
      leading: ProfilePictureWidget(
        hasStory: messages[index].hasStory,
        size: 60,
        image: messages[index].profile,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(messages[index].name),
      ),
      subtitle: Text(
        messages[index].message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            messages[index].time,
          ),
          const SizedBox(
            height: 8,
          ),
          Opacity(
            opacity: messages[index].unreadCount == 0 ? 0 : 1,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
              child: Text(
                messages[index].unreadCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
