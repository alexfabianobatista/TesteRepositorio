unit UEGFBaixaPenhor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, Mask, DBCtrls;

type
  TFEGFBaixaPenhor = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEGFBaixaPenhor: TFEGFBaixaPenhor;

implementation

uses UEGF_cl;

{$R *.DFM}

procedure TFEGFBaixaPenhor.FormActivate(Sender: TObject);
begin
  DBEdit1.SetFocus;
end;

end.
