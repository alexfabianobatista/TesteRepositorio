unit UPrazoVencimentoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFPrazoVencimentoCons = class(TFTConsulta)
    RgSituacao: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrazoVencimentoCons: TFPrazoVencimentoCons;

implementation

uses UPrazoVencimento_cl;

{$R *.DFM}

procedure TFPrazoVencimentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPrazoVencimento Do
  Begin
    QPrazoVencimento_Cons.Close;
    Case RgSituacao.ItemIndex Of
      0 : QPrazoVencimento_Cons.SetVariable('IND_SITUACAO','ATIVO');
      1 : QPrazoVencimento_Cons.SetVariable('IND_SITUACAO','INATIVO');
      2 : QPrazoVencimento_Cons.SetVariable('IND_SITUACAO',Null);
    End;
    QPrazoVencimento_Cons.Open;
  End;
end;

end.
