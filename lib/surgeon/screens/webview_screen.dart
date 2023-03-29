import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../general/utilities/http/dio/modals/LoadingDialog.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  // WebViewController? _controller;
  // final Completer<WebViewController> _controllerCompleter = Completer<WebViewController>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
    init();
  }

  init() async {
    if (Platform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

      var swAvailable =
          await AndroidWebViewFeature.isFeatureSupported(AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
      var swInterceptAvailable =
          await AndroidWebViewFeature.isFeatureSupported(AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

      if (swAvailable && swInterceptAvailable) {
        AndroidServiceWorkerController serviceWorkerController = AndroidServiceWorkerController.instance();

        await serviceWorkerController.setServiceWorkerClient(AndroidServiceWorkerClient(
          shouldInterceptRequest: (request) async {
            print(request);
            return null;
          },
        ));
      }
    }
  }

  InAppWebViewController? webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Information'),
        backgroundColor: Colors.white,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(useOnDownloadStart: true),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          webView = controller;
        },
        onLoadStart: (InAppWebViewController controller, Uri? url) {},
        onLoadStop: (InAppWebViewController controller, Uri? url) {},
        onDownloadStart: (controller,uri){
          print("onDownloadStart ==============$uri}");

        },
        onDownloadStartRequest: (controller, url) async {
          String fileUrl = url.url.path;
          print("onDownloadStart ==============$fileUrl}");

          try {
            Directory downloadsDir = await getTemporaryDirectory();
            var filePath = '${downloadsDir.path}/${url.suggestedFilename}';
            Dio dio = new Dio(
              BaseOptions(
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                followRedirects: true,
              ),
            );
            Response response = await dio.download(
              'fileUrl',
              filePath,
              onReceiveProgress: (received, total) {
                int percentage = ((received / total) * 100).floor();
                print(percentage);
              },
            );
            if (response.statusCode! >= 200 || response.statusCode! <= 300)
              CustomToast.showSnackBar(context, 'Patient Information Downloaded Successfully');
            else
              CustomToast.showSnackBar(context, 'Patient Information Download Failed');
          } catch (e) {
            CustomToast.showSnackBar(context, 'Patient Information Download Failed');
          }
        },
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Patient Information'),
    //     centerTitle: true,
    //     backgroundColor: Colors.white,
    //   ),
    //   body: Stack(
    //     children: <Widget>[
    //       WebView(
    //         initialUrl: widget.url,
    //         javascriptMode: JavascriptMode.unrestricted,
    //         zoomEnabled: false,
    //         // onWebViewCreated: (WebViewController webViewController) {
    //         //   _controllerCompleter.future.then((value) => _controller = value);
    //         //   _controllerCompleter.complete(webViewController);
    //         // },
    //         onPageStarted: (String url) async {},
    //         onPageFinished: (finish) {
    //           setState(() => isLoading = false);
    //         },
    //       ),
    //       if (isLoading) Center(child: CircularProgressIndicator()),
    //     ],
    //   ),
    // );
  }
}
