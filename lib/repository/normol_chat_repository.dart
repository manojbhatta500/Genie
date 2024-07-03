import 'package:genie/utils/key.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class NormolChatRepository {
  Future<String> normolChatFunction(String message) async {
    final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: ApiKey.key,
        generationConfig: GenerationConfig(maxOutputTokens: 1000));
    // Initialize the chat
    final chat = model.startChat(history: []);
    var content = Content.text(message);
    var response = await chat.sendMessage(content);
    print(response.text);
    return response.text.toString();
  }
}
