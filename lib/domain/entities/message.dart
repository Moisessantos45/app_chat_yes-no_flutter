
enum TypeMessage { me, hers }

class Message {
  final String message;
  final String? imageUrl;
  final TypeMessage typeMessage;

  Message({required this.message, this.imageUrl, required this.typeMessage});
}
