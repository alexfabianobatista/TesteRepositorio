unit UOficinaCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, OracleNavigator,
  ActnList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TItem = Record
    UnItem: String;
    CodItem: Integer;
    QtdItem: Real;
    DescItem: String;
    PercDesconto: Real;
    ValUn: Real;
    ValItem: Real;
end;

type
  TFOficinaCad = class(TFTCadSimples)
    DSItens: TDataSource;
    Opes1: TMenuItem;
    Fechar1: TMenuItem;
    VoltarConfirmao1: TMenuItem;
    CancelarOrdemdeServio1: TMenuItem;
    EmitirNFdaOrdemdeServio1: TMenuItem;
    DSSomaItemOficina: TDataSource;
    VoltarCancelamento1: TMenuItem;
    PCOficina: TPageControl;
    TSOficina: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    SBCadastroCons: TSpeedButton;
    SBVendedorCons: TSpeedButton;
    SBFilialCons: TSpeedButton;
    SBVeiculoCons: TSpeedButton;
    Label9: TLabel;
    SBMarcaCons: TSpeedButton;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    SBProdutoCons: TSpeedButton;
    Label8: TLabel;
    Label20: TLabel;
    SBOperacaoCons: TSpeedButton;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBECodOficinaCab: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBECadastro: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBEdit8: TDBEdit;
    DBDirceu5: TDBDirceu;
    DBGItens: TDBGrid;
    DBEProduto: TDBEdit;
    DBEdit16: TDBEdit;
    DBEValUnitario: TDBEdit;
    ONItens: TOracleNavigator;
    Panel2: TPanel;
    DBEdit9: TDBEdit;
    DBEdit20: TDBEdit;
    DBDirceu6: TDBDirceu;
    DBEdit21: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit5: TDBEdit;
    TSTotal: TTabSheet;
    Label26: TLabel;
    DBEdit22: TDBEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    GBDescFechamento: TGroupBox;
    Comisso1: TMenuItem;
    EmitirCpiaOramento1: TMenuItem;
    Label19: TLabel;
    Label22: TLabel;
    DBEdit18: TDBEdit;
    DBEdit17: TDBEdit;
    DBDirceu7: TDBDirceu;
    DBEdit25: TDBEdit;
    N2: TMenuItem;
    OrdemdeServio1: TMenuItem;
    N3: TMenuItem;
    ImpressoCobrana1: TMenuItem;
    Label38: TLabel;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    Label39: TLabel;
    Label31: TLabel;
    DBEdit6: TDBEdit;
    Label32: TLabel;
    DBEdit28: TDBEdit;
    Label45: TLabel;
    DBEdit29: TDBEdit;
    Label51: TLabel;
    DBEdit30: TDBEdit;
    Label52: TLabel;
    DBEdit31: TDBEdit;
    Label53: TLabel;
    DBEdit32: TDBEdit;
    Label54: TLabel;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    Label55: TLabel;
    Label56: TLabel;
    DBText17: TDBText;
    Label57: TLabel;
    DBText20: TDBText;
    Label60: TLabel;
    DBText21: TDBText;
    Label61: TLabel;
    DBText22: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    Label58: TLabel;
    DBText23: TDBText;
    Label59: TLabel;
    DBText24: TDBText;
    DBText25: TDBText;
    DBText26: TDBText;
    Label62: TLabel;
    DBText27: TDBText;
    Label63: TLabel;
    DBText29: TDBText;
    DBText30: TDBText;
    Label64: TLabel;
    DBText31: TDBText;
    DBText32: TDBText;
    Label65: TLabel;
    DBEdit35: TDBEdit;
    Label21: TLabel;
    DBENumFabricante: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    procedure SBCadastroConsClick(Sender: TObject);
    procedure SBVendedorConsClick(Sender: TObject);
    procedure SBFilialConsClick(Sender: TObject);
    procedure SBVeiculoConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBMarcaConsClick(Sender: TObject);
    procedure SBProdutoConsClick(Sender: TObject);
    procedure DSItensStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBOperacaoConsClick(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure EmitirNFdaOrdemdeServio1Click(Sender: TObject);
    procedure VoltarConfirmao1Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure DBECodOficinaCabChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure CancelarOrdemdeServio1Click(Sender: TObject);
    procedure VoltarCancelamento1Click(Sender: TObject);
    procedure SBRefreshClick(Sender: TObject);
    procedure Comisso1Click(Sender: TObject);
    procedure EmitirCpiaOramento1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure OrdemdeServio1Click(Sender: TObject);
    procedure ImpressoCobrana1Click(Sender: TObject);
    procedure ONItensClick(Sender: TObject; Button: TOracleNavigateBtn);
  private
    procedure GeraContasReceber(wListaParcela: TStrings; wFinalidade:Integer; wDepartamento:Integer);
    procedure VoltaConfirmacao;
    procedure Fecha;
    procedure EmiteFechamento;
    procedure Imprime(wItems: Array of TItem; wTipo: String = 'PECA');
    procedure Exclui;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOficinaCad: TFOficinaCad;

implementation

uses UOracle_cl, UOficina_cl, UCadastroCons, UCadastro_cl, UVendedor_cl,
  UVendedorCons, UMecanicoCons, UFilial_cl, UFilialCons, UVeiculo_cl,
  UVeiculoCons, UMarca_cl, UMarcaCons, UProduto_cl, UProdutoCons,
  UOficinaCons, UOperacao_cl, UOperacaoCons, UOficinaConfirma,
  UNotaSaida_cl, USerie_cl, UFinalidade_cl, UUsuario_cl, UBiblioteca,
  UEstoque_cl, UNotaImpressao, UOficinaParam, URelatorio_cl, URComissao,
  UFmVendedor, UFmDatas, UFmFilial, UROficina, UFmCadastro, UFmOperacao,
  UFmVeiculo, UFmMarca, UrReceberCobranca, UContasReceber_cl,
  UROficinaSintetico, UPrazoVencimento_cl, URComissaoSintetico;

{$R *.dfm}

procedure TFOficinaCad.SBCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
    DMOficina.QOficinaCadCOD_CADASTRO.Value:= DMCadastro.QCadastroConsCOD_CADASTRO.Value;
end;

procedure TFOficinaCad.SBVendedorConsClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    DMOficina.QOficinaCadCOD_VENDEDOR.Value:= DMVendedor.QVendedorConsCOD_VENDEDOR.Value;
end;

procedure TFOficinaCad.SBFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    DMOficina.QOficinaCadCOD_FILIAL.Value:= DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFOficinaCad.SBVeiculoConsClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = MrOk then
    DMOficina.QOficinaCadCOD_VEICULO.Value := DMOficina.QVeiculoConsCOD_VEICULO.Value;
end;

procedure TFOficinaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBCadastroCons.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  SBVendedorCons.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  SBFilialCons.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  SBVeiculoCons.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  SBMarcaCons.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  SBOperacaoCons.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  MMCadSimples.Items[2].Enabled := (DSPrimario.State = DsBrowse);
end;

procedure TFOficinaCad.SBMarcaConsClick(Sender: TObject);
begin
  inherited;
  if FMarca_Cons = nil then
    FMarca_Cons := TFMarca_Cons.Create(Application);
  if FMarca_Cons.ShowModal = mrOk then
    DMOficina.QOficinaCadCOD_MARCA.Value:= DMMarca.QMarcaConsCOD_MARCA.Value;
end;

procedure TFOficinaCad.SBProdutoConsClick(Sender: TObject);
begin
  inherited;
  DBEProduto.SetFocus;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
    DMOficina.QOficinaItemCOD_PRODUTO.Value := Trunc(DMProduto.QProdutoConsCOD_PRODUTO.Value);
end;

procedure TFOficinaCad.DSItensStateChange(Sender: TObject);
begin
  inherited;
  SBProdutoCons.Enabled := (DSItens.State in [DsEdit, DsInsert]);
end;

procedure TFOficinaCad.FormCreate(Sender: TObject);
begin
  inherited;
  DMOficina.QOficinaCad.Close;
  DMOficina.QOficinaCad.Open;
  DMOficina.QOficinaItem.Close;
  DMOficina.QOficinaItem.Open;
end;

procedure TFOficinaCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Rollback;
  SBRefresh.Click;
end;

procedure TFOficinaCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
  SBRefreshClick(SBRefresh);
end;

procedure TFOficinaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DSItens.State in [DsEdit, DsInsert] then
  begin
    MessageDlg('Itens não confirmados!'+#13+#10+'Confirme os dados dos itens antes de sair.', mtError, [mbOK], 0);
    Abort;
  end;
  inherited;
end;

procedure TFOficinaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOficinaCons = nil then
    FOficinaCons := TFOficinaCons.Create(Application);
  if FOficinaCons.ShowModal = MrOk then
    with DMOficina do
    begin
      QOficinaCad.Close;
      QOficinaCad.SetVariable('PK', QOficinaConsCOD_OFICINA_CAB.Value);
      QOficinaCad.open;
    end;
end;

procedure TFOficinaCad.SBOperacaoConsClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  if (not DMOperacao.QOperacaoCons.Eof) and (DMOperacao.QOperacaoConsIND_TIPO_OPERACAO.Value = 'E') then
    FOperacaoCons.BtProcurar.Click; // para nao permitir usar consulta anterior de operacao de entrada
  if FOperacaoCons.ShowModal = MrOk then
    DMOficina.QOficinaCadCOD_OPERACAO.Value := DMOperacao.QOperacaoConsCOD_OPERACAO.Value;
  FOperacaoCons.RGTipoOperacao.ItemIndex := 0;
  FOperacaoCons.RGTipoOperacao.Enabled := True;
end;

procedure TFOficinaCad.GeraContasReceber(wListaParcela: TStrings; wFinalidade:Integer; wDepartamento:Integer);
var
  wAux: String;
  wTotalParcelas, wDifer: Real;
  wCont: Integer;
begin
  wTotalParcelas := 0;
  For wCont := 0 to wListaParcela.Count - 1 do
  Begin
    wAux := Copy(wListaParcela[wCont],11,15);
    wAux := Bib.LimpaString(wAux,'.');
    wTotalParcelas := wTotalParcelas + StrToFloat(Trim(wAux));
  End;

  with DMOficina do
  begin
    if QSomaItemOficinaCOD_OFICINA_CAB.Value <> QOficinaCadCOD_OFICINA_CAB.Value then
    begin
      QSomaItemOficina.Close;
      QSomaItemOficina.open;
    end;

    wDifer := QSomaItemOficinaSVAL_TOTAL.Value - wTotalParcelas;
//    If Abs(wDifer) <= 0.02 Then
//      wTotalParcelas := wTotalParcelas + wDifer;

//    If Abs(wTotalParcelas - wTotalNota)  > 0.01 then // - QNotaSaidaVal_Desconto.Value)) > 0.01 then
//      Raise Exception.Create('Soma das parcelas diferente do valor total da Nota!');
    For wCont := 0 to wListaParcela.Count - 1 do
    Begin
      QContaReceber.Open;
      Try
        QContaReceber.Insert;
        QContaReceberCOD_CONTA_RECEBER_CAB.Value := DMOracle.Sequencia('CONTA_RECEBER');
        QContaReceberCOD_FINALIDADE.Value := wFinalidade;
        QContaReceberCOD_CADASTRO.Value := QOficinaCadCOD_CADASTRO.Value;
        QContaReceberCOD_FILIAL.Value := QOficinaCadCOD_FILIAL.Value;
        QContaReceberCOD_DEPARTAMENTO.Value := wDepartamento;
        QContaReceberNUM_TITULO.Value := QOficinaCadNUM_OFICINA_CAB.Value;
        QContaReceberNUM_PARCELA.Value := wCont+1;
        QContaReceberDESC_TIPO_DOCUMENTO.Value := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_FILIAL',
            'COD_FILIAL = ' + QOficinaCadCOD_FILIAL.Text);
        QContaReceberDT_MOVIMENTO.Value := DMOracle.DataHoraServ;
        // QContaReceberDT_BAIXA.Value : TDateTimeField;
        QContaReceberDT_VENCIMENTO.Value := StrToDate(Copy(wListaParcela[wCont],1,10));
        QContaReceberDT_EMISSAO.Value := QOficinaCadDT_FECHAMENTO.Value;
//          QContaReceberDT_CAPITALIZACAO_MOEDA.Value := QNotaSaidaDt_Emissao.Value;
        With DMFinalidade do
        Begin
          QFinalidade.Close;
          QFinalidade.SetVariable('PK',wFinalidade);
          QFinalidade.Open;
          If QFinalidadeInd_Encargo.Value = 'EMISSAO' Then
            QContaReceberDT_CAPITALIZACAO.Value := QContaReceberDT_EMISSAO.Value
          Else
            QContaReceberDT_CAPITALIZACAO.Value := QContaReceberDT_VENCIMENTO.Value;
        End;
        wAux := Copy(wListaParcela[wCont],11,15);
        wAux := Bib.LimpaString(wAux,'.');
        If (wCont = 0) And (wDifer <> 0) Then
          wAux := FloatToStr(StrToFloat(Trim(wAux)) + wDifer);

        QContaReceberVAL_TITULO.Value := StrToFloat(Trim(wAux));
//          QContaReceberCOD_NOTA_CAB.Value := QNotaSaidaCod_Nota_Cab.Value;
        QContaReceberCOD_OFICINA_CAB.Value := QOficinaCadCOD_OFICINA_CAB.Value;
        //QContaReceberDESC_OBSERVACAO.Value : TStringField;
//          QContaReceberIND_ACEITE.Value := 'NAO';
        QContaReceberIND_SITUACAO.Value := 'ABERTO';
        QContaReceberVAL_ORIGINAL.Value := QContaReceberVal_Titulo.Value;
        QContaReceberCOD_VENDEDOR.Value := QOficinaCadCOD_VENDEDOR.Value;
//          If QNotaSaidaCod_Contrato_Vend.Text <> '' Then
//            QContaReceberCOD_CONTRATO_VEND.Value := QNotaSaidaCod_Contrato_Vend.Value;
//          If wContaCorrente <> '' Then
//            QContaReceberCod_Conta_Corrente.Value := StrToInt(Trim(wContaCorrente));
        QContaReceber.Post;
        QContaReceberMov.Open;
        QContaReceberMov.Insert;
        QContaReceberMovCOD_CONTA_RECEBER_CAB.Value := QContaReceberCOD_CONTA_RECEBER_CAB.Value;
        QContaReceberMovCOD_CONTA_RECEBER_MOV.Value := DMOracle.Sequencia('CONTA_RECEBER_MOV');
        QContaReceberMovDT_MOVIMENTO.Value := Date;
        QContaReceberMovIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
        QContaReceberMovDT_USUARIO.Value := DMOracle.DataHoraServ;
        QContaReceberMovCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
        QContaReceberMovVAL_MOVIMENTO.Value :=  QContaReceberVAL_TITULO.Value;
        QContaReceberMov.Post;
      Except
        If QContaReceberMov.State in [dsEdit,dsInsert] then
          QContaReceberMov.Cancel;
        If QContaReceber.State in [dsEdit,dsInsert] then
          QContaReceber.Cancel;
        Raise;
      End;
      QContaReceberMov.Close;
      QContaReceber.Close;
    end;
  end;
end;

procedure TFOficinaCad.Fecha();
var
  wAux: String;
begin
  with DMOficina do
  begin
    QOficinaCad.Edit;
    QOficinaCadIND_SITUACAO.Value := 'F';
    QOficinaCadDT_FECHAMENTO.Value := Date;
    if QOficinaCadNUM_OFICINA_CAB.Text = '' then
    begin
      QOficinaCadNUM_OFICINA_CAB.Value := DMSerie.NumeroSerie(QOficinaCadCOD_FILIAL.Value,
          QOficinaCadCOD_SERIE.Value, QOficinaCadCOD_SERIE_MODELO.Value);
    end;
    QOficinaCad.Post;

    wAux := DMOracle.BuscaNome('SELECT IND_ESTOQUE FROM TB_FILIAL', 'COD_FILIAL = ' +
        QOficinaCadCOD_FILIAL.Text);
    if wAux = 'S' then
    begin
      wAux := DMOracle.BuscaNome('SELECT IND_ESTOQUE FROM TB_OPERACAO', 'COD_OPERACAO = ' +
          QOficinaCadCOD_OPERACAO.Text);
      if wAux = 'S' then
      begin
        QOficinaItem.AutoCalcFields := False;
        QOficinaItem.First;
        while not QOficinaItem.Eof do
        begin
          DMEstoque.AtualizaEstoque(QOficinaCadCOD_OPERACAO.Value,
                                    QOficinaCadCOD_FILIAL.Value,
                                    QOficinaItemCOD_PRODUTO.Value,
                                    1,
                                    QOficinaItemQT_QUANTIDADE.Value * -1,
                                    QOficinaItemVAL_UNITARIO.Value,
                                    0,
                                    QOficinaCadDT_FECHAMENTO.Value);
          QOficinaItem.Next;
        end;
        QOficinaItem.AutoCalcFields := True;
      end;
    end;
  end;
end;

procedure TFOficinaCad.Fechar1Click(Sender: TObject);
var
  wAux: String;
  wDataI, wDataF: TDate;
  wValor: Real;
  wLinha: String;
  wLinhas: TStrings;
const wBranco : String = '                            ';
begin
  inherited;
  with DMOficina do
  begin
    try
      if not DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.StartTransaction;
      QOficinaItem.First;
      if QOficinaItem.Eof then
        Raise Exception.Create('Não é possível confirmar uma Ordem de Serviço sem itens.');
      if not DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.StartTransaction;
      if QOficinaCadCOD_OFICINA_CAB.Text = '' then
        Raise Exception.Create('Por favor, selecione uma Ordem de Serviço para confirmar.');
      QSomaItemOficina.Close;
      QSomaItemOficina.open;
      Fecha();
      if QOficinaCadIND_CONDICAO_PAGTO.Value = 2 then
      begin
        wAux := DMOracle.BuscaNome('SELECT COD_PRAZO_VENCIMENTO FROM TB_CADASTRO',
            'COD_CADASTRO = ' + QOficinaCadCOD_CADASTRO.Text);
        if wAux <> '' then
        begin
          with DMPrazoVencimento do
          begin
            wLinhas := TStringList.Create;
            QPrazoVencimento.Close;
            QPrazoVencimento.SetVariable('PK', wAux);
            QPrazoVencimento.Open;
            QPrazoVencimentoDias.Close;
            QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO', QPrazoVencimentoCOD_PRAZO_VENCIMENTO.Value);
            QPrazoVencimentoDias.SetVariable('NUM_DIAS', null);
            QPrazoVencimentoDias.Open;
            if QPrazoVencimentoDias.RecordCount <> QPrazoVencimentoNUM_PARCELAS.Value then
              Raise Exception.Create('Número das parcelas definidas no Prazo não corresponde ao número de parcelas cadastradas para o mesmo.');
            wValor := QSomaItemOficinaSVAL_TOTAL.Value / QPrazoVencimentoNUM_PARCELAS.Value;

            wDataF := Date;
            if QPrazoVencimentoIND_FORA_MES.Value = 'S' then
            begin
              Bib.PriUltDataVar(wDataI, wDataF, True);
              wDataF := wDataF + 1;
            end;

            QPrazoVencimentoDias.First;
            while not QPrazoVencimentoDias.Eof do
            begin
              wLinha := DateToStr(wDataF + QPrazoVencimentoDiasNUM_DIAS.Value);
              wAux := FormatFloat('###,###,##0.00',wValor);
              wLinha := wLinha + Copy(wBranco,1,15-Length(wAux)) + wAux;
              wLinhas.Append(wLinha);
              QPrazoVencimentoDias.Next;
            end;
            GeraContasReceber(wLinhas,2,1);
          end;
        end
        else
        begin
          if FOficinaConfirma = nil then
            FOficinaConfirma := TFOficinaConfirma.Create(Application);
          FOficinaConfirma.wTotalOS := QSomaItemOficinaSVAL_TOTAL.Value;
          if FOficinaConfirma.ShowModal = MrOk then
          begin
            GeraContasReceber(FOficinaConfirma.LBContaReceber.Items,
                              StrToInt(Trim(FOficinaConfirma.MEFinalidade.Text)),
                              StrToInt(Trim(FOficinaConfirma.MEDepartamento.Text)));
          end
          else
            DMOracle.DBCemapa.Rollback;
        end;
      end
      else
        DMNotaSaida.AtuCaixa(QSomaItemOficinaSVAL_TOTAL.Value,'A VISTA',QOficinaCadCOD_OPERACAO.Text,QOficinaCadCOD_FILIAL.Text,
                             '','',QOficinaCadCOD_CADASTRO.Text,'',QOficinaCadCOD_OFICINA_CAB.Text,Date);
      if DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.Commit;
      if (MessageDlg('Imprimir Orçamento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        EmiteFechamento;
    except
      DMOracle.DBCemapa.Rollback;
      SBRefresh.Click;
      Raise;
    end;
  end;
  SBRefresh.Click;
end;

procedure TFOficinaCad.EmitirNFdaOrdemdeServio1Click(Sender: TObject);
var
  wCodNota, wContProd, wContServ: Integer;
  wAux: String;
  wDescProd, wDescServ: Real;
begin
  inherited;
  if DMOficina.QOficinaCadIND_SITUACAO.Value <> 'F' then
    Raise Exception.Create('Ordem de Serviço não foi confirmada.');
  if DMOficina.QOficinaCadCOD_NOTA_CAB.Text <> '' then
    Raise Exception.Create('Já foi emitida uma NF para essa Ordem de Serviço.');
  try
    if FOficinaParam = nil then
      FOficinaParam := TFOficinaParam.Create(Application);
    FOficinaParam.PGRelatorio.Pages[19].TabVisible := True;
    FOficinaParam.M19Observacao.Lines.Text := DMOficina.QOficinaCadDESC_SERVICO.Text;
    FOficinaParam.RGPreview.Visible := False;
    FOficinaParam.Fm19Cadastro.MeCadastro.Text := DMOficina.QOficinaCadCOD_CADASTRO.Text;
    FOficinaParam.ME19DescPecas.Text := DMOficina.QOficinaCadVAL_DESCONTO_PECAS.Text;
    FOficinaParam.ME19DescServicos.Text := DMOficina.QOficinaCadVAL_DESCONTO_SERVICOS.Text;
    if FOficinaParam.ShowModal = MrOk then
    begin
      if Trim(FOficinaParam.Fm19Cadastro.MeCadastro.Text) = '' then
        FOficinaParam.Fm19Cadastro.MeCadastro.Text := DMOficina.QOficinaCadCOD_CADASTRO.Text
      else
        if DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO',
            'COD_CADASTRO = ' + FOficinaParam.Fm19Cadastro.MeCadastro.Text) = '' then
          Raise Exception.Create('Cadastro informado invalido.');
      if not DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.StartTransaction;
      DMOficina.QSomaItemOficina.Close;
      DMOficina.QSomaItemOficina.open;
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK', DMOficina.QOficinaCadCOD_FILIAL.Value);
      DMFilial.QFilial.open;
      wDescProd := 0;
      wDescServ := 0;
      wContProd := 0;
      wContServ := 0;
      if FOficinaParam.RG19TipoValor.ItemIndex = 0 then //Desconto por valor
      begin
        wAux := DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_OFICINA_ITEM, TB_PRODUTO',
            'TB_OFICINA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO AND TB_OFICINA_ITEM.COD_OFICINA_CAB = ' +
            DMOficina.QOficinaCadCOD_OFICINA_CAB.Text + ' AND TB_PRODUTO.IND_TIPO_PRODUTO = ''SERVIÇO''');
        if wAux <> '' then
          wContServ := StrToInt(wAux);
        wAux := DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_OFICINA_ITEM, TB_PRODUTO',
            'TB_OFICINA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO AND TB_OFICINA_ITEM.COD_OFICINA_CAB = ' +
            DMOficina.QOficinaCadCOD_OFICINA_CAB.Text + ' AND TB_PRODUTO.IND_TIPO_PRODUTO <> ''SERVIÇO''');
        if wAux <> '' then
          wContProd := StrToInt(wAux);
        if (wContProd > 0) and (Trim(FOficinaParam.ME19DescPecas.Text) <> '') then
          wDescProd := StrToFloat(Trim(FOficinaParam.ME19DescPecas.Text)) / wContProd;
        if (wContServ > 0) and (Trim(FOficinaParam.ME19DescServicos.Text) <> '') then
          wDescServ := StrToFloat(Trim(FOficinaParam.ME19DescServicos.Text)) / wContServ;
      end;

      with DMNotaSaida do
      begin
        QNotaSaida.close;
        QNotaSaida.open;
        QItemNF.close;
        QItemNF.open;
        QNotaSaida.Insert;
        QNotaSaidaCOD_FILIAL.Value := DMOficina.QOficinaCadCOD_FILIAL.Value;
        QNotaSaidaCOD_CADASTRO.Value := StrToInt(Trim(FOficinaParam.Fm19Cadastro.MeCadastro.Text));
        QNotaSaidaCOD_OPERACAO.Value := DMOficina.QOficinaCadCOD_OPERACAO.Value;
        QNotaSaidaCOD_VENDEDOR.Value := DMOficina.QOficinaCadCOD_VENDEDOR.Value;
        QNotaSaidaCOD_ESTADO.Value := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO = ' + DMOficina.QOficinaCadCOD_CADASTRO.Text);
        QNotaSaidaIND_CONDICAO_PAGTO.Value := IntToStr(DMOficina.QOficinaCadIND_CONDICAO_PAGTO.Value);
        QNotaSaidaCOD_SERIE.Value := DMFilial.QFilialCOD_SERIE.Value;
        QNotaSaidaNUM_NOTA.Value := DMSerie.NumeroSerie(DMOficina.QOficinaCadCOD_FILIAL.Value,
                                                        DMFilial.QFilialCOD_SERIE.Value,
                                                        DMFilial.QFilialCOD_SERIE_MODELO.Value);
