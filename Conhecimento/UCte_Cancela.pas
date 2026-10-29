unit UCte_Cancela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, Buttons, Db, DBTables, NfeCliente;

type
  TFCte_Cancela = class(TForm)
    Label22: TLabel;
    BtConsMotivo: TBitBtn;
    EdMotivo: TEdit;
    MEMotivo: TMaskEdit;
    BtOk: TBitBtn;
    BitBtn2: TBitBtn;
    CBEmail: TCheckBox;
    procedure BtOkClick(Sender: TObject);
    procedure BtConsMotivoClick(Sender: TObject);
    procedure MEMotivoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCte_Cancela: TFCte_Cancela;

implementation

uses UConhecimento_cl, UOracle_cl, UMotivoCons, UMotivo_cl,
  UAguardoNfe, UNfe_cl, StrUtils, UBiblioteca, UCteLote_cl, CteUtils;

{$R *.DFM}

procedure TFCte_Cancela.BtOkClick(Sender: TObject);
Var
  wComando: String;
//  ExecCanc, ExecEmail: TNfeExecucao;
begin
  if Trim(MEMotivo.Text) = '' then
  begin
    MessageDlg('Motivo não informado!',mtInformation,[mbOk],0);
    ModalResult := mrNone;
  end
  else
  With DMConhecimento do
  Begin
    Try
      if (Length(EdMotivo.Text) < 15) then
      begin
        MessageDlg('Justificativa precisa ter ao menos 15 caracteres.', mtError, [mbOK], 0);
        Exit;
      end;

      if (not QConhecimentoCadDESC_CHAVE_ACESSO_CTE.IsNull) then
      begin
        with DMNfe do
        begin
          SetaCte(QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value, True);
          if not (QCteind_aprovado.Value or QCteind_denegado.Value) then
          begin
            MessageDlg('O CT-e não está autorizado na SEFAZ, por isso não é permitido emitir cancelamento.'+#13+#10+
                'Se você emitiu este conhecimento a pouco tempo, experimente aguardar um pouco.'+#13+#10+
                'Se este conhecimento não foi aceito pela SEFAZ, basta excluí-lo.', mtError, [mbOK], 0);
            Exit;
          end
          else
          begin
            if not (QCteind_cancelado.Value or QCteind_denegado.Value) then
            begin
              DMNfe.RegistraEventoCTe(QConhecimentoCadCOD_CONHECIMENTO.Value, TP_EVENTO_DFE_CANCELAMENTO, Trim(EdMotivo.Text));
            end;
          end;
        end;
      end;
      DMNfe.QCte.Refresh;
      if DMNfe.QCteind_cancelado.Value then
      begin
        DMOracle.DBCemapa.StartTransaction;         
        QConhecimentoCad.Edit;
        QConhecimentoCadIND_SITUACAO.Value := '3';
        QConhecimentoCad.Post;
        DMOracle.DBCemapa.Commit
      end;

      QConhecimentoCad.RefreshRecord;
    except
      if QConhecimentoCad.State <> dsBrowse then
         QConhecimentoCad.Cancel;
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  End;
end;

procedure TFCte_Cancela.BtConsMotivoClick(Sender: TObject);
begin
  If FMotivoCons = Nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  If FMotivoCons.ShowModal = mrOk then
  Begin
    MEMotivo.Text := DMMotivo.QMotivoConsCod_Motivo.Text;
    MEMotivoExit(Self);
  End;
end;

procedure TFCte_Cancela.MEMotivoExit(Sender: TObject);
begin
  if Trim(MEMotivo.Text) <> '' then
    EdMotivo.Text := DMOracle.BuscaNome('SELECT DESC_MOTIVO FROM TB_MOTIVO','COD_MOTIVO = '+MEMotivo.Text);
end;

end.
