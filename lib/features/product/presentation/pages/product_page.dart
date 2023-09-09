import 'package:bloc_pagination/core/helpers/blocHelpers.dart';
import 'package:bloc_pagination/features/product/presentation/bloc/product_bloc.dart';
import 'package:bloc_pagination/features/product/presentation/widgets/productCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);
  final int productLimit = 20;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var logger = Logger();

  @override
  void initState() {
    context.read<ProductBloc>().add(GetInitialProductsEvent(skip: context.read<ProductBloc>().state.products.length, limit: widget.productLimit));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductBloc bloc = context.read<ProductBloc>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.white, Color(0xffacca8b)])),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0).copyWith(top: 50),
              child: Text(
                'Product List',
                style: TextStyle(fontSize: 40, color: Colors.grey.shade900, fontWeight: FontWeight.normal, fontFamily: 'inter'),
              ),
            ),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.products.length + 1,
                    itemBuilder: (context, index) => paginate(index, widget.productLimit, state, bloc),
                    itemExtent: 100,
                    addRepaintBoundaries: false,
                    physics: const BouncingScrollPhysics(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  paginate(int index, int limit, ProductState state, bloc) {
    if (index >= state.products.length) {
      // Don't trigger if one async loading is already under way
      if (state.action != ProductAction.isLoading) {
        //if something is not loading then I try to load more
        bloc.add(GetMoreProductsEvent(skip: state.products.length, limit: limit));
      }
      if (state.lastValueReturned) {
        return Container(
          height: 10,
        );
      }
      //when something is loading then show progress indicator
      if (index == state.products.length) {
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.green,
        ));
      }
    }
    //if there is nothing to load then return the loaded data

    return Container(
      child: ProductCardWidget(product: state.products[index]),
    );
  }
}
