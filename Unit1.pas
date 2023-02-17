unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Colors,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, iPub.FMX.SystemBars
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
  self.SystemBars.StatusBarBackgroundColor := ColorPanel1.Color;
  self.SystemBars.NavigationBarBackgroundColor := ColorPanel1.Color;
{$ENDIF}
{$IF Defined(ANDROID)}
  Form1.SystemBars.StatusBarBackgroundColor := ColorPanel1.Color;
  Form1.SystemBars.NavigationBarBackgroundColor := ColorPanel1.Color;
{$ENDIF}
end;

end.
