
[General]
Version=1

[Preferences]
Username=
Password=2218
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=BRINGS_TO
Count=400

[Record]
Name=DELIVERY_NUM
Type=NUMBER
Size=
Data=List(select Delivery_num from Delivery)
Master=

[Record]
Name=SHEKEM_NUM
Type=NUMBER
Size=
Data=List(select Shekem_num from Shekem)
Master=

