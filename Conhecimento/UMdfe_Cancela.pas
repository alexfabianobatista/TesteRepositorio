unit UMdfe_Cancela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, Buttons, Db, DBTables, NfeCliente;

type
  TFMdfe_Cancela = class(TForm)
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
  FMdfe_Cancela: TFMdfe_Cancela;

implementation

uses UManifesto_cl, UOracle_cl, UMotivoCons, UMotivo_cl,
  UAguardoNfe, UNfe_cl, StrUtils, UBiblioteca, UMdfeLote_cl, MdfeUtils;

{$R *.DFM}

procedure TFMdfe_Cancela.BtOkClick(Sender: TObject);
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
  With DMManifesto do
  Begin
    Try
      if (Length(EdMotivo.Text) < 15) then
      begin
        MessageDlg('Justificativa precisa ter ao menos 15 caracteres.', mtError, [mbOK], 0);
        Exit;
      end;

      if (not QManifestoDESC_CHAVE_ACESSO.IsNull) then
      begin
        with DMNfe do
        begin
          SetaMdfe(QManifestoDESC_CHAVE_ACESSO.Value, True);
          if not (QMdfeind_aprovado.Value or QMdfeind_denegado.Value) then
          begin
            MessageDlg('MDF-e não está autorizado na SEFAZ, por isso não é permitido emitir cancelamento.'+#13+#10+
                'Se você emitiu este Manifesto a pouco tempo, experimente aguardar um pouco.'+#13+#10+
                'Se este Manifesto não foi aceito pela SEFAZ, basta excluí-lo.', mtError, [mbOK], 0);
            if QManifesto.State <> dsBrowse then
              QManifesto.Cancel;
            Exit;
          end
          else
          begin
            if not (QMdfeind_cancelado.Value or QMdfeind_denegado.Value OR QMdfeind_encerrado.Value) then
            begin
              DMNfe.RegistraEventoMDFe(QManifestoCOD_MANIFESTO.Value, TP_EVENTO_DFE_CANCELAMENTO, Trim(EdMotivo.Text));
            end;
          end;
        end;
      end;
      DMNfe.QMdfe.Refresh;
      if DMNfe.QMdfeind_cancelado.Value then
      begin
        DMOracle.DBCemapa.StartTransaction;
      
        QManifesto.Edit;
        QManifestoIND_SITUACAO.Value := '3';
        QManifesto.Post;
        DMOracle.DBCemapa.Commit;
      end;

      QManifesto.Close;
      QManifesto.Open;

    except
      if QManifesto.State <> dsBrowse then
         QManifesto.Cancel;
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  End;
end;

procedure TFMdfe_Cancela.BtConsMotivoClick(Sender: TObject);
begin
  If FMotivoCons = Nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  If FMotivoCons.ShowModal = mrOk then
  Begin
    MEMotivo.Text := DMMotivo.QMotivoConsCod_Motivo.Text;
    MEMotivoExit(Self);
  End;
end;

procedure TFMdfe_Cancela.MEMotivoExit(Sender: TObject);
begin
  if Trim(MEMotivo.Text) <> '' then
    EdMotivo.Text := DMOracle.BuscaNome('SELECT DESC_MOTIVO FROM TB_MOTIVO','COD_MOTIVO = '+MEMotivo.Text);
end;

end.
