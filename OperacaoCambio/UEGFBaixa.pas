unit UEGFBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, DBCtrls, Buttons;

type
  TFEGFBaixa = class(TForm)
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
  FEGFBaixa: TFEGFBaixa;

implementation

uses UEGF_cl;

{$R *.DFM}

procedure TFEGFBaixa.FormActivate(Sender: TObject);
begin
  DBEdit1.SetFocus;
end;

end.