//        QNotaSaidaVAL_DESCONTO.Value := DMOficina.QSomaItemOficinaSVAL_DESC_VENDA.Value;//Apenas o desconto de venda cai na nota
        QNotaSaidaDESC_OBS_CORPO_NOTA.Value := FOficinaParam.M19Observacao.Lines.Text;
        QNotaSaida.Post;
        QNotaSaida.Edit;

        DMOficina.QOficinaItem.AutoCalcFields := False;
        QItemNF.AutoCalcFields := False;
        DMOficina.QOficinaItem.First;            //------------------------------------ PRODUTOS
        while not DMOficina.QOficinaItem.Eof do
        begin
          QItemNF.Insert;
          QItemNFCOD_TRIBUTACAO.Value := StrToInt(DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO', 'COD_PRODUTO = ' + DMOficina.QOficinaItemCOD_PRODUTO.Text));
          QItemNFCOD_PRODUTO.Value := DMOficina.QOficinaItemCOD_PRODUTO.Value;
          QItemNFQT_QUANTIDADE.Value := DMOficina.QOficinaItemQT_QUANTIDADE.Value;
          QItemNFVAL_IPI.Value := 0;
          QItemNFCOD_LOTE_TIPO.Value := 1;
          QItemNFVAL_UNITARIO.Value := DMOficina.QOficinaItemVAL_UNITARIO.Value;

          // DESCONTOS DOS ITENS
          if FOficinaParam.RG19TipoValor.ItemIndex = 0 then //Desconto por valor
          begin
            wAux := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
            if wAux = 'SERVIÇO' then
              QItemNFVAL_DESCONTO.Value := wDescServ
            else
              QItemNFVAL_DESCONTO.Value := wDescProd;
          end
          else
          begin
            wAux := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO',
                'COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
            if (wAux = 'SERVIÇO') and (FOficinaParam.ME19DescServicos.Text > '0') then
              QItemNFPERC_DESCONTO.Value := StrToFloat(FOficinaParam.ME19DescServicos.Text);
            if (wAux <> 'SERVIÇO') and (FOficinaParam.ME19DescPecas.Text > '0') then
              QItemNFPERC_DESCONTO.Value := StrToFloat(FOficinaParam.ME19DescPecas.Text);

            QItemNFVAL_DESCONTO.Value := DMOficina.QOficinaItemVAL_TOTAL.Value * QItemNFPERC_DESCONTO.Value / 100;
          end;
          // FIM DESCONTOS

          QItemNF.Post;
          wAux := FloatToStr(DMOficina.QOficinaItemVAL_TOTAL.Value - QItemNFVAL_DESCONTO.Value);
          DMOracle.ExecutaSql('UPDATE TB_NOTA_ITEM SET VAL_TOTAL = ' + Bib.TrocaVirgulaPorPonto(wAux) +
              ', VAL_UNITARIO = ' + Bib.TrocaVirgulaPorPonto(DMOficina.QOficinaItemVAL_UNITARIO.Text) +
              ' WHERE COD_NOTA_ITEM = ' + QItemNFCOD_NOTA_ITEM.Text, False); // Feito dessa maneira porque no Post do item ele recalcula o valor total sem contar o desconto.
          DMOficina.QOficinaItem.Next;
        end;
        DMOficina.QOficinaItem.AutoCalcFields := True;
        QItemNF.AutoCalcFields := True;

        QNotaSaidaIND_SITUACAO.Value := '2'; //lancar como nota confirmada
        QNotaSaida.Post;
        DMOficina.QOficinaCad.Edit;
        DMOficina.QOficinaCadCOD_NOTA_CAB.Value := QNotaSaidaCOD_NOTA_CAB.Value;
        DMOficina.QOficinaCad.Post;

        wCodNota := QNotaSaidaCOD_NOTA_CAB.Value;
        QItemNF.Close;
        QNotaSaida.Close;
      end;
      If DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.Commit;
      FNotaImpressao.EmiteNF(wCodNota, 'NORMAL');
    end;
    FOficinaParam.RGPreview.Visible := True;
  except
    If DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Rollback;
    FOficinaParam.RGPreview.Visible := True;
    Raise;
  end;
end;

procedure TFOficinaCad.VoltaConfirmacao;
var
  wNotaCab: Integer;
begin
  if DMOficina.QOficinaCadIND_SITUACAO.Value <> 'F' then
    Raise Exception.Create('Ordem de Serviço não foi confirmada.');
  try
    if not DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.StartTransaction;
    with DMOficina do
    begin
      //1 - Atualiza Contas a Receber
      QContaReceber.Close;
      QContaReceber.Open;
      QContaReceberMov.Close;
      QContaReceberMov.Open;
      While not QContaReceber.Eof do
      Begin
        If QContaReceberMovIND_TIPO_MOVIMENTO.Value <> '' Then
        Begin
          If (QContaReceberMovIND_TIPO_MOVIMENTO.Value <> 'PRINCIPAL') then
            Raise Exception.Create('Conta a Receber com baixas!')
          Else
            QContaReceberMov.Delete;
        End;
        QContaReceber.Delete;
      End;

      //2 - Volta o Caixa
      QCaixa.Close;
      QCaixa.Open;
      While not QCaixa.Eof do
        QCaixa.Delete;
      QCaixa.Close;

      //3 - Atualiza Estoque
      QOficinaItem.AutoCalcFields := False;
      QOficinaItem.First;
      while not QOficinaItem.Eof do
      begin
        DMEstoque.AtualizaEstoque(QOficinaCadCOD_OPERACAO.Value,
                                  QOficinaCadCOD_FILIAL.Value,
                                  QOficinaItemCOD_PRODUTO.Value,
                                  1,
                                  QOficinaItemQT_QUANTIDADE.Value,
                                  QOficinaItemVAL_UNITARIO.Value,
                                  0,
                                  QOficinaCadDT_FECHAMENTO.Value);
        QOficinaItem.Next;
      end;
      QOficinaItem.AutoCalcFields := True;

      //4 - Atualiza situação
      wNotaCab := 0;
      if QOficinaCadCOD_NOTA_CAB.Text <> '' then
        wNotaCab := QOficinaCadCOD_NOTA_CAB.Value;
      QOficinaCad.Edit;
      QOficinaCadIND_SITUACAO.Value := 'A';
//      QOficinaCadVAL_DESC_FECHA_PROD.Value := 0;
//      QOficinaCadVAL_DESC_FECHA_SERV.Value := 0;
      QOficinaCadCOD_NOTA_CAB.Clear;
      QOficinaCadDT_FECHAMENTO.Clear;
      QOficinaCad.Post;

      //5 - Apaga NF, se foi gerada
      if wNotaCab > 0 then
      begin
        //DMOracle.ExecutaSql('UPDATE TB_OFICINA_CAB SET COD_NOTA_CAB = NULL WHERE COD_OFICINA_CAB = ' + QOficinaCadCOD_NOTA_CAB.Text, False);
        DMOracle.ExecutaSql('DELETE FROM TB_NOTA_ITEM WHERE COD_NOTA_CAB = ' + IntToStr(wNotaCab), False);
        DMOracle.ExecutaSql('DELETE FROM TB_NOTA_CAB WHERE COD_NOTA_CAB = ' + IntToStr(wNotaCab), False);
      end;
    end;
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
    DMOficina.QOficinaCad.Close;
    DMOficina.QOficinaCad.open;
  except
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Rollback;
    DMOficina.QOficinaCad.Close;
    DMOficina.QOficinaCad.open;
    Raise;
  end;
end;

procedure TFOficinaCad.VoltarConfirmao1Click(Sender: TObject);
begin
  inherited;
  VoltaConfirmacao;
  SBRefresh.Click;
end;

procedure TFOficinaCad.SBExcluirClick(Sender: TObject);
begin
//  inherited;
  If MessageDlg('Apagar este registro?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Exclui;
end;

procedure TFOficinaCad.DBECodOficinaCabChange(Sender: TObject);
begin
  inherited;
  MMCadSimples.Items[2].Items[0].Enabled := (DMOficina.QOficinaCadIND_SITUACAO.Value = 'A');
  MMCadSimples.Items[2].Items[1].Enabled := (DMOficina.QOficinaCadIND_SITUACAO.Value = 'F');
  MMCadSimples.Items[2].Items[2].Enabled := (DMOficina.QOficinaCadIND_SITUACAO.Value = 'A');
  MMCadSimples.Items[2].Items[3].Enabled := (DMOficina.QOficinaCadIND_SITUACAO.Value = 'C');
  MMCadSimples.Items[2].Items[4].Enabled := (DMOficina.QOficinaCadIND_SITUACAO.Value = 'F');
//  SBDescFechaProd.Enabled := (DMOficina.QOficinaCadIND_SITUACAO.Value = 'F');
//  SBDescFechaServ.Enabled := (DMOficina.QOficinaCadIND_SITUACAO.Value = 'F');
end;

procedure TFOficinaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DBECodOficinaCabChange(Self);
end;

procedure TFOficinaCad.SBAlterarClick(Sender: TObject);
begin
  if DMOficina.QOficinaCadIND_SITUACAO.Value <> 'A' then
    Raise Exception.Create('Esta Ordem de Serviço já foi fechada ou cancelada.');
  inherited;
end;

procedure TFOficinaCad.CancelarOrdemdeServio1Click(Sender: TObject);
begin
  inherited;
  if DMOficina.QOficinaCadIND_SITUACAO.Value <> 'A' then
    Raise Exception.Create('Só é possível cancelar OS em aberto.');
  try
    if not DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.StartTransaction;
    DMOficina.QOficinaCad.Edit;
    DMOficina.QOficinaCadIND_SITUACAO.Value := 'C';
    DMOficina.QOficinaCad.Post;
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  except
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Rollback;
    Raise;
  end;
  SBRefresh.Click;
end;

procedure TFOficinaCad.VoltarCancelamento1Click(Sender: TObject);
begin
  inherited;
  if DMOficina.QOficinaCadIND_SITUACAO.Value <> 'C' then
    Raise Exception.Create('Esta OS não foi cancelada');
  try
    if not DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.StartTransaction;
    DMOficina.QOficinaCad.Edit;
    DMOficina.QOficinaCadIND_SITUACAO.Value := 'A';
    DMOficina.QOficinaCad.Post;
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  except
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Rollback;
    Raise;
  end;
  SBRefresh.Click;
end;

Procedure TFOficinaCad.EmiteFechamento;
var
  wProdutos: Array of TItem;
  wServicos: Array of TItem;
  wItem: TItem;
  i: Integer;
begin
  with DMOficina do
  begin
    QOficinaItem.First;
    while not QOficinaItem.Eof do
      with DMProduto do
      begin
        QProduto.Close;
        QProduto.SetVariable('PK', QOficinaItemCOD_PRODUTO.Value);
        QProduto.open;

        wItem.UnItem := QProdutoDESC_UNIDADE.Value;
        wItem.CodItem := Trunc(QProdutoCOD_PRODUTO.Value);
        wItem.QtdItem := QOficinaItemQT_QUANTIDADE.Value;
        wItem.DescItem := QProdutoDESC_PRODUTO.Value;
        if QOficinaItemDESC_COMPLEMENTO.Text <> '' then
          wItem.DescItem := QOficinaItemDESC_COMPLEMENTO.Value;
        wItem.PercDesconto := QOficinaItemPERC_DESCONTO_VENDA.Value;
        wItem.ValUn := QOficinaItemVAL_UNITARIO.Value;
        wItem.ValItem := QOficinaItemVAL_TOTAL.Value;

        if QProdutoIND_TIPO_PRODUTO.Value <> 'SERVIÇO' then
        begin
          i := Length(wProdutos);
          SetLength(wProdutos, i + 1);
          wProdutos[i] := wItem;
        end
        else
        begin
          i := Length(wServicos);
          SetLength(wServicos, i + 1);
          wServicos[i] := wItem;
        end;
        QOficinaItem.Next;
      end;
    if Length(wProdutos) > 0 then
      Imprime(wProdutos);
    if Length(wServicos) > 0 then
      Imprime(wServicos, 'SERVICO');
  end;
end;

Procedure TFOficinaCad.Imprime(wItems: Array of TItem; wTipo: String = 'PECA'); // wTipo informa o que está imprimindo (PECA ou SERVICO)
var
  wAux: String;
  wCont, wMaxLinhas, i, j: Integer;
  wTotalItems, wDesconto: Real;
begin
  wAux := DMOracle.BuscaNome('SELECT DESC_LPT_PEDIDO FROM TB_FILIAL', 'COD_FILIAL = ' +
                                  DMOficina.QOficinaCadCOD_FILIAL.Text);
  if Imp = Nil Then
    Imp := TImp.Create;
  if Trim(wAux) = 'LPT1' then
    Imp.AbreImpressora
  else
    if Trim(wAux) = 'LPT2'
    then
      Imp.AbreImpressora_Lpt2
    else
      Imp.AbreImpressora_Com2;
  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);


  // Emissão de Orçamento de Fechamento de OS para a Retífica INJEPAR
  wTotalItems := 0;
  wDesconto := 0;

  i := 0;
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('PK', DMOficina.QOficinaCadCOD_CADASTRO.Value);
  DMCadastro.QCadastro.open;
  if wTipo = 'PECA' then
    wMaxLinhas := 37
  else
    wMaxLinhas := 31;

  while i < Length(wItems) do
  begin
    wCont := 0;
    Imp.WriteXY(0,wCont,'INJEPAR-RETIFICA MOTORES MEDIANEIRA LTDA');
    if i > 0 then
      Imp.WriteXY(17,wCont,'CONTINUACAO');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'AV. 24 DE OUTUBRO. 1820 - MEDIANEIRA/PR - FONE: (045)3264-3195');
    Inc(wCont, 2);
    Imp.WriteXY(7.3,wCont,'O  R  C  A  M  E  N  T  O');
    Inc(wCont);
    wAux := Bib.NumToTexto(DMOficina.QOficinaCadNUM_OFICINA_CAB.Value, 0, 6);
    wAux := StringReplace(wAux,'1','M',[rfReplaceAll]);
    wAux := StringReplace(wAux,'2','A',[rfReplaceAll]);
    wAux := StringReplace(wAux,'3','R',[rfReplaceAll]);
    wAux := StringReplace(wAux,'4','C',[rfReplaceAll]);
    wAux := StringReplace(wAux,'5','E',[rfReplaceAll]);
    wAux := StringReplace(wAux,'6','L',[rfReplaceAll]);
    wAux := StringReplace(wAux,'7','I',[rfReplaceAll]);
    wAux := StringReplace(wAux,'8','N',[rfReplaceAll]);
    wAux := StringReplace(wAux,'9','O',[rfReplaceAll]);
    wAux := StringReplace(wAux,'0','*',[rfReplaceAll]);
    Imp.WriteXY(19.3,wCont, wAux);

    Inc(wCont);
    Imp.WriteXY(0,wCont,'Cliente.....: ' + DMOficina.QOficinaCadCOD_CADASTRO.Text + ' - ' + DMCadastro.QCadastroNOME.Value);
    Inc(wCont);
    if DMCadastro.QCadastroCOD_CIDADE.Text <> '' then
      wAux := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE', 'COD_CIDADE=' + DMCadastro.QCadastroCOD_CIDADE.Text)
    else
      wAux := DMCadastro.QCadastroDESC_CIDADE.Value;
    Imp.WriteXY(0,wCont,'Endereco....: ' + DMCadastro.QCadastroDESC_ENDERECO.Value);
    Imp.WriteXY(11,wCont,'Cidade: ' + wAux);
    Imp.WriteXY(18.2,wCont,'Estado: ' + DMCadastro.QCadastroCOD_ESTADO.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Data Entrada: ' + DMOficina.QOficinaCadDT_ENTRADA.Text);
    Imp.WriteXY(7.5,wCont,'Fone: ' + DMCadastro.QCadastroDESC_TELEFONE.Value);
    Imp.WriteXY(14.5,wCont,'Dt Fechamento: ' + DMOficina.QOficinaCadDT_FECHAMENTO.Text);
    Inc(wCont);
//    if DMOficina.QOficinaCadCOD_VEICULO.Text <> '' then
//      Imp.WriteXY(0,wCont,'Motor.......: ' + DMOracle.BuscaNome('SELECT DESC_CARACTERISTICA FROM TB_VEICULO',
//          'COD_VEICULO=' + DMOficina.QOficinaCadCOD_VEICULO.Text));
//    if (DMOficina.QOficinaCadDESC_COMPL_MARCA.Text <> '') then
//      Imp.WriteXY(0,wCont,'Motor.......: ' + DMOficina.QOficinaCadDESC_COMPL_MARCA.Text)
//    else
//      Imp.WriteXY(0,wCont,'Motor.......: ' + DMOracle.BuscaNome('SELECT DESC_MARCA FROM TB_MARCA', 'COD_MARCA = ' + DMOficina.QOficinaCadCOD_MARCA.Text));
    if DMOficina.QOficinaCadIND_DESCRICAO_MARCA.Value <> 'S' then
    begin
      Imp.WriteXY(0,wCont, 'Motor.......: ' + DMOracle.BuscaNome('SELECT DESC_MARCA FROM TB_MARCA',
          'COD_MARCA = ' + DMOficina.QOficinaCadCOD_MARCA.Text));
      Imp.WriteXY(10,wCont, DMOficina.QOficinaCadDESC_COMPL_MARCA.Text);
    end
    else
      Imp.WriteXY(0,wCont, 'Motor.......: ' + DMOficina.QOficinaCadDESC_COMPL_MARCA.Text);
    Imp.WriteXY(16.8,wCont,'Data: ' + DateToStr(Date));

    Inc(wCont);
    j := 0;
    while (j < 21) do
    begin
      Imp.WriteXY(j, wCont, '----'); //  Imprime a linha de traços
      Inc(j);
    end;

    Inc(wCont);
    j := 0;
//    Imp.WriteXY(0,wCont,'|');
    if wTipo = 'PECA' then
      Imp.WriteXY(8.5,wCont,'P  E  C  A  S')
    else
      Imp.WriteXY(7,wCont,'M  A  O    D  E    O  B  R  A');
//    Imp.WriteXY(20.3,wCont,'|');
    Inc(wCont);
    while (j < 21) do
    begin
      Imp.WriteXY(j, wCont, '----'); //  Imprime a linha de traços
      Inc(j);
    end;

    Inc(wCont);
//    Imp.WriteXY(0,wCont,'|');     // Cabeçalho
    Imp.WriteXY(0,wCont,'Uni');
    Imp.WriteXY(2,wCont,'Codigo');
    Imp.WriteXY(4.2,wCont,'Qtd');
    Imp.WriteXY(6.5,wCont,'Discriminacao');
    Imp.WriteXY(15.3,wCont,'Vlr. Un.');
    Imp.WriteXY(18.2,wCont,'Vlr. Total');
//    Imp.WriteXY(20.3,wCont,'|');

    j := 0;
    while i < Length(wItems) do
    begin
      Inc(wCont);
  //    Imp.WriteXY(0,wCont,'|');
      Imp.WriteXY(0,wCont,wItems[i].UnItem);
      Imp.WriteXY(2,wCont,Bib.NumToTexto(wItems[i].CodItem, 0, 6));
      Imp.WriteXY(3.5,wCont,Bib.NumToTexto(wItems[i].QtdItem, 0, 10));
      Imp.WriteXY(6.5,wCont,Copy(wItems[i].DescItem,1,35));
      Imp.WriteXY(15.7,wCont,Bib.NumToTexto(wItems[i].ValUn, 2, 6));
      Imp.WriteXY(18,wCont,Bib.NumToTexto(wItems[i].ValItem, 2, 11));
//      Imp.WriteXY(20.3,wCont,'|');

      wTotalItems := wTotalItems + wItems[i].ValItem;
      wDesconto := wDesconto + (wItems[i].ValItem * wItems[i].PercDesconto / 100);

      Inc(i);
      Inc(j);

      if (j >= wMaxLinhas) and ((Length(wItems) - i) > 2) then
      begin
        Inc(wCont);
    //    Imp.WriteXY(0,wCont,'|');
        Imp.WriteXY(16,wCont,'CONTINUA...');
  //      Imp.WriteXY(20.3,wCont,'|');

        Break;
      end;
    end;

//    for j := j to wMaxLinhas do
//    begin
//      Inc(wCont);
//      Imp.WriteXY(0,wCont,'|');
//      Imp.WriteXY(20.3,wCont,'|');
//    end;
    Inc(wCont, wMaxLinhas - j + 1);
//    Inc(wCont);
    j := 0;
    while (j < 21) do
    begin
      Imp.WriteXY(j, wCont, '----'); //  Imprime a linha de traços
      Inc(j);
    end;

    Inc(wCont);
//    Imp.WriteXY(0,wCont,'|');
    Imp.WriteXY(1,wCont,'TOTAL.....');
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wTotalItems, 2, 10));
//    Imp.WriteXY(20.3,wCont,'|');

    Inc(wCont);
