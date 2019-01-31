page 70149363 "ICP EbayAPIWizard"
{
    PageType = NavigatePage;
    SourceTable = "ICP CustomerAPIControl";
    Caption='EbayAPI Setup';
    
    layout
    {
        area(content)
        {
            group(Group96)
            {
               Editable = false;
               Visible = TopBannerVisible and (CurrentStep < 3);
               ShowCaption = false;
               field(MediaResourcesStandard;MediaResourcesStandard."Media Reference")
               {
                 Editable = false;
                 ShowCaption = false;
                 ApplicationArea = Basic;  
               }
            }
            group(group98)
            {
               Editable = false;
               Visible = TopBannerVisible and (CurrentStep = 3);
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
                Caption='Step 1';
                group(Identifier)
                {
                    field(APIIdentifier;APIIdentifier)
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            group(Step2)
            {
                Visible = Currentstep = 2;
                Caption = 'Step 2';
            }
            group(Step3)
            {
                Visible = Currentstep = 3;
                Caption='All Done!';
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
               Caption='Back';
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
               Caption='Next';
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
               Caption='Finish';
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
        MediaRespositoryStandard: Record "Media Repository";
        MediaRespositoryDone: Record "Media Repository";
        MediaResourcesStandard: Record "Media Resources";
        MediaResourcesDone: Record "Media Resources";
        TopBannerVisible: Boolean;
        CurrentStep: Integer;
        ActionBackAllowed: Boolean;
        ActionNextAllowed: Boolean;
        ActionFinishAllowed: Boolean;
        
    local procedure SetControls()
    var
        
    begin
        ActionBackAllowed := CurrentStep > 1;
        ActionNextAllowed := CurrentStep < 3;
        ActionFinishAllowed := CurrentStep = 3;
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
    if MediaRespositoryStandard.get('AssistedSetup-NoText-400px.png',Format(CurrentClientType())) and
     MediaRespositoryDone.get('AssistedSetupDone-NoText-400px.png',Format(CurrentClientType()))
    then
    if MediaResourcesStandard.Get(MediaRespositoryStandard."Media Resources Ref") and 
        MediaResourcesDone.Get(MediaRespositoryDone."Media Resources Ref") then
        TopBannerVisible := MediaResourcesDone."Media Reference".HasValue();
end;

}