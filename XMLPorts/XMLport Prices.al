xmlport 70149352 "ICP Prices"
{
    // version CustomerAPI

    Direction = Import;
    UseDefaultNamespace = true;

    schema
    {
        textelement(PriceRecords)
        {
            tableelement(Item;Item)
            {
                XmlName = 'PriceRecord';
                fieldelement(ItemNo;Item."No.")
                {
                    MaxOccurs = Once;
                }
                textelement(tprice)
                {
                    MaxOccurs = Once;
                    XmlName = 'Price';
                }

                trigger OnAfterGetRecord();
                var
                    Price : Decimal;
                    SalesPrice : Record "Sales Price";
                    DiscPercent : Decimal;
                    DiscAmount : Decimal;
                begin

                    // If specific customer/item price record exists use it
                    SalesPrice.RESET;
                    SalesPrice.SETRANGE("Sales Type",SalesPrice."Sales Type"::Customer);
                    SalesPrice.SETRANGE("Sales Code",gCustomerNo);
                    SalesPrice.SETRANGE("Item No.",Item."No.");
                    SalesPrice.SETRANGE("Unit of Measure Code",Item."Base Unit of Measure");
                    SalesPrice.SETFILTER("Ending Date",'%1|>=%2',0D,TODAY);
                    SalesPrice.SETRANGE("Starting Date",0D,TODAY);
                    tPrice := FORMAT(Price - DiscAmount ,0,'<Precision,2:2><standard Format,1>');
                end;

                trigger OnPreXmlItem();
                begin
                    if gCustomerAPIControl.ItemCategoryFilter <> '' then
                         Item.SETFILTER(Item."Item Category Code",gCustomerAPIControl.ItemCategoryFilter);

                    if gCustomerAPIControl.VendorFilter <> '' then
                         Item.SETFILTER(Item."Vendor No.",gCustomerAPIControl.VendorFilter);

                    if gVendorNo <> '' then
                         Item.SETFILTER(Item."Vendor No.",gVendorNo);

                    if gItemFilter <> '' then
                       Item.SETFILTER(Item."No.",gItemFilter);
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPreXmlPort();
    begin
        gCustomerAPIControl.GET(gApiIdentifier);
    end;

    var
        gApiIdentifier : Code[36];
        gCustomerAPIControl : Record CustomerAPIControl;
        gItemFilter : Text[255];
        gVendorNo : Code[10];
        gCustomerNo : Code[10];

    procedure SetParameters(pTransferID : Code[36];pCustomerNo : Code[10];pVendorNo : Code[10];pItemFilter : Text[255]);
    begin
        gApiIdentifier := pTransferID;
        gCustomerNo := pCustomerNo;
        gVendorNo := pVendorNo;
        gItemFilter := pItemFilter;
    end;
}

