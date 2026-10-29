unit UContaCorrenteCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, Variants, Menus,
  ActnList;

type
  TFContaCorrenteCons = class(TFTConsulta)
    ActionList1: TActionList;
    Action1: TAction;
    procedure BtProcurarClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContaCorrenteCons: TFContaCorrenteCons;

implementation

uses UBancoAgencia_cl, UImpressoraFiscal;

{$R *.DFM}

procedure TFContaCorrenteCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMBancoAgencia do
  Begin
    QContaCorrenteCons.Close;
    If Trim(MeTexto.text)<>'' then
      QContaCorrenteCons.SetVariable('DESC_BANCO_AGENCIA',Trim(METexto.Text))
    Else
      QContaCorrenteCons.SetVariable('DESC_BANCO_AGENCIA',Null);
    QContaCorrenteCons.Open;
  End;
End;

procedure TFContaCorrenteCons.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
