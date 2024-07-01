import 'package:meta/meta.dart';

@immutable
abstract class NormalChatEvent {}

class SendUserChat extends NormalChatEvent {
  final String userString;
  SendUserChat({required this.userString});
}
