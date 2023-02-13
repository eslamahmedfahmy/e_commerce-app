import 'package:dio/dio.dart';
import 'package:shop_app/core/error/exception.dart';
import 'package:shop_app/core/network/api_constant.dart';
import 'package:shop_app/core/network/error_message_model.dart';
import 'package:shop_app/core/utils/dummy/constant.dart';
import 'package:shop_app/features/Setting/data/model/add_complaint_model.dart';
import 'package:shop_app/features/Setting/data/model/cansel_order_model.dart';
import 'package:shop_app/features/Setting/data/model/get_order_model.dart';
import 'package:shop_app/features/Setting/data/model/log_out_model.dart';
import 'package:shop_app/features/Setting/data/model/notification_model.dart';
import 'package:shop_app/features/Setting/data/model/profile_model.dart';
import 'package:shop_app/features/Setting/domain/usescase/add_complaint_use_case.dart';
import 'package:shop_app/features/Setting/domain/usescase/cansel_order_use_case.dart';
import 'package:shop_app/features/Setting/domain/usescase/notification_use_case.dart';

abstract class SettingBaseRemoteDataSource
{
  Future<ProfileModel> getProfileData();
  Future<List<NotificationModel>> getNotificationData(NotificationDataParameters parameters);
  Future<List<GetOrderModel>> getOrder();
  Future<LogOutModel> logOut();
  Future<CanselOrderModel> canselOrder(CanselOrderParameters parameter);
  Future<AddComplaintModel> addComplaint(AddComplaintParameters parameter);

}

class SettingRemoteDataSource extends SettingBaseRemoteDataSource
{
  @override
  Future<ProfileModel> getProfileData() async
  {
    final response = await Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: ApiConstant.baseUrl,
        headers:
        {
          'Content-Type': 'application/json',
          'lang': 'en',
          "Authorization":token,
        }
    )).get(ApiConstant.getDataProfile);
    print(response);
    if(response.data['status'] == true)
    {
      print('getProfileData*********************************');
      return ProfileModel.fromJson(response.data['data']);
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<NotificationModel>> getNotificationData(NotificationDataParameters parameters) async
  {
    final response = await Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: ApiConstant.baseUrl,
        headers:
        {
          'Content-Type': 'application/json',
          'lang': 'en',
          "Authorization":parameters.token,
        }
    )).get(ApiConstant.getNotifications);

    print(response);
    if(response.data['status'] == true)
    {
      print('getNotificationData*********************************');
      return List<NotificationModel>.from((response.data['data']['data'] as List).map((e) => NotificationModel.fromJson(e)));
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<GetOrderModel>> getOrder() async
  {
    final response = await Dio(BaseOptions(
        receiveDataWhenStatusError: false,
        baseUrl: ApiConstant.baseUrl,
        headers:
        {
          'Content-Type': 'application/json',
          'lang': 'en',
          "Authorization":token,
        }
    )).get(ApiConstant.getOrder);
    print(response);

    if(response.data['status'] == true)
    {
      return List<GetOrderModel>.from((response.data['data']['data'] as List).map((e) => GetOrderModel.fromJson(e)));
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<LogOutModel> logOut() async
  {
    final response = await Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: ApiConstant.baseUrl,
        headers:
        {
          'Content-Type': 'application/json',
          'lang': 'en',
          "Authorization":token,
        }
    )).post(ApiConstant.logOut , data:
    {
      'fcm_token':'SomeFcmToken',
    });
    print(response);

    if(response.data['status'])
    {
      return LogOutModel.fromJson(response.data['data']);
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

  @override
  Future<CanselOrderModel> canselOrder(CanselOrderParameters parameter) async
  {
    final response = await Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: ApiConstant.baseUrl,
        headers:
        {
          'Content-Type': 'application/json',
          'lang': 'en',
          "Authorization":token,
        }
    )).get(ApiConstant.canselOrder(parameter.orderId));
    print(response);
    if(response.data['status'])
    {
      return CanselOrderModel.fromJson(response.data['data']);
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<AddComplaintModel> addComplaint(AddComplaintParameters parameter)async
  {
    final response = await Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: ApiConstant.baseUrl,
        headers:
        {
          'Content-Type': 'application/json',
          'lang': 'en',
        }
    )).post(ApiConstant.addComplaint , data:
    {
      'name': 'ahmed',
      'phone': '22111',
      'email': 'ajdmmed@gmail.com',
      'message': parameter.message,
    });

    if(response.data['status'])
    {
      return AddComplaintModel.fromJson(response.data['data']);
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

}