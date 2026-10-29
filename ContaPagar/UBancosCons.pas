unit UBancosCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, DBTables, variants,
  Menus, ActnList;

type
  TFBancosCons = class(TFTConsulta)
    ActionList1: TActionList;
    Action1: TAction;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBancosCons: TFBancosCons;

implementation

uses UBancoAgencia_cl, UImpressoraFiscal;

{$R *.DFM}

procedure TFBancosCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMBancoAgencia do
  Begin
    QBancoAgenciaCons.Close;
    If Trim(METexto.text)<>'' then
      QBancoAgenciaCons.SetVariable('DESC_BANCO_AGENCIA',Trim(METexto.Text))
    Else
      QBancoAgenciaCons.SetVariable('DESC_BANCO_AGENCIA',Null);
    QBancoAgenciaCons.Open;
  End;
end;

procedure TFBancosCons.FormShow(Sender: TObject);
begin
  inherited;
  Button1Click(Self);
end;

procedure TFBancosCons.Button1Click(Sender: TObject);
begin
  inherited;
//  DMBancoAgencia.QBancoAgenciaCons.Close;
end;

procedure TFBancosCons.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
