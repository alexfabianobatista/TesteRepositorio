unit UContratoVendAlt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, Db;

type
  TFContratoVendAlt = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DsContratoVendAlt: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoVendAlt: TFContratoVendAlt;

implementation

uses Ucontrato_cl;

{$R *.DFM}

end.
