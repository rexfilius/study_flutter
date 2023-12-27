import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:study_flutter/utils/loading_indicator_overlay.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.appBarContent,
    this.bottomSheet,
    this.actionButton,
    this.actionButtonLocation,
    this.backgroundColor,
    this.padding,
    this.toolbarHeight,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.isLoading = false,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.centerTitle = false,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? appBarContent;
  final Widget? bottomSheet;
  final FloatingActionButton? actionButton;
  final FloatingActionButtonLocation? actionButtonLocation;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final bool centerTitle;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final double? toolbarHeight;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional persistentFooterAlignment;
  final Widget? drawer;
  final DrawerCallback? onDrawerChanged;
  final Widget? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Color? drawerScrimColor;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final bool isLoading;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CupertinoScaffold(
          body: Builder(
            builder: (context) {
              return Scaffold(
                backgroundColor: backgroundColor ?? const Color(0xffFFFFFF),
                extendBody: extendBody,
                extendBodyBehindAppBar: extendBodyBehindAppBar,
                appBar: appBar ??
                    AppBar(
                      toolbarHeight: toolbarHeight ?? 45,
                      backgroundColor:
                          backgroundColor ?? const Color(0xffFFFFFF),
                      automaticallyImplyLeading: false,
                      elevation: 0,
                      centerTitle: centerTitle,
                      title: appBarContent,
                    ),
                body: Padding(
                  padding:
                      padding ?? const EdgeInsets.symmetric(horizontal: 20),
                  child: body,
                ),
                bottomSheet: Padding(
                  padding:
                      padding ?? const EdgeInsets.symmetric(horizontal: 20),
                  child: bottomSheet,
                ),
                floatingActionButton: actionButton ?? floatingActionButton,
                floatingActionButtonLocation: actionButtonLocation,
                floatingActionButtonAnimator: floatingActionButtonAnimator,
                persistentFooterButtons: persistentFooterButtons,
                //persistentFooterAlignment: persistentFooterAlignment,
                drawer: drawer,
                onDrawerChanged: onDrawerChanged,
                endDrawer: endDrawer,
                onEndDrawerChanged: onEndDrawerChanged,
                drawerScrimColor: drawerScrimColor,
                bottomNavigationBar: bottomNavigationBar,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
                primary: primary,
                drawerDragStartBehavior: drawerDragStartBehavior,
                drawerEdgeDragWidth: drawerEdgeDragWidth,
                drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
                endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
                restorationId: restorationId,
              );
            },
          ),
        ),
        LoadingIndicatorOverlay(isLoading: isLoading),
      ],
    );
  }
}
