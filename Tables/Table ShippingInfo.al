table 70149352 "ICP ShippingInfo"
{

    fields
    {
        field(1; OrderNumber; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Sales Header"."No." where ("Document Type" = filter (Order));
        }
        field(2; TrackingNumber; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(3; DateShipped; date)
        { 
            DataClassification = CustomerContent;
        }
        field(4; Carrier; Text[30])
        { 
            DataClassification = CustomerContent;
        }
        field(5; Service; Text[30])
        { 
            DataClassification = CustomerContent;
        }
        field(6; CustomerOrderNumber; Text[30])
        { 
            DataClassification = CustomerContent;
        }
        field(7; CustomerNumber; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(8; FreightCost; Decimal)
        { 
            DataClassification = CustomerContent;
        }
        field(9; MarketPlaceOrderNumber; Text[30])
        { 
            DataClassification = CustomerContent;
        }
        field(10; Processed; Boolean)
        {
            DataClassification = CustomerContent;
            InitValue = false;
        }
    }

    keys
    {
        key(PK; OrderNumber, TrackingNumber)
        {
            Clustered = true;
        }
    }

    var

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}