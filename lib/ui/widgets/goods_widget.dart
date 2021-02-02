import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/goods_entity.dart';
import 'package:mall/ui/widgets/cached_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef ItemClick(int value);

class GoodsWidget extends StatelessWidget {
  GoodsEntity _goodsEntity;
  ItemClick _itemClick;

  GoodsWidget(this._goodsEntity, this._itemClick);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: AppColors.COLOR_FFFFFF,
          alignment: Alignment.center,
          padding: EdgeInsets.only(left:ScreenUtil().setWidth(AppDimens.DIMENS_20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CachedImageView(
                ScreenUtil().setWidth(360),
                ScreenUtil().setWidth(360),
                _goodsEntity.picUrl,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(AppDimens.DIMENS_20),
                    right: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
                child: Text(
                    _goodsEntity.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:FMTextStyle.color_333333_size_42
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding:  EdgeInsets.only(bottom:ScreenUtil().setWidth(AppDimens.DIMENS_20)),
                child: Text(
                    "${AppStrings.DOLLAR}${_goodsEntity.retailPrice}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FMTextStyle.color_ff5722_size_42
                ),
              ),
            ],
          )),
      onTap: () => _itemClick(_goodsEntity.id),
    );
  }
}
