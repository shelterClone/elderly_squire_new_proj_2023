import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class IDUploader extends StatefulWidget {
  @override
  _IDUploaderState createState() => _IDUploaderState();
}

class _IDUploaderState extends State<IDUploader> {
  late PickedFile _imageFile;

  var http; // Variable to store the selected image file

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile!;
    });
  }

//  Future<void> _uploadImage() async {
//    final url = Uri.parse('https://example.com/upload'); // Replace with your upload URL
//    final request = http.MultipartRequest('POST', url);
//    request.files.add(await http.MultipartFile.fromPath('image', _imageFile.path));
//
//    final response = await request.send();
//    if (response.statusCode == 200) {
//      // Image uploaded successfully
//      print('Image uploaded!');
//    } else {
//      // Error occurred while uploading the image
//      print('Image upload failed.');
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton(
            onPressed: _selectImage,
            child: Text('Select Image'),
          ),
        ),
//        ElevatedButton(
//          onPressed: _uploadImage,
//          child: Text('Upload Image'),
//        ),
      ],
    );
  }
}