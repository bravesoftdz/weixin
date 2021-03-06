unit Unit1;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, Vcl.Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompLabel,
  IWCompMemo, IWCompButton;

type
  TIWForm1 = class(TIWAppForm)
    iwlbl1: TIWLabel;
    iwlbl2: TIWLabel;
    IWButton1: TIWButton;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWButton1Click(Sender: TObject);
  public
  end;

implementation

uses
  RegularExpressions;

{$R *.dfm}

procedure TIWForm1.IWAppFormCreate(Sender: TObject);
var
  match: TMatch;
begin
  match := TRegEx.match(WebApplication.ReferringURL,
    '((http|ftp|https)://)(([a-zA-Z0-9\._-]+\.[a-zA-Z]{2,6})|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,4})*');
  if match.Success then
    iwlbl1.Caption := match.Value + WebApplication.AppUrlBase + 'wxapi?wid=1'
  else
    iwlbl1.Caption := WebApplication.ApplicationURL + '/wxapi?wid=1'
end;

procedure TIWForm1.IWButton1Click(Sender: TObject);
begin
 Caption:='i am commit' ;
end;

initialization

TIWForm1.SetAsMainForm;

end.