//    Imp.WriteXY(0,wCont,'|');
    Imp.WriteXY(1,wCont,'DESCONTO.....');
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wDesconto, 2, 10));
//    Imp.WriteXY(20.3,wCont,'|');

    Inc(wCont);
//    Imp.WriteXY(0,wCont,'|');
    Imp.WriteXY(15.5,wCont,'-----------------');
//    Imp.WriteXY(20.3,wCont,'|');

    Inc(wCont);
//    Imp.WriteXY(0,wCont,'|');
    if wTipo = 'PECA' then
      Imp.WriteXY(1,wCont,'TOTAL GERAL PECAS...')
    else
      Imp.WriteXY(1,wCont,'TOTAL GERAL M. OBRA...');
    Imp.WriteXY(17,wCont,Bib.NumToTexto(wTotalItems - wDesconto, 2, 10));
//    Imp.WriteXY(20.3,wCont,'|');

    Inc(wCont);
//    Imp.WriteXY(0,wCont,'|');
    Imp.WriteXY(1,wCont,'OBS: ' + Copy(DMOficina.QOficinaCadDESC_SERVICO.Value,1,72));
//    Imp.WriteXY(20.3,wCont,'|');

    Inc(wCont);
    Imp.WriteXY(1,wCont,Copy(DMOficina.QOficinaCadDESC_SERVICO.Value,73,77));
