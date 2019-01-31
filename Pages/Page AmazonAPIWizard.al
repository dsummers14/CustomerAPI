page 70149362 "ICP AmazonAPIWizard"
{
    PageType = NavigatePage;
    SourceTable = "ICP CustomerAPIControl";
    Caption = 'AmazonAPI Set Up';

    layout
    {
        area(content)
        {
            group(StandardBanner)
            {
                Editable = false;
                Visible = TopBannerVisible and (CurrentStep < 4);
                ShowCaption = false;
                field(MediaResourcesStandard; MediaResourcesStandard."Media Reference")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = Basic;
                }
            }
            group(DoneBanner)
            {
                Editable = false;
                Visible = TopBannerVisible and (CurrentStep = 4);
                ShowCaption = false;
                field(MediaResourcesDone; MediaResourcesDone."Media Reference")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = Basic;
                }
            }
            group(Step1)
            {
                Visible = Currentstep = 1;
                group(General)
                {
                    Caption = 'Customer';
                    InstructionalText = 'Select the customer that will be the Sell-To Customer for imported orders and used to determine the pricing on Inventory Feeds.';
                    field(CustomerNo; CustomerNo)
                    {
                        ApplicationArea = Basic;
                    trigger OnValidate()
                    begin
                        if CustomerNo <> '' then
                          ActionNextAllowed := true
                        else ActionNextAllowed := false; 
                    end;
                    }
                }
            }

            group(Step2)
            {
                Visible = Currentstep = 2;
                group("InventoryFeed")
                {
                    Caption = 'Inventory Feed Filters';
                    InstructionalText = 'Use these filters to limit items being included in the inventory feed.';
                    field(ItemCategoryFilter; ItemCategoryFilter)
                    {
                        ApplicationArea = Basic;
                    }
                    field(VendorFilter; VendorFilter)
                    {
                        ApplicationArea = Basic;
                    }
                    field(LocationFilter; LocationFilter)
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            group(step3)
            {
                Visible = Currentstep = 3;
                group(OrderImport)
                {
                    Caption = 'Order Import';
                    InstructionalText = 'Select the location for imported orders and the number series to use.';
                    field(OrderLocation; OrderLocation)
                    {
                        ApplicationArea = Basic;
                    }
                    field(FulfillmentOrderNos; FulfillmentOrderNos)
                    {
                        Caption = 'Order Number Series';
                        ApplicationArea = Basic;
                    }
                }

            }
            group(step4)
            {
                Visible = CurrentStep = 4;
                group(Done)
                {
                    Caption = 'All Done!';

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionBack)
            {
                ApplicationArea = Basic;
                Enabled = ActionBackAllowed;
                Caption = 'Back';
                Image = PreviousRecord;
                InFooterBar = true;

                trigger OnAction()
                begin
                    Takestep(-1);
                end;
            }
            action(ActionNext)
            {
                ApplicationArea = Basic;
                Enabled = ActionNextAllowed;
                Caption = 'Next';
                Image = NextRecord;
                InFooterBar = true;

                trigger OnAction()
                begin
                    Takestep(1);
                end;
            }
            action(ActionFinish)
            {
                ApplicationArea = Basic;
                Enabled = ActionFinishAllowed;
                Caption = 'Finish';
                Image = Approve;
                InFooterBar = true;


                trigger OnAction()
                var
                    CustomerAPIMgt: Codeunit "ICP CustomerAPIManagement";
                begin
                    CurrPage.Close();
                    CustomerAPIMgt.OpenShipViaList('Amazon');
                end;
            }
        }
    }

    var
        MediaRespositoryDone: Record "Media Repository";
        MediaRespositoryStandard: Record "Media Repository";
        MediaResourcesStandard: Record "Media Resources";
        MediaResourcesDone: Record "Media Resources";
        CurrentStep: Integer;
        ActionBackAllowed: Boolean;
        ActionNextAllowed: Boolean;
        ActionFinishAllowed: Boolean;

        TopBannerVisible: Boolean;

    local procedure SetControls()
    var

    begin
        ActionBackAllowed := CurrentStep > 1;
        ActionNextAllowed := CurrentStep < 4;
        ActionFinishAllowed := CurrentStep = 4;
    end;

    local procedure Takestep(Step: Integer)
    var

    begin
        CurrentStep += Step;
        SetControls();
    end;

    trigger OnOpenPage()
    var

    begin
        Rec.SetFilter(APIIdentifier, 'AmazonAPI');
        if not rec.FindFirst() then begin
            rec.init();
            rec.APIIdentifier := 'AmazonAPI';
            rec.Insert();
        end;

        CurrentStep := 1;
        SetControls();
        ActionNextAllowed := false;
    end;

    trigger onInit()
    var

    begin
        LoadTopBanners();
    end;

    local procedure LoadTopBanners()
    var

    begin
        if MediaRespositoryStandard.get('AssistedSetup-NoText-400px.png', Format(CurrentClientType())) and
         MediaRespositoryDone.get('AssistedSetupDone-NoText-400px.png', Format(CurrentClientType()))
        then
            if MediaResourcesStandard.Get(MediaRespositoryStandard."Media Resources Ref") and
                MediaResourcesDone.Get(MediaRespositoryDone."Media Resources Ref") then
                TopBannerVisible := MediaResourcesDone."Media Reference".HasValue();
    end;


}