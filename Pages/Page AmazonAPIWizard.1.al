page 70149362 "ICP AmazonAPIWizard"
{
    PageType = NavigatePage;
    SourceTable = "ICP CustomerAPIControl";
    CaptionML = ENU='AmazonAPI Set Up';
    
    layout
    {
        area(content)
        {
            group(StandardBanner)
            {
               Editable = false;
               Visible = TopBannerVisible and (CurrentStep < 4);
               ShowCaption = false;
               field(MediaResourcesStandard;MediaResourcesStandard."Media Reference")
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
               field(MediaResourcesDone;MediaResourcesDone."Media Reference")
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
                    CaptionML = ENU='Customer';
                    InstructionalTextML = ENU='Select the customer that will be the Sell-To Customer for imported orders and used to determine the pricing on Inventory Feeds.';
                    field(CustomerNo;CustomerNo)
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            group(Step2)
            {
                Visible = Currentstep = 2;
                group("InventoryFeed"){
                    CaptionML = ENU='Inventory Feed Filters';
                    InstructionalTextML = ENU='Use these filters to limit items being included in the inventory feed.';
                    field(ItemCategoryFilter;ItemCategoryFilter)
                    {
                        ApplicationArea = Basic;
                    }
                    field(VendorFilter;VendorFilter)
                    {
                        ApplicationArea = Basic;
                    }
                    field(LocationFilter;LocationFilter)
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
                    CaptionML = ENU='Order Import';
                    InstructionalTextML = ENU='Select the location for imported orders and the number series to use.';
                    field(OrderLocation;OrderLocation)
                    {
                        ApplicationArea = Basic;
                    }
                    field(FulfillmentOrderNos;FulfillmentOrderNos)
                    {
                        CaptionML = ENU='Order Number Series';
                        ApplicationArea = Basic;
                    }
                }    

            }
            group(step4)
            {
                Visible = CurrentStep = 4;
                group(Done)
                {
                    CaptionML = ENU='All Done!';
                    
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
               CaptionML = ENU='Back';
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
               CaptionML = ENU='Next';
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
               CaptionML = ENU='Finish';
               Image = Approve;
               InFooterBar = true;
               
               trigger OnAction()
               begin
                   CurrPage.Close();
               end;
           }
        }
    }
    
    var
        CurrentStep: Integer;
        ActionBackAllowed: Boolean;
        ActionNextAllowed: Boolean;
        ActionFinishAllowed: Boolean;
        
        MediaRespositoryStandard: Record "Media Repository";
        MediaRespositoryDone: Record "Media Repository";
        MediaResourcesStandard: Record "Media Resources";
        MediaResourcesDone: Record "Media Resources";
        TopBannerVisible: Boolean;
        
    local procedure SetControls()
    var
        
    begin
        ActionBackAllowed := CurrentStep > 1;
        ActionNextAllowed := CurrentStep < 4;
        ActionFinishAllowed := CurrentStep = 4;
    end;

local procedure Takestep(Step:Integer)
var
    
begin
    CurrentStep += Step;
    SetControls();
end;

trigger OnOpenPage()
var

begin
    Rec.SetFilter(APIIdentifier,'AmazonAPI');
    if not rec.FindFirst() then begin
        rec.init;
        rec.APIIdentifier := 'AmazonAPI';
        rec.Insert;
    end;

    CurrentStep := 1;
    SetControls();
end;

trigger onInit()
var
    
begin
    LoadTopBanners();
end;

local procedure LoadTopBanners()
var

begin
    if MediaRespositoryStandard.get('AssistedSetup-NoText-400px.png',Format(CurrentClientType)) and
     MediaRespositoryDone.get('AssistedSetupDone-NoText-400px.png',Format(CurrentClientType))
    then
    if MediaResourcesStandard.Get(MediaRespositoryStandard."Media Resources Ref") and 
        MediaResourcesDone.Get(MediaRespositoryDone."Media Resources Ref") then
        TopBannerVisible := MediaResourcesDone."Media Reference".HasValue();
end;

local procedure MyProcedure()
var
    myInt: Integer;
begin
    
end;
}