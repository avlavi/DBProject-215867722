
[General]
Version=1

[Preferences]
Username=
Password=2729
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=HAS
Count=400

[Record]
Name=PRODUCT_NUM
Type=NUMBER
Size=
Data=List(select Product_num from Product)
Master=

[Record]
Name=SHEKEM_NUM
Type=NUMBER
Size=
Data=List(select Shekem_num from Shekem)
Master=

