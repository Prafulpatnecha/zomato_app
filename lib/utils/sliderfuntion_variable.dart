import 'package:zomato/utils/globle_values.dart';

import 'globle_product_list.dart';

void imageMap()
{
  for(int i=0; i<productDetailsList.length;i++)
  {
    List _list=[];
    for(int j=0; j<productDetailsListJoin.length;j++)
    {
      if(productDetailsList[i]['productNo']==productDetailsListJoin[j]['productNo'])
      {
        _list.add(productDetailsListJoin[j]);
      }
    }
    totalBillMap.addAll({i.toString():_list});
  }
  print(totalBillMap['0'][2]['productName']);
}