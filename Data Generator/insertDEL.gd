
[General]
Version=1

[Preferences]
Username=
Password=2651
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=DELIVERY
Count=400

[Record]
Name=DELIVERY_NUM
Type=NUMBER
Size=
Data=Random(100, 99999)
Master=

[Record]
Name=STATUS
Type=VARCHAR2
Size=100
Data=List(OrderReceived,Processing,AwaitingPayment,PaymentConfirmed,Packaging,AwaitingShipment,Shipped,InTransit,OutforDelivery,Delivered,AttemptedDelivery,DeliveryFailed,ReturnedtoSender,Canceled,OnHold,AwaitingPickup,ReadyforPickup,PickedUp,Delayed,Lost,Damaged)
Master=

[Record]
Name=DELIVERY_DATE
Type=DATE
Size=
Data=Random(1/1/2000, 1/1/2030)
Master=

[Record]
Name=ID
Type=NUMBER
Size=
Data=List(select ID from Driver)
Master=