//    Imp.WriteXY(0,wCont,'|');
//    Imp.WriteXY(20.3,wCont,'|');

    Inc(wCont, 2);
//    Imp.WriteXY(0,wCont,'|');
    Imp.WriteXY(7.5,wCont,'_________________________');
//    Imp.WriteXY(20.3,wCont,'|');

    Inc(wCont);
//    Imp.WriteXY(0,wCont,'|');
    Imp.WriteXY(9.5,wCont,'AUTORIZO');
//    Imp.WriteXY(20.3,wCont,'|');

    Inc(wCont);
    j := 0;
    while (j < 21) do
    begin
      Imp.WriteXY(j, wCont, '----'); //  Imprime a linha de traços
      Inc(j);
    end;

    if wTipo <> 'PECA' then
    begin
      Inc(wCont);
//      Imp.WriteXY(0,wCont,'|');
      Imp.WriteXY(8, wCont, 'M   E   D   I   D   A   S');
//      Imp.WriteXY(20.3,wCont,'|');

      Inc(wCont);
//      Imp.WriteXY(0,wCont,'|');
      Imp.WriteXY(0.8,wCont,'VIRABREQUIM');
      Imp.WriteXY(4,wCont,'|');
      Imp.WriteXY(4.8,wCont,'CARCACA');
      Imp.WriteXY(7.7,wCont,'|');
      Imp.WriteXY(8.5,wCont,'COMPRESSOR');
      Imp.WriteXY(12,wCont,'|');
      Imp.WriteXY(13,wCont,'BLOCO');
      Imp.WriteXY(16.4,wCont,'|');
      Imp.WriteXY(16.5,wCont,'COLO COMPRESSOR');
