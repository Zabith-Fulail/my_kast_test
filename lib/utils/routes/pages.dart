class Pages{
   static const String homeView = 'homeView';
   static const String messageView = 'messageView';
   static const String notificationView = 'notificationView';
   static const String profileView = 'profileView';
   static const String counterScreen = 'counterScreen';
}


extension PagesExtension on String {

  String toPathName(){
    final path = this;
    return path.replaceFirst('/', '').toUpperCase();
  }

  String toPath({bool isSubRoute = false, String? pathParam, String? pathPrefix}) {
    String path = this;
    if (pathPrefix != null && pathPrefix.isNotEmpty) {
      final prefix = pathPrefix.startsWith('/') ? pathPrefix : '/$pathPrefix';
      path = '$prefix/$path';
    } else {
      path = '/$path';
    }
    if (pathParam != null && pathParam.isNotEmpty) {
      final param = pathParam.startsWith(':') ? pathParam : ':$pathParam';
      path = '$path/$param';
    }
    if (isSubRoute) {
      path = path.replaceFirst('/', '');
    }
    return path;
  }
}