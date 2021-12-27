import 'package:animate_do/animate_do.dart';
import 'package:ecommerce/app/di.dart';
import 'package:ecommerce/core/constants/assets/assets_manager.dart';
import 'package:ecommerce/core/constants/strings/strings_manager.dart';
import 'package:ecommerce/core/extensions/context_extension.dart';
import 'package:ecommerce/core/init/color/color_manager.dart';
import 'package:ecommerce/core/init/styles/styles_manager.dart';
import 'package:ecommerce/core/widget/auth_elevated_button.dart';
import 'package:ecommerce/features/main/home/model/product_model.dart';
import 'package:ecommerce/features/main/home/viewmodel/home_page1_viewmodel.dart';
import 'package:ecommerce/features/state/state_renderer.impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePageView1 extends StatefulWidget {
  const HomePageView1({Key? key}) : super(key: key);

  @override
  _HomePageView1State createState() => _HomePageView1State();
}

class _HomePageView1State extends State<HomePageView1> {
  final ScrollController _homepage1Controller = ScrollController();
  final ScrollController _productListController = ScrollController();
  double star = 0;
  final HomePage1ViewModel _viewModel = instance<HomePage1ViewModel>();
  _bind() {
    _viewModel.init();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data
                  ?.getScreenWidget(context, _buildContentWidget(context), () {
                _viewModel.init();
              }) ??
              Container();
        });
  }

  Widget _buildContentWidget(BuildContext context) {
    return FadeInDown(
      child: StreamBuilder<Products>(
        stream: _viewModel.outputProduct,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else {
            var products = snapshot.data!.productData;
            return SafeArea(
              child: ListView(
                key: const PageStorageKey(0),
                controller: _homepage1Controller,
                children: [
                  SizedBox(
                    height: context.h536,
                    child: _buildFashionSaleHeader(context),
                  ),
                  SizedBox(
                    height: context.h33,
                  ),
                  _buildProductFooter(products)
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildProductFooter(List<ProductData> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProductNewTitle(context),
        _buildProductList(products),
      ],
    );
  }

  Widget _buildProductList(List<ProductData> products) {
    return Padding(
      padding: EdgeInsets.only(left: context.w6, top: context.h14),
      child: SizedBox(
        height: context.h305,
        child: ListView.builder(
          key: const PageStorageKey(0),
          controller: _productListController,
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _buildProduct(products, index);
          },
        ),
      ),
    );
  }

  Widget _buildProduct(List<ProductData> products, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.w8, vertical: context.h8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  _buildProductImage(products, index),
                  _buildProductNewText(),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.h5,
        ),
        _buildProductRatingBar(),
        SizedBox(
          height: context.h7,
        ),
        _buildProductBrandText(products, index),
        _buildProductTitleText(products, index),
        _buildProductPrice(products, index),
      ],
    );
  }

  Widget _buildProductPrice(List<ProductData> products, int index) {
    return Padding(
      padding: EdgeInsets.only(left: context.w10),
      child: Text(
        products[index].price.floor().toString() + "\$",
        style: getBoldStyle(
          color: ColorManager.black,
          fontSize: context.h14,
        ),
      ),
    );
  }

  Widget _buildProductTitleText(List<ProductData> products, int index) {
    return Padding(
      padding: EdgeInsets.only(left: context.w10),
      child: Text(
        products[index].title,
        style: getBoldStyle(
          color: ColorManager.black,
          fontSize: context.h16,
        ),
      ),
    );
  }

  Widget _buildProductBrandText(List<ProductData> products, int index) {
    return Padding(
      padding: EdgeInsets.only(left: context.w10),
      child: Text(
        products[index].brand,
        style: getRegularStyle(
          color: ColorManager.grey,
          fontSize: context.h11,
        ),
      ),
    );
  }

  Widget _buildProductRatingBar() {
    return Padding(
      padding: EdgeInsets.only(left: context.w6),
      child: RatingStars(
        valueLabelVisibility: false,
        maxValueVisibility: false,
        value: star,
        onValueChanged: (v) {
          setState(() {
            star = v;
          });
        },
        starBuilder: (index, color) => Icon(
          Icons.star,
          color: color,
        ),
        starCount: 5,
        starSize: 20,
        valueLabelRadius: 10,
        starSpacing: 2,
        animationDuration: const Duration(milliseconds: 1000),
        valueLabelPadding:
            const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
        valueLabelMargin: const EdgeInsets.only(right: 8),
        starOffColor: const Color(0xffe7e8ea),
        starColor: ColorManager.star,
      ),
    );
  }

  Widget _buildProductNewText() {
    return Positioned(
      top: context.h8,
      left: context.w10,
      child: Container(
        width: context.w40,
        height: context.h24,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: ColorManager.black),
        child: Center(
          child: Text(
            AppStrings.newText.tr(),
            style: getRegularStyle(
                color: ColorManager.white, fontSize: context.h11),
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage(List<ProductData> products, int index) {
    return SizedBox(
      width: context.w148,
      height: context.h184,
      child: Image.network(
        products[index].productUrl,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildProductNewTitle(BuildContext context) {
    return ListTile(
      title: Text(
        AppStrings.newTextTitle.tr(),
        style: getBoldStyle(color: ColorManager.black, fontSize: context.h34),
      ),
      subtitle: Text(
        AppStrings.neverSeen.tr(),
        style: getLightStyle(color: ColorManager.grey, fontSize: context.h11),
      ),
      trailing: TextButton(
        onPressed: () {},
        child: Text(
          AppStrings.viewAllTxtBtn.tr(),
          style:
              getRegularStyle(color: ColorManager.black, fontSize: context.h11),
        ),
      ),
    );
  }

  Widget _buildFashionSaleHeader(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          left: 0,
          right: 0,
          child: Image(
            image: AssetImage(
              ImageAssets.home,
            ),
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: context.h354,
          left: context.w16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.fashion.tr(),
                style: getBoldStyle(color: ColorManager.white)
                    .copyWith(fontSize: context.h48),
              ),
              Text(
                AppStrings.sale.tr(),
                style: getBoldStyle(color: ColorManager.white)
                    .copyWith(fontSize: context.h48),
              ),
            ],
          ),
        ),
        Positioned(
          top: context.h466,
          left: context.w16,
          child: AuthElevatedButton(
            width: context.h160,
            height: context.w36,
            title: AppStrings.checkBtn.tr(),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