//      Imp.WriteXY(20.3,wCont,'|');

      Inc(wCont);
//      Imp.WriteXY(0,wCont,'|');
      Imp.WriteXY(0.8,wCont,'Mancal: ' + DMOficina.QOficinaCadVAL_VIRA_MANCAL.Text);
      Imp.WriteXY(4,wCont,'|');
      Imp.WriteXY(4.3,wCont,'Mancal: ' + DMOficina.QOficinaCadVAL_CARCACA_MANCAL.Text);
      Imp.WriteXY(7.7,wCont,'|');
      Imp.WriteXY(8.2,wCont,'Cilindro: ' + DMOficina.QOficinaCadDESC_COMPR_CILINDRO.Text);
      Imp.WriteXY(12,wCont,'|');
      Imp.WriteXY(12.5,wCont,'Cilindro: ' + DMOficina.QOficinaCadDESC_BLOCO_CILINDRO.Text);
      Imp.WriteXY(16.4,wCont,'|');
      Imp.WriteXY(16.6,wCont,'Colo C: ' + DMOficina.QOficinaCadVAL_COLO_C.Text);
//      Imp.WriteXY(20.3,wCont,'|');

      Inc(wCont);
//      Imp.WriteXY(0,wCont,'|');
      Imp.WriteXY(0.8,wCont,'Biela: ' + DMOficina.QOficinaCadVAL_VIRA_BIELA.Text);
      Imp.WriteXY(4,wCont,'|');
      Imp.WriteXY(4.3,wCont,'Aloj C: ' + DMOficina.QOficinaCadDESC_CARCACA_ALOJ_C.Text);
      Imp.WriteXY(7.7,wCont,'|');
      Imp.WriteXY(12,wCont,'|');
      Imp.WriteXY(16.4,wCont,'|');
