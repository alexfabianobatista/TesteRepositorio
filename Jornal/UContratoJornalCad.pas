unit UContratoJornalCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBCtrls, DBPanel, Grids, DBGrids, OraTeste, UContratoJornalParam,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFContratoJornalCad = class(TFTCadSimples, ITipoProvider)
    DSItens: TDataSource;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    GBItens: TGroupBox;
    DBPEdicao: TDBPanel;
    DBPanel8: TDBPanel;
    DBPanel9: TDBPanel;
    BtIncluir: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    BtConfirmar: TBitBtn;
    BtCancelar: TBitBtn;
    DBGItens: TDBGrid;
    DBTSituacao: TDBText;
    DBPanel10: TDBPanel;
    DBCBTipo: TDBComboBox;
    Label1: TLabel;
    Opes1: TMenuItem;
    FecharContrato1: TMenuItem;
    VoltarFechamento1: TMenuItem;
    CancelarContrato1: TMenuItem;
    VoltarCancelamentoContrato1: TMenuItem;
    ContasReceberporEdio1: TMenuItem;
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel6DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure FormCreate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DSItensStateChange(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BtIncluirClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtConfirmarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure FecharContrato1Click(Sender: TObject);
    procedure VoltarFechamento1Click(Sender: TObject);
    procedure CancelarContrato1Click(Sender: TObject);
    procedure VoltarCancelamentoContrato1Click(Sender: TObject);
    procedure ContasReceberporEdio1Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
  private
    procedure SetaVariaveisRel(DataSet: TOracleDataset1);
  public
    function getTipos: String;
  end;

var
  FContratoJornalCad: TFContratoJornalCad;

implementation

uses UContratoJornal_cl, UFilialCons, UCadastroCons, UVendedorCons,
  UContratoJornalCons, UContratoJornalFecha, UOracle_cl,
  UContratoJornalRel_cl, URContratoJornal,
  UFmCadastro, UFmVendedor, UBiblioteca, StrUtils;

{$R *.dfm}

procedure TFContratoJornalCad.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFContratoJornalCad.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFContratoJornalCad.DBPanel6DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVendedorCons;
  Classe := TFVendedorCons;
end;

procedure TFContratoJornalCad.FormCreate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet.Close;
  DSPrimario.DataSet.Open;
  if FContratoJornalParam = nil then
    FContratoJornalParam := TFContratoJornalParam.Create(Application);
  FContratoJornalParam.TipoProvider := Self;
end;

procedure TFContratoJornalCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  if not (DSPrimario.State in [dsEdit, dsInsert]) then
    (DSPrimario.DataSet as TOracleDataSet1).Session.Commit;
end;

procedure TFContratoJornalCad.DSItensStateChange(Sender: TObject);
var
  b, b2: boolean;
begin
  inherited;
  b := DSItens.State in [dsEdit, dsInsert];
  b2 := DSPrimario.State in [dsEdit, dsInsert];

  BtIncluir.Enabled := (not b) and (b2);
  BtEditar.Enabled := (not b) and (b2);
  BtExcluir.Enabled := (not b) and (b2);
  BtConfirmar.Enabled := b and (b2);
  BtCancelar.Enabled := b and (b2);
end;

procedure TFContratoJornalCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  DSItensStateChange(Sender);
  DSItens.AutoEdit := DSPrimario.State in [DsEdit, DsInsert];
end;

procedure TFContratoJornalCad.BtIncluirClick(Sender: TObject);
begin
  inherited;
  DSItens.DataSet.Append;
  DBPEdicao.SetFocus;
end;

procedure TFContratoJornalCad.BtEditarClick(Sender: TObject);
begin
  inherited;
//  if DSPrimario.DataSet.State in [dsInsert, dsEdit] then
  DSItens.DataSet.Edit;
end;

procedure TFContratoJornalCad.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if (MessageDlg('Tem certeza que deseja excluir esta edição?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    DSItens.DataSet.Delete;
end;

procedure TFContratoJornalCad.BtConfirmarClick(Sender: TObject);
begin
  inherited;
  DSItens.DataSet.Post;
end;

procedure TFContratoJornalCad.BtCancelarClick(Sender: TObject);
begin
  inherited;
  DSItens.DataSet.Cancel;
end;

procedure TFContratoJornalCad.SBCancelarClick(Sender: TObject);
begin
  if DSItens.State in [dsEdit, dsInsert] then
    DSItens.DataSet.Cancel;
  inherited;
  (DSPrimario.DataSet as TOracleDataSet1).Session.Rollback;
  DSPrimario.DataSet.Refresh;
  DSItens.DataSet.Refresh;
end;

procedure TFContratoJornalCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FContratoJornalCons = nil then
    FContratoJornalCons := TFContratoJornalCons.Create(Application);
  if FContratoJornalCons.ShowModal = mrOk then
    with DMContratoJornal do
    begin
      QContratoJornal.Close;
      QContratoJornal.SetVariable('PK', QContratoJornalConsCOD_CONTRATO_JORNAL.Value);
      QContratoJornal.Open;
    end;
end;

procedure TFContratoJornalCad.SBExcluirClick(Sender: TObject);
begin
  if DMContratoJornal.QContratoJornalIND_SITUACAO.Value = SIT_CONTRATO_FECHADO then
    MessageDlg('O contrato já está fechado. Para excluí-lo, você precisa voltar o fechamento em Opções - Voltar Fechamento.', mtInformation, [mbOK], 0)
  else if DMContratoJornal.QContratoJornalIND_SITUACAO.Value = SIT_CONTRATO_FECHADO then
    MessageDlg('O contrato já está cancelado. Para excluí-lo, você precisa voltar o cancelamento em Opções - Voltar Cancelamento.', mtInformation, [mbOK], 0)
  else
  begin
    inherited;
    (DSPrimario.DataSet as TOracleDataSet1).Session.Commit;
  end;
end;

procedure TFContratoJornalCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  DBTSituacao.Font.Color := clWindowText;
  with DMContratoJornal.QContratoJornalIND_SITUACAO do
  begin
    case Value of
      SIT_CONTRATO_ABERTO: DBTSituacao.Font.Color := clRed;
      SIT_CONTRATO_FECHADO: DBTSituacao.Font.Color := clGreen;
      SIT_CONTRATO_CANCELADO: DBTSituacao.Font.Color := clBlue;
    end;
    FecharContrato1.Enabled := (Value = SIT_CONTRATO_ABERTO);
    VoltarFechamento1.Enabled := (Value = SIT_CONTRATO_FECHADO);
    CancelarContrato1.Enabled := (Value = SIT_CONTRATO_ABERTO);
    VoltarCancelamentoContrato1.Enabled := (Value = SIT_CONTRATO_CANCELADO);
  end;
end;

procedure TFContratoJornalCad.FecharContrato1Click(Sender: TObject);
begin
  inherited;
  with DMContratoJornal do
    if QContratoJornal.IsEmpty then
      MessageDlg('Por favor, informe um contrato.', mtInformation, [mbOK], 0)
    else if QContratoJornalIND_SITUACAO.Value = SIT_CONTRATO_CANCELADO then
      MessageDlg('O contrato já foi cancelado. Para fechar ele, antes você ' +
          'precisa ir em Opções - Voltar Fechamento.', mtInformation, [mbOK], 0)
    else if QContratoJornalIND_SITUACAO.Value = SIT_CONTRATO_FECHADO then
      MessageDlg('O contrato já foi fechado.', mtInformation, [mbOK], 0)
    else
    begin
      if FContratoJornalFecha = nil then
        FContratoJornalFecha := TFContratoJornalFecha.Create(Application);
      FContratoJornalFecha.ShowModal;
    end;
end;

procedure TFContratoJornalCad.VoltarFechamento1Click(Sender: TObject);
var
  wBuscaSit: TBuscador;
  wAux: String;
begin
  inherited;
  with DMContratoJornal do
    if QContratoJornal.IsEmpty then
      MessageDlg('Por favor, informe um contrato.', mtInformation, [mbOK], 0)
    else if QContratoJornalIND_SITUACAO.Value = SIT_CONTRATO_CANCELADO then
      MessageDlg('O contrato já foi cancelado.', mtInformation, [mbOK], 0)
    else if QContratoJornalIND_SITUACAO.Value = SIT_CONTRATO_ABERTO then
      MessageDlg('O contrato não está fechado.', mtInformation, [mbOK], 0)
    else
      if (MessageDlg('Será feita a volta do fechamento. As contas à receber deste contrato serão excluídas.'+#13+#10+'Se existirem contas à receber já baixadas, a volta do fechamento não será possível.'+#13+#10+'Continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        try
          wBuscaSit := TBuscador.Create;
          wBuscaSit.Limpa;
          Executador.Limpa;
          QContratoJornalItem.First;
          while not QContratoJornalItem.Eof do
          begin
            if not QContratoJornalItemCOD_CONTA_RECEBER_CAB.IsNull then
            begin
              wBuscaSit.Adiciona('IND_SITUACAO', 'TB_CONTA_RECEBER_CAB',
                  'COD_CONTA_RECEBER_CAB = 0' + QContratoJornalItemCOD_CONTA_RECEBER_CAB.Text);
              wAux := MontaSelect('COD_CONTA_RECEBER_CAB', 'TB_CONTA_RECEBER_CAB',
                  'COD_CONTA_RECEBER_CAB = 0' +
                  QContratoJornalItemCOD_CONTA_RECEBER_CAB.Text +
                  ' AND IND_SITUACAO = ' + QuotedStr('ABERTO'));
              Executador.Adiciona(MontaDelete('TB_CONTA_RECEBER_MOV',
                  'COD_CONTA_RECEBER_CAB IN (' + wAux + ')'));
              Executador.Adiciona(MontaDelete('TB_CONTA_RECEBER_CAB',
                  'COD_CONTA_RECEBER_CAB IN (' + wAux + ')'));

              QContratoJornalItem.Edit;
              QContratoJornalItemCOD_CONTA_RECEBER_CAB.Clear;
              QContratoJornalItem.Post;
            end;
            QContratoJornalItem.Next;
          end;
          wBuscaSit.Buscar;
          while wBuscaSit.TemProximo do
            if wBuscaSit.Proximo <> 'ABERTO' then
              raise Exception.Create('Contrato já possui baixas em suas contas à receber.' + #13 + #10 +
                  'É necessário voltar tais baixas antes de voltar o fechamento do contrato.');
          Executador.Executar;
          QContratoJornal.Edit;
          QContratoJornalIND_SITUACAO.Value := SIT_CONTRATO_ABERTO;
          QContratoJornal.Post;

          QContratoJornal.Session.Commit;
        except
          on E: Exception do
          begin
            QContratoJornal.Session.Rollback;
            MessageDlg('Erro na volta do fechamento:' + #13 + #10 +
                E.Message, mtError, [mbOK], 0);
          end;
        end;
      end;
end;

procedure TFContratoJornalCad.CancelarContrato1Click(Sender: TObject);
begin
  inherited;
  with DMContratoJornal do
    if QContratoJornal.IsEmpty then
      MessageDlg('Por favor, informe um contrato.', mtInformation, [mbOK], 0)
    else if QContratoJornalIND_SITUACAO.Value = SIT_CONTRATO_CANCELADO then
      MessageDlg('O contrato já foi cancelado.', mtInformation, [mbOK], 0)
    else if QContratoJornalIND_SITUACAO.Value = SIT_CONTRATO_FECHADO then
      MessageDlg('O contrato já foi fechado.', mtInformation, [mbOK], 0)
    else
      if (MessageDlg('Será feito o cancelamento do contrato. Isso irá afetar apenas a situação do contrato. Ele continuará no sistema para fins de consulta e relatório.'+#13+#10+'Continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        try
          QContratoJornal.Edit;
          QContratoJornalIND_SITUACAO.Value := SIT_CONTRATO_CANCELADO;
          QContratoJornal.Post;
          QContratoJornal.Session.Commit;
        except
          on E: Exception do
          begin
            MessageDlg('Erro no cancelamento:' + #13 + #10 +
                E.Message, mtError, [mbOK], 0);
            QContratoJornal.Session.Rollback;
          end;
        end;
      end;
end;

procedure TFContratoJornalCad.VoltarCancelamentoContrato1Click(
  Sender: TObject);
begin
  inherited;
  with DMContratoJornal do
    if QContratoJornal.IsEmpty then
      MessageDlg('Por favor, informe um contrato.', mtInformation, [mbOK], 0)
    else if QContratoJornalIND_SITUACAO.Value = SIT_CONTRATO_FECHADO then
      MessageDlg('O contrato não está cancelado.', mtInformation, [mbOK], 0)
    else if QContratoJornalIND_SITUACAO.Value = SIT_CONTRATO_ABERTO then
      MessageDlg('O contrato não está cancelado.', mtInformation, [mbOK], 0)
    else
      if (MessageDlg('Será feita volta do cancelamento do contrato.' +
          ' Ele poderá, então, ser utilizado novamente (basta fazer o fechamento).'+#13+#10+'Continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        try
          QContratoJornal.Edit;
          QContratoJornalIND_SITUACAO.Value := SIT_CONTRATO_ABERTO;
          QContratoJornal.Post;
          QContratoJornal.Session.Commit;
        except
          on E: Exception do
          begin
            MessageDlg('Erro na volta do cancelamento:' + #13 + #10 +
                E.Message, mtError, [mbOK], 0);
            QContratoJornal.Session.Rollback;
          end;
        end;
      end;
end;

procedure TFContratoJornalCad.SetaVariaveisRel(DataSet: TOracleDataset1);
begin
  with FContratoJornalParam do
  begin
    DataSet.ClearVariables;
    if Trim(FM0Filial.MeFilial.Text) <> '' then
      DataSet.SetVariable('FILIAL', Trim(FM0Filial.MeFilial.Text));
    if Trim(FM0Cadastro.MeCadastro.Text) <> '' then
      DataSet.SetVariable('CADASTRO', Trim(FM0Cadastro.MeCadastro.Text));
    if Trim(FM0Vendedor.MeVendedor.Text) <> '' then
      DataSet.SetVariable('VENDEDOR', Trim(FM0Vendedor.MeVendedor.Text));
    if Trim(FM0DtContrato.MeDtInicial.Text) <> '' then
      DataSet.SetVariable('DT_INICIO_CONTRATO', Trim(FM0DtContrato.MeDtInicial.Text));
    if Trim(FM0DtContrato.MeDtFinal.Text) <> '' then
      DataSet.SetVariable('DT_FIM_CONTRATO', Trim(FM0DtContrato.MeDtFinal.Text));
    if Trim(FM0DtVencimento.MeDtInicial.Text) <> '' then
      DataSet.SetVariable('DT_INICIO_VENCTO', Trim(FM0DtVencimento.MeDtInicial.Text));
    if Trim(FM0DtVencimento.MeDtFinal.Text) <> '' then
      DataSet.SetVariable('DT_FIM_VENCTO', Trim(FM0DtVencimento.MeDtFinal.Text));
    if Trim(ME0Edicao.Text) <> '' then
      DataSet.SetVariable('EDICAO', Trim(ME0Edicao.Text));
    if Trim(ME0ComEdicao.Text) <> '' then
      DataSet.SetVariable('COM_EDICAO', Trim(ME0ComEdicao.Text));
    if RG0Situacao.ItemIndex > 0 then
      DataSet.SetVariable('SITUACAO', RG0Situacao.ItemIndex);
    if CB0Tipo.Text <> '' then
      DataSet.SetVariable('TIPO', CB0Tipo.Text);
    case RG0SituacaoCR.ItemIndex of
      0: DataSet.SetVariable('SITUACAO_CR', 'ABERTO');
      1: DataSet.SetVariable('N_SITUACAO_CR', 'ABERTO');
    end;
  end;
end;

procedure TFContratoJornalCad.ContasReceberporEdio1Click(Sender: TObject);
  function FormataParametro(Codigo, Descricao: String): String;
  begin
    Result := IfThen(Trim(Codigo) <> '', Trim(Codigo) + ' - ') + Descricao;
  end;
begin
  inherited;
  FContratoJornalParam.AtivaPagina(0);
//  FContratoJornalParam.RG0Situacao.ItemIndex := SIT_CONTRATO_FECHADO;
//  FContratoJornalParam.RG0Situacao.Enabled := false;
  if FContratoJornalParam.ShowModal = MrOk then
    with DMContratoJornalRel do
    begin
      QRContratoJornal.Close;
      SetaVariaveisRel(QRContratoJornal);
      QRContratoJornal.Open;

      with FContratoJornalParam do
      begin
        if FRContratoJornal = nil then
          FRContratoJornal := TFRContratoJornal.Create(Application);
        FRContratoJornal.QRLFilial.Caption :=
            FormataParametro(FM0Filial.MeFilial.Text, FM0Filial.EdFilial.Text);
        FRContratoJornal.QRLCliente.Caption :=
            FormataParametro(FM0Cadastro.MeCadastro.Text, FM0Cadastro.EdCadastro.Text);
        FRContratoJornal.QRLVendedor.Caption :=
            FormataParametro(FM0Vendedor.MeVendedor.Text, FM0Vendedor.EdVendedor.Text);
        FRContratoJornal.QRLPeriodoContrato.Caption := Bib.DatasParaLabel(
            FM0DtContrato.MeDtInicial.Text,
            FM0DtContrato.MeDtFinal.Text);
        FRContratoJornal.QRLPeriodoVencimento.Caption := Bib.DatasParaLabel(
            FM0DtVencimento.MeDtInicial.Text,
            FM0DtVencimento.MeDtFinal.Text);
        FRContratoJornal.QRLEdicao.Caption := 'TODAS';
        if Trim(ME0Edicao.Text) <> '' then
          FRContratoJornal.QRLEdicao.Caption := Trim(ME0Edicao.Text);

        if RGPreview.ItemIndex = 0 then
          FRContratoJornal.QRPrimario.Preview
        else
          FRContratoJornal.QRPrimario.Print;
      end;
      QRContratoJornal.Close;
    end;
//  FContratoJornalParam.RG0Situacao.Enabled := true;
end;

procedure TFContratoJornalCad.SBAlterarClick(Sender: TObject);
begin
  if DMContratoJornal.QContratoJornalIND_SITUACAO.Value = SIT_CONTRATO_FECHADO then
    MessageDlg('O contrato já está fechado. Para alterá-lo, você precisa voltar o fechamento em Opções - Voltar Fechamento.', mtInformation, [mbOK], 0)
  else if DMContratoJornal.QContratoJornalIND_SITUACAO.Value = SIT_CONTRATO_FECHADO then
    MessageDlg('O contrato já está cancelado. Para alterá-lo, você precisa voltar o cancelamento em Opções - Voltar Cancelamento.', mtInformation, [mbOK], 0)
  else
    inherited;
end;

function TFContratoJornalCad.getTipos: String;
begin
  Result := DBCBTipo.Items.Text;
end;

end.
