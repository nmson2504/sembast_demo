# sembast_demo

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
-----------------------------------------
Mô hình DAO (Data Access Object) là một thiết kế mẫu phần mềm (design pattern) được sử dụng để tách biệt logic truy cập dữ liệu khỏi logic xử lý nghiệp vụ trong một ứng dụng. DAO cung cấp một cách tiếp cận tổ chức để quản lý việc truy xuất, lưu trữ, và cập nhật dữ liệu, đồng thời giữ cho các phần khác của ứng dụng không bị ràng buộc với cách dữ liệu được lưu trữ hoặc truy xuất.

Các Thành Phần Chính Của DAO
DAO Interface: Định nghĩa các phương thức mà DAO cần thực hiện, chẳng hạn như các phương thức thêm, xóa, sửa và truy xuất dữ liệu. DAO Interface không chứa bất kỳ logic nào về cách các phương thức đó hoạt động, chỉ định nghĩa các phương thức cần thiết.

DAO Implementation: Cung cấp triển khai thực tế của DAO Interface. Đây là nơi chứa các đoạn mã thực sự thực hiện việc truy xuất dữ liệu từ nguồn dữ liệu (ví dụ: cơ sở dữ liệu, API, file).

Model (Entity): Là các lớp đại diện cho các đối tượng dữ liệu mà DAO sẽ thao tác. Các lớp này thường chứa các thuộc tính và phương thức cần thiết để đại diện cho dữ liệu.

Data Source: Đây là nơi dữ liệu được lưu trữ và quản lý, chẳng hạn như cơ sở dữ liệu SQL, NoSQL, hệ thống tập tin, hoặc dịch vụ web.
# Tổ chức file
```
D:\SON\FLUTTER\SEMBAST_DEMO\LIB
|   books_list copy.dart
|   books_list.dart
|   home_page.dart
|   main.dart
|   
+---dao
|       books_dao.dart - DAO Implementation
|       
+---db
|       data_base.dart - Database connection
|       
\---model
        books_model.dart - Entity
```

home_page.dart - UI home page, link sang books_list.dart
books_list.dart - UI books list in DB
model\books_model.dart - Model - class Books object
db\data_base.dart - Data Source - class AppDatabase chua cac cai dat co ban de open DB
dao\books_dao.dart -  DAO Implementation - claas BooksDao chua cac thao tac voi DB nhu CURD