//      Imp.WriteXY(20.3,wCont,'|');

      Inc(wCont);
      j := 0;
      while (j < 21) do
      begin
        Imp.WriteXY(j, wCont, '----'); //  Imprime a linha de traços
        Inc(j);
      end;
    end;
    Imp.SaltaPagina;
  end;
  Imp.FechaImpressora;
end;

procedure TFOficinaCad.Exclui();
begin
  if DMOficina.QOficinaCad.Eof then
    Raise Exception.Create('Selecione uma Ordem de Serviço.');
  if DMOficina.QOficinaCadIND_SITUACAO.Value <> 'A' then
    Raise Exception.Create('Esta Ordem de Serviço já foi fechada ou cancelada.');
  try
    if not DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.StartTransaction;
    DMOracle.ExecutaSql('DELETE FROM TB_OFICINA_ITEM WHERE COD_OFICINA_CAB = ' + DMOficina.QOficinaCadCOD_OFICINA_CAB.Text, False);
    DMOficina.QOficinaCad.Delete;
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  except
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Rollback;
    Raise;
  end;
end;

procedure TFOficinaCad.SBRefreshClick(Sender: TObject);
var wAux: Integer;
begin
//  inherited;
  wAux := DMOficina.QOficinaCadCOD_OFICINA_CAB.Value;
  DMOficina.QOficinaCad.Close;
  DMOficina.QOficinaCad.SetVariable('PK', wAux);
  DMOficina.QOficinaCad.open;
