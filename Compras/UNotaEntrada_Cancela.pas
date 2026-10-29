unit UNotaEntrada_Cancela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, Db, DBTables;

type
  TFNotaEntrada_Cancela = class(TForm)
    BtOk: TBitBtn;
    BitBtn2: TBitBtn;
    Label22: TLabel;
    BtConsMotivo: TBitBtn;
    EdMotivo: TEdit;
    MEMotivo: TMaskEdit;
    procedure BtOkClick(Sender: TObject);
    procedure BtConsMotivoClick(Sender: TObject);
    procedure MEMotivoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaEntrada_Cancela: TFNotaEntrada_Cancela;

implementation

uses UNotaEntrada_cl, UOracle_cl, UMotivoCons, UMotivo_cl,
  UNfe_cl, UAguardoNfe, UBiblioteca, UNfEletronicaLote_cl, NfeUtils,
  UDevolucaoTroca_cl;

{$R *.DFM}

procedure TFNotaEntrada_Cancela.BtOkClick(Sender: TObject);
var
  ExecCanc: TExecucaoCancela;
begin
  If Trim(MEMotivo.Text) = '' then
  Begin
    ShowMessage('Motivo Não Informado!');
    ModalResult := mrNone;
  End
  Else
  With DMNotaEntrada do
  Begin
    Try
      DMOracle.DBCemapa.StartTransaction;
      QAtzNota.Close;
      QAtzNota.SetVariable('COD_NOTA_CAB',QNotaEntradaCod_Nota_Cab.Value);
      QAtzNota.Open;
      QAtzNota.Edit;
      QAtzNotaIND_SITUACAO.Value := '3';
      QAtzNotaCOD_MOTIVO_CANC.Value := StrToInt(Trim(MEMotivo.Text));
      QAtzNota.Post;
//      QAtuBaixaOC.Open;
//      QItemNF.First;
//      While not QItemNF.Eof do
//      Begin
//        QAtzItemOC.Close;
//        QAtzItemOC.SetVariable('COD_ORDEM_COMPRA_ITEM',QAtuBaixaOCCod_Ordem_Compra_item.Value);
//        QAtzItemOC.SetVariable('QT_ACRESCENTAR',-QAtuBaixaOCQt_Baixa.Value);
//        QAtzItemOC.ExecSQL;
//        QItemNF.Next;
//      End;
      if (not DMNotaEntrada.QNotaEntradaDESC_CHAVE_ACESSO.isNull) then
      begin
        with DMNfe do
        begin
          SetaNfe(DMNotaEntrada.QNotaEntradaDESC_CHAVE_ACESSO.Value, True);
          if (not QNfeind_aprovado.Value) then
          begin
            MessageDlg('Nota não está autorizada na SEFAZ, por isso não é permitido emitir cancelamento.'+#13+#10+
                'Se você emitiu essa NF a pouco tempo, experimente aguardar um pouco.'+#13+#10+
                'Se essa NF não foi aceita pela SEFAZ, basta excluí-la.', mtError, [mbOK], 0);
            if QAtzNota.State <> dsBrowse then
              QAtzNota.Cancel;
            DMOracle.DBCemapa.Rollback;
            Exit;
          end
          else
          begin
            if not (QNfeind_cancelado.Value or QNfeind_denegado.Value) then
            begin
              with DMNfEletronicaLote do
              begin
                QGeraNfe.Close;
                QGeraNfe.ClearVariables;
                QGeraNfe.SetVariable('COD_NOTA_CAB', QNotaEntradaCOD_NOTA_CAB.Value);
                QGeraNfe.Open;

                QGeraNfeCanc.Close;
                QGeraNfeCanc.Open;

                if QGeraNfeCanc.RecordCount = 0 then
                  QGeraNfeCanc.Insert
                else
                  QGeraNfeCanc.Edit;

                QGeraNfeCancDESC_CHAVE_ACESSO.Value := copy( QNotaEntradaDESC_CHAVE_ACESSO.Value,4, 44);
                QGeraNfeCancNSEQ_EVENTO.Value := 1;
                QGeraNfeCancID_EVENTO.Value := 'ID110111' + copy( QNotaEntradaDESC_CHAVE_ACESSO.Value,4, 44) + '01';
                QGeraNfeCancDT_EVENTO.Value := Now;
                QGeraNfeCancDESC_JUSTIFICATIVA.Value := EdMotivo.Text;
                QGeraNfeCancDESC_XML_CANC_NFE.Value := TNfeUtils.GeraXMLNFeCanc(QNotaEntradaCOD_NOTA_CAB.Value);
                QGeraNfeCanc.Post;
                CarregaNotaCons(QNotaEntradaCOD_NOTA_CAB.Value);
                if (CDSNfeLoteItemConsCOD_NOTA_CAB.Value =
                    QNotaEntradaCOD_NOTA_CAB.Value) then
                begin
                  SetSelecaoItem;
                  CDSNfeLoteItemCons.Edit;
                  CDSNfeLoteItemConsDESC_JUST_CANCELA.Value := EdMotivo.Text;
                  CDSNfeLoteItemCons.Post;

                  if CDSNfeLoteItemConsIND_NFSE.Value = 'NAO' then
                    AcaoEmLote(TAcoesLote.Create.Add(alCancela))
                  else
                    AcaoEmLote(TAcoesLote.Create.Add(alCancelaNFSe));

                  DMNfe.SetaNfe(QNotaEntradaDESC_CHAVE_ACESSO.Value, True);
                  if QNfeind_cancelado.Value then
                    with DMDevolucaoTroca do
                    begin
                      QValeProduto.Close;
                      QValeProduto.ClearVariables;
                      QValeProduto.SetVariable('COD_NOTA_CAB_DEV', QNotaEntradaCOD_NOTA_CAB.Value);
                      QValeProduto.Open;

                      if QValeProduto.RecordCount > 0 then
                      begin
                        DMOracle.QExecSQL.close;
                        DMOracle.QExecSQL.SQL;
                        DMOracle.QExecSQL.SQL.Clear;
                        DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_VALE_PRODUTO_ITEM WHERE COD_VALE_PRODUTO = ' + QValeProdutoCOD_VALE_PRODUTO.Text);
                        DMOracle.QExecSQL.ExecSQL;
                        QValeProduto.Delete;
                      end;
                    end;
                  CDSNfeLoteItemCons.Close;
                  CDSNfeLoteItemCons.Open;
                  while (CDSNfeLoteItemConsCOD_NOTA_CAB.Value <> QNotaEntradaCOD_NOTA_CAB.Value)
                      and (not CDSNfeLoteItemCons.Eof) do
                    CDSNfeLoteItemCons.Next;
                  if (CDSNfeLoteItemConsCOD_NOTA_CAB.Value = QNotaEntradaCOD_NOTA_CAB.Value) and
                      (CDSNfeLoteItemConsind_cancelado.Value or CDSNfeLoteItemConsind_denegado.Value) then
                  begin
                    try
                      SetSelecaoItem;
                      //if CBEmail.Checked then
