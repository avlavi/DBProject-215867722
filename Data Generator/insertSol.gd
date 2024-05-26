
[General]
Version=1

[Preferences]
Username=
Password=2822
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=SOLDIER
Count=1000

[Record]
Name=ID
Type=NUMBER
Size=
Data=Sequence(314762, [43], [WithinParent])
Master=

[Record]
Name=IDF_NUM
Type=NUMBER
Size=
Data=Random(1, 999999)
Master=

[Record]
Name=NAME
Type=VARCHAR2
Size=100
Data=FirstName
Master=

[Record]
Name=ENLISTMENT_DATE_
Type=DATE
Size=
Data=Random(1/1/1980, 1/3/2024)
Master=

[Record]
Name=RANK
Type=VARCHAR2
Size=100
Data=List(Turai,Turai Rishon,Rav Turai,Samal,Samal Rishon,Rav Samal,Rav Samal Rishon,Rav Samal Mitkadem,Segen Mishneh,Segen,Segen Rishon,Seren,Rav Seren,Sgan Aluf,Aluf Mishne,Tat Aluf,Aluf,Rav Aluf)
Master=

