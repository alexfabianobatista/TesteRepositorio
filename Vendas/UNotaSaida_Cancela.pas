unit UNotaSaida_Cancela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, Buttons, Db, DBTables, NfeCliente, ComCtrls, ActnList;

type
  TFNotaSaida_Cancela = class(TForm)
    Label22: TLabel;
    BtConsMotivo: TBitBtn;
    EdMotivo: TEdit;
    MEMotivo: TMaskEdit;
    BtOk: TBitBtn;
    BitBtn2: TBitBtn;
    CBEmail: TCheckBox;
    StatusBar1: TStatusBar;
    procedure BtOkClick(Sender: TObject);
    procedure BtConsMotivoClick(Sender: TObject);
    procedure MEMotivoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaSaida_Cancela: TFNotaSaida_Cancela;

implementation

uses UNotaSaida_cl, UOracle_cl, UMotivoCons, UMotivo_cl,
  UAguardoNfe, UNfe_cl, StrUtils, UBiblioteca, UNfEletronicaLote_cl, NfeUtils,
  UParamSistema_cl, UUsuario_cl;

{$R *.DFM}

procedure TFNotaSaida_Cancela.BtOkClick(Sender: TObject);
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
  With DMNotaSaida do
  Begin
    Try
      if Length(Trim(EdMotivo.Text)) < 15 then
      begin
        ModalResult := mrNone;
        raise Exception.Create('O motivo precisa ter no mínimo 15 caracteres.');
      end;
      DMOracle.DBCemapa.StartTransaction;
      //Zerar guia de pagamento após cancelar
      if not QNotaSaidaCOD_GUIA_PAGAMENTO.IsNull THEN
      begin
        DMOracle.ExecutaSql('UPDATE TB_NOTA_CAB SET COD_GUIA_PAGAMENTO = NULL '+
                            'WHERE COD_NOTA_CAB = ' + QNotaSaidaCOD_NOTA_CAB.Text);
      end;

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
      QAtzNotaCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
      QAtzNotaDt_Usuario.Value := DMOracle.DataHoraServ;
      QAtzNota.Post;
      QItemNF.First;
      While not QItemNF.Eof do
      Begin
        QCancelaDesdobramento.Close;
        QCancelaDesdobramento.SetVariable('COD_NOTA_ITEM',QItemNFCod_Nota_Item.Value);
        QCancelaDesdobramento.ExecSQL;

        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        wComando := 'DELETE FROM TB_BAIXA_PEDIDO';
        wComando := wComando + ' WHERE COD_NOTA_ITEM = '+FloatToStr(QItemNFCod_Nota_Item.Value);
        DMOracle.QExecSQL.SQL.Add(wComando);
        DMOracle.QExecSQL.ExecSQL;
        QItemNF.Next;
      End;
      QCancelaDesdobramento.Close;
      if (not QNotaSaidaDESC_CHAVE_ACESSO.isNull) then
      begin
        with DMNfe do
        begin
          SetaNfe(QNotaSaidaDESC_CHAVE_ACESSO.Value, True);
          if not (QNfeind_aprovado.Value or QNfeind_denegado.Value) then
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
                QGeraNfe.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Value);
                QGeraNfe.Open;

                QGeraNfeCanc.Close;
                QGeraNfeCanc.Open;

                if QGeraNfeCanc.RecordCount = 0 then
                  QGeraNfeCanc.Insert
                else
                  QGeraNfeCanc.Edit;

                QGeraNfeCancDESC_CHAVE_ACESSO.Value := copy( QNotaSaidaDESC_CHAVE_ACESSO.Value,4, 44);
                QGeraNfeCancNSEQ_EVENTO.Value := 1;
                QGeraNfeCancID_EVENTO.Value := 'ID110111' + copy( QNotaSaidaDESC_CHAVE_ACESSO.Value,4,44) + '01';
                QGeraNfeCancDT_EVENTO.Value := Now;
                QGeraNfeCancDESC_JUSTIFICATIVA.Value := Trim(EdMotivo.Text);
                QGeraNfeCancDESC_XML_CANC_NFE.Value := TNfeUtils.GeraXMLNFeCanc(QNotaSaidaCOD_NOTA_CAB.Value);
                QGeraNfeCanc.Post;
                CarregaNotaCons(QNotaSaidaCOD_NOTA_CAB.Value);
                if (CDSNfeLoteItemConsCOD_NOTA_CAB.Value =
                    QNotaSaidaCOD_NOTA_CAB.Value) then
                begin
                  SetSelecaoItem;
                  CDSNfeLoteItemCons.Edit;
                  CDSNfeLoteItemConsDESC_JUST_CANCELA.Value := EdMotivo.Text;
                  CDSNfeLoteItemCons.Post;

                  if CDSNfeLoteItemConsIND_NFSE.Value = 'NAO' then
                    AcaoEmLote(TAcoesLote.Create.Add(alCancela))
                  else
                    AcaoEmLote(TAcoesLote.Create.Add(alCancelaNFSe));
                  CDSNfeLoteItemCons.Close;
                  CDSNfeLoteItemCons.Open;
                  while (CDSNfeLoteItemConsCOD_NOTA_CAB.Value <> QNotaSaidaCOD_NOTA_CAB.Value)
                      and (not CDSNfeLoteItemCons.Eof) do
                    CDSNfeLoteItemCons.Next;
                  if (CDSNfeLoteItemConsCOD_NOTA_CAB.Value = QNotaSaidaCOD_NOTA_CAB.Value) and
                      (CDSNfeLoteItemConsind_cancelado.Value) then
                  begin
                    try
                      SetSelecaoItem;
                      if CBEmail.Checked then
                      begin
                        CDSNfeLoteItemCons.Edit;

                        CDSNfeLoteItemConsEMAIL_XML.Value := 'S';
                        CDSNfeLoteItemConsEMAIL_PDF.Value := 'S';
                        CDSNfeLoteItemCons.Post;
                        AcaoEmLote(TAcoesLote.Create.Add(alEmail));
                      end;
                      QValeProdutoTroca.First;
                      while not QValeProdutoTroca.Eof do
                      begin
                        QValeProdutoTroca.Edit;
                        QValeProdutoTrocaCOD_NOTA_CAB_TROCA.Value := 0;
                        QValeProdutoTroca.Post;
                        QValeProdutoTroca.Next;
                      end;
                    except
                      on E: Exception do
                      begin
                        MessageDlg('Não foi possível enviar e-mail de notificação.'+#13+#10+
                            'Erro: ' + E.Message, mtWarning, [mbOK], 0);
                        DMOracle.DBCemapa.Rollback;
                      end;
                    end;
                  end
                  else
                  begin
                    DMOracle.DBCemapa.StartTransaction;
                    QAtzNota.Edit;
                    QAtzNotaInd_Situacao.Value := '1';
                    QAtzNotaCod_Motivo_Canc.Value := StrToInt(Trim(MEMotivo.Text));
                    QAtzNotaCod_Contrato_Vend.Text := '';
                    QAtzNota.Post;
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
  if Trim(MEMotivo.Text) <> '' then
    EdMotivo.Text := DMOracle.BuscaNome('SELECT DESC_MOTIVO FROM TB_MOTIVO','COD_MOTIVO = '+MEMotivo.Text);
end;

procedure TFNotaSaida_Cancela.FormCreate(Sender: TObject);
begin
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

end.