end;

procedure TFOficinaCad.Comisso1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
    FOficinaParam := TFOficinaParam.Create(Application);
  FOficinaParam.PGRelatorio.Pages[20].TabVisible := True;
  if FOficinaParam.ShowModal = MrOk then
    with DMOficina_Relatorio do
      if FOficinaParam.RG20Tipo.ItemIndex = 0 then
      begin
        QRComissao.Close;
        if Trim(FOficinaParam.Fm20Filial.MeFilial.Text) <> '' then
          QRComissao.SetVariable('COD_FILIAL', StrToInt(Trim(FOficinaParam.Fm20Filial.MeFilial.Text)))
        else
          QRComissao.SetVariable('COD_FILIAL', null);
        if Trim(FOficinaParam.Fm20Vendedor.MeVendedor.Text) <> '' then
          QRComissao.SetVariable('COD_VENDEDOR', StrToInt(Trim(FOficinaParam.Fm20Vendedor.MeVendedor.Text)))
        else
          QRComissao.SetVariable('COD_VENDEDOR', null);
        QRComissao.SetVariable('DT_INICIO', StrToDate(FOficinaParam.Fm20Datas.MeDtInicial.Text));
        QRComissao.SetVariable('DT_FIM', StrToDate(FOficinaParam.Fm20Datas.MeDtFinal.Text));
        QRComissao.open;

        if FRComissao = nil then
          FRComissao := TFRComissao.Create(Application);
        if Trim(FOficinaParam.Fm20Vendedor.MeVendedor.Text) <> '' then
          FRComissao.QRLVendedor.Caption := Trim(FOficinaParam.Fm20Vendedor.MeVendedor.Text) +
              ' - ' + FOficinaParam.Fm20Vendedor.EdVendedor.Text
        else
          FRComissao.QRLVendedor.Caption := FOficinaParam.Fm20Vendedor.EdVendedor.Text;
        FRComissao.QRLData.Caption := FOficinaParam.Fm20Datas.MeDtInicial.Text +
            ' até ' + FOficinaParam.Fm20Datas.MeDtFinal.Text;
        if Trim(FOficinaParam.Fm20Filial.MeFilial.Text) <> '' then
          FRComissao.QRLFilial.Caption := Trim(FOficinaParam.Fm20Filial.MeFilial.Text) +
              ' - ' + FOficinaParam.Fm20Filial.EdFilial.Text
        else
          FRComissao.QRLFilial.Caption := FOficinaParam.Fm20Filial.EdFilial.Text;

        if FOficinaParam.RGPreview.ItemIndex = 0 then
          FRComissao.QRPrimario.Preview
        else
          FRComissao.QRPrimario.Print;
        QRComissao.Close;
      end
      else
      begin
        QRComissaoSintetico.Close;
        if Trim(FOficinaParam.Fm20Filial.MeFilial.Text) <> '' then
          QRComissaoSintetico.SetVariable('COD_FILIAL', StrToInt(Trim(FOficinaParam.Fm20Filial.MeFilial.Text)))
        else
          QRComissaoSintetico.SetVariable('COD_FILIAL', null);
        if Trim(FOficinaParam.Fm20Vendedor.MeVendedor.Text) <> '' then
          QRComissaoSintetico.SetVariable('COD_VENDEDOR', StrToInt(Trim(FOficinaParam.Fm20Vendedor.MeVendedor.Text)))
        else
          QRComissaoSintetico.SetVariable('COD_VENDEDOR', null);
        QRComissaoSintetico.SetVariable('DT_INICIO', StrToDate(FOficinaParam.Fm20Datas.MeDtInicial.Text));
        QRComissaoSintetico.SetVariable('DT_FIM', StrToDate(FOficinaParam.Fm20Datas.MeDtFinal.Text));
        QRComissaoSintetico.Open;

        if FRComissaoSintetico = nil then
          FRComissaoSintetico := TFRComissaoSintetico.Create(Application);
        if Trim(FOficinaParam.Fm20Vendedor.MeVendedor.Text) <> '' then
          FRComissaoSintetico.QRLVendedor.Caption := Trim(FOficinaParam.Fm20Vendedor.MeVendedor.Text) +
              ' - ' + FOficinaParam.Fm20Vendedor.EdVendedor.Text
        else
          FRComissaoSintetico.QRLVendedor.Caption := FOficinaParam.Fm20Vendedor.EdVendedor.Text;
        FRComissaoSintetico.QRLData.Caption := FOficinaParam.Fm20Datas.MeDtInicial.Text +
            ' até ' + FOficinaParam.Fm20Datas.MeDtFinal.Text;
        if Trim(FOficinaParam.Fm20Filial.MeFilial.Text) <> '' then
          FRComissaoSintetico.QRLFilial.Caption := Trim(FOficinaParam.Fm20Filial.MeFilial.Text) +
              ' - ' + FOficinaParam.Fm20Filial.EdFilial.Text
        else
          FRComissaoSintetico.QRLFilial.Caption := FOficinaParam.Fm20Filial.EdFilial.Text;

        if FOficinaParam.RGPreview.ItemIndex = 0 then
          FRComissaoSintetico.QRPrimario.Preview
        else
          FRComissaoSintetico.QRPrimario.Print;
        QRComissaoSintetico.Close;
      end;
end;

procedure TFOficinaCad.EmitirCpiaOramento1Click(Sender: TObject);
begin
  inherited;
  if DMOficina.QOficinaCadIND_SITUACAO.Value <> 'F' then
    Raise Exception.Create('Emissão de Orçamento só pode ser feita em OS fechada.');
  EmiteFechamento;
end;

procedure TFOficinaCad.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = '+') then
  begin
    if (DSPrimario.State in [DsEdit, DsInsert]) then
    begin
      if (DSItens.State in [DsEdit, DsInsert]) then
        DMOficina.QOficinaItem.Post;
      DMOficina.QOficinaItem.Append;
      DBENumFabricante.SetFocus;
    end;
    Key := #0;
  end;
end;

