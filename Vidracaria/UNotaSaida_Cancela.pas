unit UNotaSaida_Cancela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, Buttons, Db, DBTables;

type
  TFNotaSaida_Cancela = class(TForm)
    Label22: TLabel;
    BtConsMotivo: TBitBtn;
    EdMotivo: TEdit;
    MEMotivo: TMaskEdit;
    BtOk: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BtOkClick(Sender: TObject);
    procedure BtConsMotivoClick(Sender: TObject);
    procedure MEMotivoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaSaida_Cancela: TFNotaSaida_Cancela;

implementation

uses UNotaSaida_cl, UOracle_cl, UMotivoCons, UMotivo_cl;

{$R *.DFM}

procedure TFNotaSaida_Cancela.BtOkClick(Sender: TObject);
Var wComando : String;
begin
  if Trim(MEMotivo.Text) = '' then
  begin
    MessageDlg('Motivo não informado!',mtInformation,[mbOk],0);
    ModalResult := mrNone;
  end
  else
  With DMNotaSaida do
  Begin
    Try
      DMOracle.DBCemapa.StartTransaction;
      if QNotaSaidaCod_Nota_Conta_Corrente.Value > 0 then
      begin
        if MessageDlg('Esta nota foi gerada a partir de Notas de Conta Corrente!'
                      +Chr(13)+'O processo de Cancelamento não poderá mais ser desfeito!'
                      +Chr(13)+'Continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
           Abort;
        // Volta Conta Corrente
        QVoltaContaCorrente.Close;
        QVoltaContaCorrente.SetVariable('COD_NOTA',QNotaSaidaCod_Nota_Cab.Value);
        QVoltaContaCorrente.ExecSQL;
      end;
      QAtzNota.Close;
      QAtzNota.SetVariable('COD_NOTA_CAB',QNotaSaidaCod_Nota_Cab.Value);
      QAtzNota.Open;
      QAtzNota.Edit;
      QAtzNotaInd_Situacao.Value := '3';
      QAtzNotaCod_Motivo_Canc.Value := StrToInt(Trim(MEMotivo.Text));
      QAtzNotaCod_Contrato_Vend.Text := '';
      QAtzNota.Post;
      QItemNF.First;
      While not QItemNF.Eof do
      Begin
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        wComando := 'DELETE FROM TB_BAIXA_PEDIDO';
        wComando := wComando + ' WHERE COD_NOTA_ITEM = '+FloatToStr(QItemNFCod_Nota_Item.Value);
        DMOracle.QExecSQL.SQL.Add(wComando);
        DMOracle.QExecSQL.ExecSQL;
        QItemNF.Next;
      End;
      
      DMOracle.DBCemapa.Commit;

      QNotaSaida.Close;
      QNotaSaida.Open;

    except
      if QAtzNota.State <> dsBrowse then
         QAtzNota.Cancel;
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  End;
end;

procedure TFNotaSaida_Cancela.BtConsMotivoClick(Sender: TObject);
begin
  If FMotivoCons = Nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  If FMotivoCons.ShowModal = mrOk then
  Begin
    MEMotivo.Text := DMMotivo.QMotivoConsCod_Motivo.Text;
    MEMotivoExit(Self);
  End;
end;

procedure TFNotaSaida_Cancela.MEMotivoExit(Sender: TObject);
begin
  EdMotivo.Text := DMOracle.BuscaNome('SELECT DESC_MOTIVO FROM TB_MOTIVO','COD_MOTIVO = '+MEMotivo.Text);
end;

end.
