import 'package:admin_dashboard/ui/views/no_page_found_view.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandlers {
  // Add your admin handler methods here

  static Handler noPageFound = Handler(
    handlerFunc: (context, parameters) {
      // Handle 404 - No page found
      return NoPageFoundView();
    },
  );
} 