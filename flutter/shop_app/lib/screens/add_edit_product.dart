import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';

class AddEditPrductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  @override
  _AddEditPrductScreenState createState() => _AddEditPrductScreenState();
}

class _AddEditPrductScreenState extends State<AddEditPrductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var _editedProduct = Product(
    id: null,
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
    isFavorite: false,
  );

  // To avoid memory leak
  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _saveForms() {
    _formKey.currentState.save();
    print(_editedProduct.title);
    print(_editedProduct.price);
    print(_editedProduct.description);
    print(_editedProduct.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    print(_imageUrlController.text);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => _saveForms(),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    title: value,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    id: _editedProduct.id,
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    price: double.parse(value),
                    description: _editedProduct.description,
                    id: _editedProduct.id,
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (value) {
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    price: _editedProduct.price,
                    description: value,
                    id: _editedProduct.id,
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Image URL'),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                controller: _imageUrlController,
                onSaved: (value) {
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    id: _editedProduct.id,
                    imageUrl: value,
                    isFavorite: _editedProduct.isFavorite,
                  );
                },
                onFieldSubmitted: (_) {
                  _saveForms();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
