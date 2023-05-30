import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_manager_app/src/core/constants/constants.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:auto_route/auto_route.dart';
import '../../../src/core/routes/app_router.gr.dart';

// ignore: must_be_immutable
class SignInWebviewPage extends ConsumerWidget {
  SignInWebviewPage({Key? key}) : super(key: key);

  String cookieGAS = '';

  final String _url = AppConstants.baseUrlAppscript;
  final String cookieValue = 'some-cookie-value';
  final String domain = 'https://script.google.com';
  final String cookieName = 'some_cookie_name';
  final cookieManager = WebviewCookieManager();
  bool isLogin = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0x00eceff3),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: isLogin == false
              ? WebView(
                  initialUrl: _url,
                  userAgent: "random",
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (controller) async {
                    await cookieManager.setCookies([
                      Cookie(cookieName, cookieValue)
                        ..domain = domain
                        ..expires = DateTime.now().add(const Duration(days: 10))
                        ..httpOnly = false
                    ]);
                  },
                  onPageFinished: (_) async {
                    final gotCookies = await cookieManager.getCookies(_url);
                    for (var item in gotCookies) {
                      if (item.toString().contains('__Secure-1PSID=')) {
                        cookieGAS = item.toString();
                        print('cookieGAS: $cookieGAS');
                        isLogin = true;
                        // ignore: use_build_context_synchronously
                        context.pushRoute(const DashboardBaseRoute());
                      }
                    }
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text("response here"),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