//                        begin
//                          CDSNfeLoteItemCons.Edit;
//
//                          CDSNfeLoteItemConsEMAIL_XML.Value := 'S';
//                          CDSNfeLoteItemConsEMAIL_PDF.Value := 'S';
//                          CDSNfeLoteItemCons.Post;
//                          AcaoEmLote(TAcoesLote.Create.Add(alEmail));
//                        end;
                    except
                      on E: Exception do
                        MessageDlg('Não foi possível enviar e-mail de notificação.'+#13+#10+
                            'Erro: ' + E.Message, mtWarning, [mbOK], 0);
                    end;
                  end
                  else
                  begin
                    if QAtzNota.State <> dsBrowse then
                    QAtzNota.Cancel;
                    DMOracle.DBCemapa.Rollback;
                    Exit;
                  end;
                end
                else
                  MessageDlg('Falha na busca da nota para enviar e-mail.'+#13+#10+
                      'E-mail não será enviado.', mtWarning, [mbOK], 0);
              end;
            end;
          end;
        end;
      end;
      DMOracle.DBCemapa.Commit;
      QNotaEntrada.Close;
      QNotaEntrada.Open;
    Except
      on e: Exception do
      begin
        If QAtzNota.State <> dsBrowse then
          QAtzNota.Cancel;
        MessageDlg('Não é possível cancelar esta nota!'+#13+#10+e.Message, mtError, [mbOK], 0);
        Abort;
      end;
    End;
  End;
end;


procedure TFNotaEntrada_Cancela.BtConsMotivoClick(Sender: TObject);
begin
  If FMotivoCons = Nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  If FMotivoCons.ShowModal = mrOk then
  Begin
    MEMotivo.Text := DMMotivo.QMotivoConsCod_Motivo.Text;
    MEMotivoExit(Self);
  End;
end;

procedure TFNotaEntrada_Cancela.MEMotivoExit(Sender: TObject);
begin
  EdMotivo.Text := DMOracle.BuscaNome('SELECT DESC_MOTIVO FROM TB_MOTIVO','COD_MOTIVO = '+MEMotivo.Text,True);
end;

end.