procedure TFOficinaCad.OrdemdeServio1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
    FOficinaParam := TFOficinaParam.Create(Application);
  FOficinaParam.PGRelatorio.Pages[21].TabVisible := True;
  if FOficinaParam.ShowModal = MrOk then
    with DMOficina_Relatorio do
    begin
      if FOficinaParam.RG21Tipo.ItemIndex = 0 then
      begin
        QROficina.Close;
        QROficina.SetVariable('DT_INICIO', FOficinaParam.Fm21Datas.MeDtInicial.Text);
        QROficina.SetVariable('DT_FIM', FOficinaParam.Fm21Datas.MeDtFinal.Text);
        if Trim(FOficinaParam.Fm21Cadastro.MeCadastro.Text) <> '' then
          QROficina.SetVariable('COD_CADASTRO', Trim(FOficinaParam.Fm21Cadastro.MeCadastro.Text))
        else
          QROficina.SetVariable('COD_CADASTRO', null);
        if Trim(FOficinaParam.Fm21Filial.MeFilial.Text) <> '' then
          QROficina.SetVariable('COD_FILIAL', Trim(FOficinaParam.Fm21Filial.MeFilial.Text))
        else
          QROficina.SetVariable('COD_FILIAL', null);
        if Trim(FOficinaParam.Fm21Marca.MeMarca.Text) <> '' then
          QROficina.SetVariable('COD_MARCA', Trim(FOficinaParam.Fm21Marca.MeMarca.Text))
        else
          QROficina.SetVariable('COD_MARCA', null);
        if Trim(FOficinaParam.Fm21Veiculo.MeVeiculo.Text) <> '' then
          QROficina.SetVariable('COD_VEICULO', Trim(FOficinaParam.Fm21Veiculo.MeVeiculo.Text))
        else
          QROficina.SetVariable('COD_VEICULO', null);
        if Trim(FOficinaParam.Fm21Vendedor.MeVendedor.Text) <> '' then
          QROficina.SetVariable('COD_VENDEDOR', Trim(FOficinaParam.Fm21Vendedor.MeVendedor.Text))
        else
          QROficina.SetVariable('COD_VENDEDOR', null);
        if Trim(FOficinaParam.Fm21Operacao.MeOperacao.Text) <> '' then
          QROficina.SetVariable('COD_OPERACAO', Trim(FOficinaParam.Fm21Operacao.MeOperacao.Text))
        else
          QROficina.SetVariable('COD_OPERACAO', null);
        case FOficinaParam.RG21Situacao.ItemIndex of
          0: QROficina.SetVariable('IND_SITUACAO', 'A');
          1: QROficina.SetVariable('IND_SITUACAO', 'F');
          2: QROficina.SetVariable('IND_SITUACAO', 'C');
          3: QROficina.SetVariable('IND_SITUACAO', null);
        end;
        QROficina.open;

        if FROficina = nil then
          FROficina := TFROficina.Create(Application);
        FROficina.QRLFilial.Caption := FOficinaParam.Fm21Filial.EdFilial.Text;
        FROficina.QRLCliente.Caption := FOficinaParam.Fm21Cadastro.EdCadastro.Text;
        FROficina.QRLOperacao.Caption := FOficinaParam.Fm21Operacao.EdOperacao.Text;
        FROficina.QRLVendedor.Caption := FOficinaParam.Fm21Vendedor.EdVendedor.Text;
        FROficina.QRLVeiculo.Caption := FOficinaParam.Fm21Veiculo.EdVeiculo.Text;
        FROficina.QRLMarca.Caption := FOficinaParam.Fm21Marca.EdMarca.Text;
        FROficina.QRLPeriodo.Caption := FOficinaParam.Fm21Datas.MeDtInicial.Text + ' até ' + FOficinaParam.Fm21Datas.MeDtFinal.Text;
        if FOficinaParam.RGPreview.ItemIndex = 0 then
          FROficina.QRPrimario.Preview
        else
          FROficina.QRPrimario.Print;
      end
      else
      begin
        QROficinaSintetico.Close;
        QROficinaSintetico.SetVariable('DT_INICIO', FOficinaParam.Fm21Datas.MeDtInicial.Text);
        QROficinaSintetico.SetVariable('DT_FIM', FOficinaParam.Fm21Datas.MeDtFinal.Text);
        if Trim(FOficinaParam.Fm21Cadastro.MeCadastro.Text) <> '' then
          QROficinaSintetico.SetVariable('COD_CADASTRO', Trim(FOficinaParam.Fm21Cadastro.MeCadastro.Text))
        else
          QROficinaSintetico.SetVariable('COD_CADASTRO', null);
        if Trim(FOficinaParam.Fm21Filial.MeFilial.Text) <> '' then
          QROficinaSintetico.SetVariable('COD_FILIAL', StrToInt(Trim(FOficinaParam.Fm21Filial.MeFilial.Text)))
        else
          QROficinaSintetico.SetVariable('COD_FILIAL', null);
        if Trim(FOficinaParam.Fm21Marca.MeMarca.Text) <> '' then
          QROficinaSintetico.SetVariable('COD_MARCA', Trim(FOficinaParam.Fm21Marca.MeMarca.Text))
        else
          QROficinaSintetico.SetVariable('COD_MARCA', null);
        if Trim(FOficinaParam.Fm21Veiculo.MeVeiculo.Text) <> '' then
          QROficinaSintetico.SetVariable('COD_VEICULO', Trim(FOficinaParam.Fm21Veiculo.MeVeiculo.Text))
        else
          QROficinaSintetico.SetVariable('COD_VEICULO', null);
        if Trim(FOficinaParam.Fm21Vendedor.MeVendedor.Text) <> '' then
          QROficinaSintetico.SetVariable('COD_VENDEDOR', Trim(FOficinaParam.Fm21Vendedor.MeVendedor.Text))
        else
          QROficinaSintetico.SetVariable('COD_VENDEDOR', null);
        if Trim(FOficinaParam.Fm21Operacao.MeOperacao.Text) <> '' then
          QROficinaSintetico.SetVariable('COD_OPERACAO', Trim(FOficinaParam.Fm21Operacao.MeOperacao.Text))
        else
          QROficinaSintetico.SetVariable('COD_OPERACAO', null);
        case FOficinaParam.RG21Situacao.ItemIndex of
          0: QROficinaSintetico.SetVariable('IND_SITUACAO', 'A');
          1: QROficinaSintetico.SetVariable('IND_SITUACAO', 'F');
          2: QROficinaSintetico.SetVariable('IND_SITUACAO', 'C');
          3: QROficinaSintetico.SetVariable('IND_SITUACAO', null);
        end;
        QROficinaSintetico.open;

        if FROficinaSintetico = nil then
          FROficinaSintetico := TFROficinaSintetico.Create(Application);
        FROficinaSintetico.QRLFilial.Caption := FOficinaParam.Fm21Filial.EdFilial.Text;
        FROficinaSintetico.QRLCliente.Caption := FOficinaParam.Fm21Cadastro.EdCadastro.Text;
        FROficinaSintetico.QRLOperacao.Caption := FOficinaParam.Fm21Operacao.EdOperacao.Text;
        FROficinaSintetico.QRLVendedor.Caption := FOficinaParam.Fm21Vendedor.EdVendedor.Text;
        FROficinaSintetico.QRLVeiculo.Caption := FOficinaParam.Fm21Veiculo.EdVeiculo.Text;
        FROficinaSintetico.QRLMarca.Caption := FOficinaParam.Fm21Marca.EdMarca.Text;
        FROficinaSintetico.QRLPeriodo.Caption := FOficinaParam.Fm21Datas.MeDtInicial.Text + ' até ' + FOficinaParam.Fm21Datas.MeDtFinal.Text;
        if FOficinaParam.RGPreview.ItemIndex = 0 then
          FROficinaSintetico.QRPrimario.Preview
        else
          FROficinaSintetico.QRPrimario.Print;
      end;
    end;
end;

procedure TFOficinaCad.ImpressoCobrana1Click(Sender: TObject);
begin
  inherited;
  if FrReceberCobranca = nil then
    FrReceberCobranca := TFrReceberCobranca.Create(Application);
  DMContasReceber.QrContasReceberTitulo.Close;
  DMContasReceber.QrContasReceberTitulo.SetVariable('Cod_Cadastro',DMOficina.QOficinaCadCod_Cadastro.Value);
  DMContasReceber.QrContasReceberTitulo.SetVariable('Num_Titulo',DMOficina.QOficinaCadNUM_OFICINA_CAB.Value);
  DMContasReceber.QrContasReceberTitulo.SetVariable('Num_Parcela',Null);
  DMContasReceber.QrContasReceberTitulo.open;
  FrReceberCobranca.QRPrimario.Preview;

end;

procedure TFOficinaCad.ONItensClick(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  if (Button = nbInsert) then
  begin
    DMOficina.QOficinaItem.Cancel;
    DMOficina.QOficinaItem.Append;
  end;
end;

end.
