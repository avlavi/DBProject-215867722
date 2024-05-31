
[General]
Version=1

[Preferences]
Username=
Password=2563
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=DRIVER
Count=400

[Record]
Name=LICENSE
Type=NUMBER
Size=
Data=Random(100, 9999999)
Master=

[Record]
Name=STATUS
Type=VARCHAR2
Size=100
Data=List(Valid,Expired,Suspended,Revoked,Pending,Provisional,Restricted,Disqualified,Cancelled,Denied,Active,Inactive,RenewalRequired,Temporary,Probationary,ConditionallyValid,UnderReview,Invalid,RestrictedConditional)
Master=

[Record]
Name=LICENSE_TYPE
Type=VARCHAR2
Size=100
Data=List(A,B,C,D)
Master=

[Record]
Name=ID
Type=NUMBER
Size=
Data=Sequence(314762, [43], [WithinParent])
Master=

[Record]
Name=LICENSE_NUM
Type=NUMBER
Size=
Data=List(select License_num from Vehicle)
Master=

