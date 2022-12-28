import 'package:flutter_dotenv/flutter_dotenv.dart';

String chatToken = dotenv.env['openApiKey'] ?? "";
String translationToken = dotenv.env['googleApiKey'] ?? "";
