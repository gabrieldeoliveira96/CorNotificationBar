unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Colors,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects
{$IF Defined(ANDROID)}
    , FMX.Helpers.Android,
  Androidapi.Helpers
{$ENDIF};

type
  TForm1 = class(TForm)
    ColorPanel1: TColorPanel;
    Rectangle1: TRectangle;
    procedure ColorPanel1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ColorPanel1Change(Sender: TObject);
begin

  Rectangle1.Fill.Color := ColorPanel1.Color;

{$IF Defined(IOS)}
  Form1.SystemStatusBar.BackgroundColor := ColorPanel1.Color;
  Form1.SystemStatusBar.Visibility :=
    TFormSystemStatusBar.TVisibilityMode.Visible;
{$ENDIF}
{$IF Defined(ANDROID)}
  CallInUIThreadAndWaitFinishing(
    procedure
    begin
      TAndroidHelper.Activity.getWindow.setStatusBarColor(ColorPanel1.Color);
    end);
{$ENDIF}
end;

end.
