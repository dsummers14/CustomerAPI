xmlport 70149350 "ICP InventoryFeed"
{
    // version CustomerAPI

    // 
    // //iCepts 07.18.15 DRS Deduct POS ReturnQtySoldNotPosted from Available - Start iCepts1.10
    // //iCepts 05.27.15 DRS Send blocked Items to zero out remote qty iCepts1.09
    // //iCepts 04.21.14 WRW Add "Res. Qty. on RPOs" to the Item Availability calculation iCepts1.08
    // //iCepts 04.08.13 DRS new Fulfillment csv layout iCepts1.07
    // //iCepts 03.15.13 DRS Add Case Pack and Order Multiple iCepts1.06
    // //iCepts 05.17.12 WRW RFM7528 Add exclude drop ship only items checkbox iCepts1.05
    // //iCepts 05.04.12 WRW RFM7516 Add inactive Item Checkbox iCepts1.04
    // //iCepts 02.16.12 RFM7410 Add Item I/E Group Code Filter logic       iCepts1.03
    // //iCepts 10/26/11 Added logic for customer/item specfic pricing      iCepts1.02
    // // SFG RW 091817 Stocking Class Location Filter

    UseDefaultNamespace = true;

    schema
    {
        textelement(Items)
        {
            MaxOccurs = Once;
            tableelement(item;Item)
            {
                XmlName = 'Item';
                fieldelement(ItemNo;Item."No.")
                {
                    MaxOccurs = Once;
                }
                textelement(tavailableqty)
                {
                    MaxOccurs = Once;
                    XmlName = 'QtyAvailable';
                }
                textelement(tprice)
                {
                    MaxOccurs = Once;
                    XmlName = 'Cost';
                }
                textelement(tstatus)
                {
                    MaxOccurs = Once;
                    XmlName = 'Status';
                }
                textelement(tmapprice)
                {
                    MaxOccurs = Once;
                    XmlName = 'MapPrice';
                }
                textelement(tleadtime)
                {
                    MaxOccurs = Once;
                    XmlName = 'LeadTime';
                }

                trigger OnAfterGetRecord();
                var
                    AvailableQty : Decimal;
                    Price : Decimal;
                    ItemUOM : Record "Item Unit of Measure";
                    DiscPercent : Decimal;
                    DiscAmount : Decimal;
                    SalesPrice : Record "Sales Price";
                    LeadTime : Integer;
                    MaxQty : Decimal;
                begin
                    AvailableQty := 0;
                    Price := 0;
                    LeadTime := 0;

                    Item.SETFILTER("Location Filter",gCustomerAPIControl.LocationFilter);
                    Item.CALCFIELDS(Inventory,"Qty. on Sales Order","Qty. on Asm. Component","Assembly BOM");

                    AvailableQty := Item.Inventory - Item."Qty. on Sales Order" - Item."Qty. on Asm. Component";

                    if (AvailableQty < 0) then
                      AvailableQty := 0;

                    if ItemUOM.GET(Item."No.",Item."Base Unit of Measure") then begin
                      if ItemUOM."Qty. per Unit of Measure" <> 0 then
                       AvailableQty := AvailableQty / ItemUOM."Qty. per Unit of Measure";
                    end;

                    // If specific customer/item price record exists use it
                    SalesPrice.RESET;
                    SalesPrice.SETRANGE("Sales Type",SalesPrice."Sales Type"::Customer);
                    SalesPrice.SETRANGE("Sales Code",gCustomerAPIControl.CustomerNo);
                    SalesPrice.SETRANGE("Item No.",Item."No.");
                    SalesPrice.SETRANGE("Unit of Measure Code",Item."Base Unit of Measure");
                    SalesPrice.SETFILTER("Ending Date",'%1|>=%2',0D,TODAY);
                    SalesPrice.SETRANGE("Starting Date",0D,TODAY);

                    tAvailableQty := FORMAT(AvailableQty,0,'<standard Format,1>');
                    tMapPrice := FORMAT(Item."Unit List Price" ,0,'<Precision,2:2><standard Format,1>');
                    tPrice := FORMAT(Price - DiscAmount ,0,'<Precision,2:2><standard Format,1>');
                    tLeadTime := FORMAT(LeadTime,0,'<standard Format,1>');
                end;

                trigger OnPreXmlItem();
                begin
                    if gCustomerAPIControl.ItemCategoryFilter <> '' then
                         Item.SETFILTER(Item."Item Category Code",gCustomerAPIControl.ItemCategoryFilter);
                    if gCustomerAPIControl.VendorFilter <> '' then
                         Item.SETFILTER(Item."Vendor No.",gCustomerAPIControl.VendorFilter);

                    if gItemFilter <> '' then
                       Item.SETFILTER(Item."No.",gItemFilter);


                    Item.SETFILTER("Inventory Posting Group",gCustomerAPIControl.InventoryPostingGroupFilter);
                    Item.SETRANGE("Created From Nonstock Item",false);
                    Item.SETRANGE(Blocked,false);
                    Item.SETFILTER("Location Filter",gCustomerAPIControl.LocationFilter);
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
        gLocationFilter : Text[1024];

    procedure SetParameters(pTransferID : Code[36];pItemFilter : Text[255]);
    begin
        gApiIdentifier := pTransferID;
        gItemFilter := pItemFilter;
    end;
}

