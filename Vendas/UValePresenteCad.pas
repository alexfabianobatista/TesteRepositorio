unit UValePresenteCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBPanel, uOracle_cl, DBCtrls, Registry,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList, ImgList;

type
  TFValePresenteCad = class(TFTCadSimples)
    DBPValorVale: TDBPanel;
    DBPDataEmissao: TDBPanel;
    DBPFilial: TDBPanel;
    Label1: TLabel;
    DBECodVale: TDBEdit;
    DBRGCondPagto: TDBRadioGroup;
    SBEmiteVale: TSpeedButton;
    DBSituacao: TDBText;
    DBPCadastro: TDBPanel;
    Reimprimir1: TMenuItem;
    Operaes1: TMenuItem;
    CancelarVale1: TMenuItem;
    DBPVendedor: TDBPanel;
    DBCBTipoCartao: TDBComboBox;
    LBTipoCartao: TLabel;
    DBPValAVista: TDBPanel;
    procedure SBIncluirClick(Sender: TObject);
    procedure DBPFilialDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBPCadastroDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBPValorValeValidate(Sender: TObject; Value: Variant;
      var isValid: Boolean; var Msg: String);
    procedure SBConsultaClick(Sender: TObject);
    procedure DBPCadastroValidate(Sender: TObject; Value: Variant;
      var isValid: Boolean; var Msg: String);
    procedure Reimprimir1Click(Sender: TObject);
    procedure CancelarVale1Click(Sender: TObject);
    procedure DBECodValeChange(Sender: TObject);
    procedure SBEmiteValeClick(Sender: TObject);
    procedure SBRefreshClick(Sender: TObject);
    procedure DBPVendedorDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBRGCondPagtoChange(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ConfirmarVale;
  public
    { Public declarations }
  end;

var
  FValePresenteCad: TFValePresenteCad;
  Registry: TRegistry;

implementation

uses UDevolucaoTroca_cl, UFilialCons, UNotaSaida_cl, UTef, UCadastroCons,
  UTef_cl, UBiblioteca, TefUtils, UValeProdutoCons, Math, UUsuario_cl,
  UNotaImpressao, UVendedorCons, UParamSistema_cl;

{$R *.dfm}

procedure TFValePresenteCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  with DMDevolucaoTroca do
  begin
    QValeProdutoIND_FORMA_PGTO_VALE_PRESENTE.Value := 1;
    QValeProdutoIND_SITUACAO_VALE_PRESENTE.Value := 1;
    QValeProdutoVAL_VALE_PRODUTO.Value := 0;
    QValeProdutoCOD_FILIAL.Value := DMUsuario.CodFilialUsuario;
    QValeProdutoCOD_CADASTRO.Value := DMUsuario.CodClientePadrao;
    QValeProdutoDESC_TIPO_VALE.Value := 'VALE-PRESENTE';
    QValeProdutoDT_EMISSAO.Value := DMOracle.DataServ;
  end;
  DBPValorVale.SetFocus;
end;

procedure TFValePresenteCad.DBPFilialDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFValePresenteCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if not DMDevolucaoTroca.QValeProduto.Eof then
    with DMDevolucaoTroca.QValeProdutoIND_SITUACAO_VALE_PRESENTE do
      if Value = 1 then
        DBSituacao.Font.Color := clRed
      else if Value = 2 then
        DBSituacao.Font.Color := clGreen
      else
        DBSituacao.Font.Color := clBlue;
end;

procedure TFValePresenteCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  MMCadSimples.Items[1].Enabled := DSPrimario.DataSet.State = dsBrowse;
  MMCadSimples.Items[2].Enabled := DSPrimario.DataSet.State = dsBrowse;  
end;

procedure TFValePresenteCad.SBExcluirClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFValePresenteCad.SBConfirmarClick(Sender: TObject);
begin   
  inherited;
  DMOracle.DBCemapa.Commit;
  if DSPrimario.DataSet.State = dsBrowse then
    if MessageDlg('Deseja emitir este Vale agora?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
    begin
      ConfirmarVale;
      FNotaImpressao.emitirValeProduto(DMDevolucaoTroca.QValeProdutoCOD_VALE_PRODUTO.Value);
    end;
  SBRefreshClick(Self);
end;

procedure TFValePresenteCad.DBPCadastroDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFValePresenteCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMDevolucaoTroca.QValeProduto.Open;
end;

procedure TFValePresenteCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMDevolucaoTroca.QValeProduto.Close;
  DMOracle.DBCemapa.Rollback;
end;

procedure TFValePresenteCad.DBPValorValeValidate(Sender: TObject;
  Value: Variant; var isValid: Boolean; var Msg: String);
begin
  inherited;
  if Value = 0 then
  begin
    isValid := False;
    Msg := 'O valor do vale deve ser maior que zero!';
  end;
end;

procedure TFValePresenteCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FValeProdutoCons = nil then
    FValeProdutoCons := TFValeProdutoCons.Create(Application);
  FValeProdutoCons.RGTipoVale.ItemIndex := 1; //índice do vale-presente
  with DMDevolucaoTroca do
  begin
    if FValeProdutoCons.ShowModal = mrOk then
      if QValeProdutoConsCOD_VALE_PRODUTO.Text <> '' then
      begin
        QValeProduto.Close;
        QValeProduto.ClearVariables;
        QValeProduto.SetVariable('PK', QValeProdutoConsCOD_VALE_PRODUTO.Value);
        QValeProduto.Open;
      end;
  end;
end;

procedure TFValePresenteCad.DBPCadastroValidate(Sender: TObject;
  Value: Variant; var isValid: Boolean; var Msg: String);
begin
  inherited;
  if Value = null then
  begin
    isValid := False;
    Msg := 'É necessário informar um cliente!';
  end;
end;

procedure TFValePresenteCad.Reimprimir1Click(Sender: TObject);
begin
  inherited;
  with DMDevolucaoTroca do
  begin
    if QValeProdutoIND_SITUACAO_VALE_PRESENTE.Value = 1 then
    begin
      MessageDlg('O vale precisa, primeiramente, ser emitido para depois ser reimpresso.',
            mtInformation, [mbOk], 0);
      Abort;
    end;
    QValeProdutoValida.Close;
    QValeProdutoValida.ClearVariables;
    QValeProdutoValida.SetVariable('COD_VALE_PRODUTO', QValeProdutoCOD_VALE_PRODUTO.Value);
    QValeProdutoValida.Open;
    if(QValeProdutoValidaIND_UTILIZADO.Value = 'S') then
    begin
      MessageDlg('Os vales na cor vermelha não estão mais disponíveis. O Vale nº '+
        QValeProdutoValidaCOD_VALE_PRODUTO.Text + ' já foi utilizado na nota nº '+
        QValeProdutoConsCOD_NOTA_CAB_TROCA.Text+'. Tente fazer o processo com outro vale.',
      mtInformation, [mbOk], 0);
      abort;
    end;
    FNotaImpressao.emitirValeProduto(DMDevolucaoTroca.QValeProdutoCOD_VALE_PRODUTO.Value);
  end;
end;

procedure TFValePresenteCad.CancelarVale1Click(Sender: TObject);
var
 wCodContaReceberCab, wCodCaixa: string;
begin
  inherited;
  with DMDevolucaoTroca do
    if QValeProdutoIND_SITUACAO_VALE_PRESENTE.Value = 2 then
    begin
      QValeProdutoValida.Close;
      QValeProdutoValida.ClearVariables;
      QValeProdutoValida.SetVariable('COD_VALE_PRODUTO', QValeProdutoCOD_VALE_PRODUTO.Value);
      QValeProdutoValida.Open;

      if QValeProdutoValidaIND_UTILIZADO.Value = 'S' then
      begin
        MessageDlg('Não é possível cancelar este vale. Ele já foi utilizado em uma nota fiscal.',
        mtInformation, [mbOk], 0);
        Abort;
      end;

      if MessageDlg('Este Vale já foi emitido. Para cancelá-lo será necessário cancelar os pagamentos. Deseja realmente fazer isso?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        Abort;
      QCaixa.Close;
      QCaixa.Open;
      while not QCaixa.Eof do
        QCaixa.Delete;
      QCaixa.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_CAIXA_MOV WHERE COD_VALE_PRODUTO = ' + QValeProdutoCOD_VALE_PRODUTO.Text);
      DMOracle.QExecSQL.ExecSQL;
      try
        QContaReceber.Close;
        QContaReceber.Open;
        QContaReceberMov.Close;
        QContaReceberMov.Open;
        while not QContaReceber.Eof do
        begin
          if (QContaReceberIND_ENVIADO_BANCO.Text = 'SIM')then
            raise Exception.Create('Boleto já enviado a banco!');
          if QContaReceberMovInd_Tipo_Movimento.Value <> '' then
          begin
            if (QContaReceberMovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
              raise Exception.Create('Conta a Receber com baixas!')
            else
              QContaReceberMov.Delete;
          end;
          QContaReceber.Delete;
        end;
        wCodContaReceberCab := DMOracle.fastSelect('COD_CONTA_RECEBER_CAB','TB_CONTA_RECEBER_CAB','NUM_TITULO = ' + QValeProdutoCOD_VALE_PRODUTO.Text +
        				' AND COD_CADASTRO = ' + QValeProdutoCOD_CADASTRO.Text);
        if (wCodContaReceberCab <> '') then
        begin
          DMOracle.QExecSQL.SQL.Clear;
          DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_CONTA_RECEBER_MOV WHERE COD_CONTA_RECEBER_CAB = ' + wCodContaReceberCab);
          DMOracle.QExecSQL.ExecSQL;

          DMOracle.QExecSQL.SQL.Clear;
          DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_CONTA_RECEBER_CAB WHERE COD_CONTA_RECEBER_CAB = ' + wCodContaReceberCab);
          DMOracle.QExecSQL.ExecSQL;
        end;
      except
        MessageDlg('Não foi possível excluir o registro do Contas a Receber!', mtWarning, [mbOk], 0);
        raise;
      end;

      if (QValeProdutoIND_FORMA_PGTO_VALE_PRESENTE.Value > 2) and
         (pos('TEF',QValeProdutoIND_MODALIDADE_CARTAO.Value) > 0) then
      begin
        if FTef = nil then
        FTef := TFTef.Create(Application);
        FTEF.ValorTransacao := 0;
        FTEF.IndNFCe := False;
        FTEF.Modalidade := 200;
        FTEF.btIniciaTef.Visible := true;
        FTEF.Comprovantes := TStringList.Create;
        FTEF.lbMensagem.Caption := '';
        if FTEF.ShowModal <> mrOk then
          Abort;
      end;
      QValeProduto.Edit;
      QValeProdutoIND_SITUACAO_VALE_PRESENTE.Value := 3;
      QValeProduto.Post;
      DMOracle.DBCemapa.Commit;
      SBRefreshClick(Self);
    end;
end;

procedure TFValePresenteCad.ConfirmarVale;
var wTipoPagamento: string;
begin
  try
    if not DMDevolucaoTroca.QValeProduto.Eof then
      with DMDevolucaoTroca do
      begin
        if QValeProdutoVAL_AVISTA.Value > 0 then
          IncluiCaixa(QValeProdutoVAL_AVISTA.Value, 'VENDA A VISTA', QValeProdutoCOD_FILIAL.Text,
            QValeProdutoCOD_CADASTRO.Text, QValeProdutoCOD_VALE_PRODUTO.Text, DMOracle.DataServ);
        if QValeProdutoIND_FORMA_PGTO_VALE_PRESENTE.Value = 1 then  // Pagamento à vista
          IncluiCaixa(QValeProdutoVAL_VALE_PRODUTO.Value, 'VENDA A VISTA', QValeProdutoCOD_FILIAL.Text,
                QValeProdutoCOD_CADASTRO.Text, QValeProdutoCOD_VALE_PRODUTO.Text, DMOracle.DataServ)
        else if QValeProdutoIND_FORMA_PGTO_VALE_PRESENTE.Value = 2 then
          GeraContaReceber
        else
        begin
          if pos('TEF', QValeProdutoIND_MODALIDADE_CARTAO.Value) > 0 then //Pagamento com TEF
          begin
            //Guarda no registro o códiogo da filial
            //para o caso de dar erro na impressão do TEF
            Registry := TRegistry.Create;//executa o tregistry
            Registry.RootKey:=HKEY_CURRENT_USER; //abre a chave mestra
            Registry.OpenKey('SOFTWARE\CemapaSistema',true);
            Registry.WriteString('FilialTEF',QValeProdutoCOD_FILIAL.Text);

            if FTef = nil then
              FTef := TFTef.Create(Application);

            FTEF.Modalidade := 0;
            FTEF.ValorTransacao := QValeProdutoVAL_VALE_PRODUTO.Value;
            FTEF.CodValePresente := QValeProdutoCOD_VALE_PRODUTO.Value;
            FTEF.Filial := QValeProdutoCOD_FILIAL.Text;
            FTEF.NumNota := QValeProdutoCOD_VALE_PRODUTO.Text;
            FTEF.CodNotaCab := 0;
            FTEF.btIniciaTef.Visible := true;
            FTEF.Comprovantes := TStringList.Create;
            FTEF.lbMensagem.Caption := '';
            FTEF.ValorDinheiro := QValeProdutoVAL_AVISTA.Value;
            FTEF.ValorDesconto := 0;
            FTEF.IndNFCe := False;

            if FTEF.ShowModal = mrOk then
            begin
              with DMTEF do
              begin
                if not QTefCab.Eof then
                begin
                  QTefCab.Edit;
                  QTefCabIND_STATUS.Value := 'PENDENTE';
                  QTefCabDT_EMISSAO.Value := Now;
                  QTefCab.Post;
                end;
              end;
              FTEF.IndNFCe := True;
              if FTEF.Comprovantes.Count > 0 then
                FTEF.ImprimeTransacaoTEF;
              FTEF.Finaliza(FINALIZA_CONFIRMANDO);
            end
            else
            begin
              FTEF.Finaliza(FINALIZA_CANCELANDO);
              MessageDlg('Transação TEF não foi efetuada.', mtError, [mbOK], 0);
              Abort;
            end;
          end
          else
          begin
            if DMParamSistema.CodEmpresa <> 'ARISTIDES' then
            begin
              if (QValeProdutoIND_MODALIDADE_CARTAO.Value = 'POS Crédito') then
                wTipoPagamento := 'CARTAO DE CREDITO'
              else
                wTipoPagamento := 'CARTAO DE DEBITO';
              IncluiCaixa(QValeProdutoVAL_VALE_PRODUTO.Value - QValeProdutoVAL_AVISTA.Value, wTipoPagamento, QValeProdutoCOD_FILIAL.Text,
                  QValeProdutoCOD_CADASTRO.Text, QValeProdutoCOD_VALE_PRODUTO.Text, DMOracle.DataServ)
            end;
          end;
        end;
        QValeProduto.Edit;
        QValeProdutoIND_SITUACAO_VALE_PRESENTE.Value := 2;
        QValeProduto.Post;
        DMOracle.DBCemapa.Commit;
      end;
  except
    DMDevolucaoTroca.QValeProduto.Cancel;
    DMOracle.DBCemapa.Rollback;
    raise;
  end;
end;

procedure TFValePresenteCad.DBECodValeChange(Sender: TObject);
begin
  inherited;
  MMCadSimples.Items[2].Items[0].Enabled := DMDevolucaoTroca.QValeProdutoIND_SITUACAO_VALE_PRESENTE.Value = 2;
  MMCadSimples.Items[1].Items[0].Enabled := DMDevolucaoTroca.QValeProdutoIND_SITUACAO_VALE_PRESENTE.Value = 2;
  SBEmiteVale.Enabled := DMDevolucaoTroca.QValeProdutoIND_SITUACAO_VALE_PRESENTE.Value = 1;
end;

procedure TFValePresenteCad.SBEmiteValeClick(Sender: TObject);
begin
  inherited;
  ConfirmarVale;
  if not DMDevolucaoTroca.QValeProduto.Eof then
    FNotaImpressao.emitirValeProduto(DMDevolucaoTroca.QValeProdutoCOD_VALE_PRODUTO.Value);
end;

procedure TFValePresenteCad.SBRefreshClick(Sender: TObject);
begin
  DMDevolucaoTroca.QValeProduto.SetVariable('PK', DMDevolucaoTroca.QValeProdutoCOD_VALE_PRODUTO.Value);
  inherited;
end;

procedure TFValePresenteCad.DBPVendedorDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVendedorCons;
  Classe := TFVendedorCons;
end;

procedure TFValePresenteCad.DBRGCondPagtoChange(Sender: TObject);
begin
  inherited;
  with DMDevolucaoTroca do
  begin
    if (QValeProdutoIND_MODALIDADE_CARTAO.Value = '') then
    begin
      if(DMParamSistema.CodEmpresa = 'ARISTIDES') then
        QValeProdutoIND_MODALIDADE_CARTAO.Value := Bib.ift(DBRGCondPagto.ItemIndex > 1,
          'TEF Crédito', '')
      else
        QValeProdutoIND_MODALIDADE_CARTAO.Value := Bib.ift(DBRGCondPagto.ItemIndex > 1,
          'POS Crédito', '');
    end;

    DBPValAVista.Enabled := (DBRGCondPagto.ItemIndex = 1) or
      (DBRGCondPagto.ItemIndex = 3);
    DBPValAVista.DBEdit.Text := Bib.ift((DBRGCondPagto.ItemIndex = 1) or
      (DBRGCondPagto.ItemIndex = 3),
      DBPValAVista.DBEdit.Text, '');
  end;
end;

procedure TFValePresenteCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  if (DMDevolucaoTroca.QValeProdutoIND_SITUACAO_VALE_PRESENTE.Value = 2) then
  begin
    SBCancelarClick(Sender);
    Raise Exception.Create('Este vale presente já foi EMITIDO, sendo assim não é permitido alterá-lo! CANCELE-O e emita outro com as informações corretas.');
  end;
  if (DMDevolucaoTroca.QValeProdutoIND_SITUACAO_VALE_PRESENTE.Value = 3) then
  begin
    SBCancelarClick(Sender);
    Raise Exception.Create('Este vale presente já foi CANCELADO, sendo assim não é permitido alterá-lo! Emita outro com as informações corretas.');
  end;
end;

end.
