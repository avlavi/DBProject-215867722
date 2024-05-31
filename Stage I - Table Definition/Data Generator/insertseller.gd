
[General]
Version=1

[Preferences]
Username=
Password=2596
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=SELLER
Count=400

[Record]
Name=SHIFT
Type=VARCHAR2
Size=100
Data=List(Day,Night)
Master=

[Record]
Name=TOTAL_SALES_
Type=NUMBER
Size=
Data=Random(1, 9999)
Master=

[Record]
Name=SUPERVISOR_ID
Type=NUMBER
Size=
Data=Random(999, 9999999)
Master=

[Record]
Name=SELLER_NUM
Type=NUMBER
Size=
Data=Random(100, 99999)
Master=

[Record]
Name=ID
Type=NUMBER
Size=
Data=List(select ID from Soldier)
Master=

[Record]
Name=SHEKEM_NUM
Type=NUMBER
Size=
Data=List(select Shekem_num from Shekem)
Master=

