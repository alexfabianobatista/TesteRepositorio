unit UConhecimentoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, OracleData, OraTeste, DBDirceu, variants, ActnList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, XMLDoc,
  xmldom, XMLIntf, msxmldom;

type
  TFConhecimentoCad = class(TFTCadSimples)
    ImpressoConhecimento1: TMenuItem;
    Label19: TLabel;
    Opes1: TMenuItem;
    Confirma1: TMenuItem;
    VoltarConfirmao1: TMenuItem;
    Cancela1: TMenuItem;
    VoltarCancelamento1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label17: TLabel;
    SBNota: TSpeedButton;
    SBOperacao: TSpeedButton;
    Label3: TLabel;
    Label5: TLabel;
    Label21: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label25: TLabel;
    Panel3: TPanel;
    Label26: TLabel;
    Label34: TLabel;
    Label16: TLabel;
    Label33: TLabel;
    SbMensagem: TSpeedButton;
    DBEdit26: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit21: TDBEdit;
    Label14: TLabel;
    SBTributacao: TSpeedButton;
    SBCadastro: TSpeedButton;
    Label8: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label35: TLabel;
    DBEdit2: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    Panel2: TPanel;
    Label1: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    SBFilial: TSpeedButton;
    SBPlaca: TSpeedButton;
    SBMotorista: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit33: TDBEdit;
    SbContrato: TBitBtn;
    SbSerie: TBitBtn;
    DBEdit36: TDBEdit;
    TabSheet2: TTabSheet;
    Label36: TLabel;
    DBEdit37: TDBEdit;
    Label37: TLabel;
    DBEdit38: TDBEdit;
    Label38: TLabel;
    DBEdit39: TDBEdit;
    DBNavigator1: TDBNavigator;
    ImpressoConhecimentocContrato1: TMenuItem;
    ImpressoConhecimentosContrato1: TMenuItem;
    SbNotaEntrada: TSpeedButton;
    RelConhecimentoProprietrio1: TMenuItem;
    Label18: TLabel;
    DBEdit40: TDBEdit;
    BtContratoVenda: TBitBtn;
    Label23: TLabel;
    DBEdit41: TDBEdit;
    Label39: TLabel;
    DBEdit42: TDBEdit;
    Label40: TLabel;
    DBEdit43: TDBEdit;
    Label41: TLabel;
    DBEdit44: TDBEdit;
    Label42: TLabel;
    DBEdit45: TDBEdit;
    Label43: TLabel;
    DBEdit46: TDBEdit;
    Label44: TLabel;
    DBEdit47: TDBEdit;
    RelatrioConhecimento1: TMenuItem;
    Label45: TLabel;
    DBEdit48: TDBEdit;
    Label46: TLabel;
    DBEdit49: TDBEdit;
    SBNotaCorrecao: TSpeedButton;
    RelConhecimentoIR1: TMenuItem;
    Label47: TLabel;
    DBEdit50: TDBEdit;
    Label48: TLabel;
    DBEdit51: TDBEdit;
    RelConhecimentoINSSRetido1: TMenuItem;
    Label49: TLabel;
    DBEdit52: TDBEdit;
    Label50: TLabel;
    DBEdit53: TDBEdit;
    BtCadastroDescarga: TSpeedButton;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    DBDirceu6: TDBDirceu;
    DBEdit18: TDBEdit;
    Label20: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Label22: TLabel;
    Label24: TLabel;
    DBEdit22: TDBEdit;
    Label51: TLabel;
    DBEdit23: TDBEdit;
    BitBtn1: TBitBtn;
    Label52: TLabel;
    DBEdit25: TDBEdit;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    SbFilialDestino: TSpeedButton;
    DBEdit55: TDBEdit;
    DBDirceu3: TDBDirceu;
    DBEdit54: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBLCCstPis: TDBLookupComboBox;
    DBLCCstCofins: TDBLookupComboBox;
    Label56: TLabel;
    Label57: TLabel;
    DBEdit56: TDBEdit;
    Label58: TLabel;
    lblModelo: TLabel;
    Label104: TLabel;
    DBEdit89: TDBEdit;
    btImportaCte: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBFilialClick(Sender: TObject);
    procedure SBCadastroClick(Sender: TObject);
    procedure SBOperacaoClick(Sender: TObject);
    procedure SBPlacaClick(Sender: TObject);
    procedure SBMotoristaClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBNotaClick(Sender: TObject);
    procedure SBSerieClick(Sender: TObject);
    procedure SBTributacaoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure ImpressoConhecimento1Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SbContratoClick(Sender: TObject);
    procedure SbMensagemClick(Sender: TObject);
    procedure Confirma1Click(Sender: TObject);
    procedure VoltarConfirmao1Click(Sender: TObject);
    procedure DBEdit36Change(Sender: TObject);
    procedure VoltarCancelamento1Click(Sender: TObject);
    procedure Cancela1Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure ImpressoConhecimentocContrato1Click(Sender: TObject);
    procedure ImpressoConhecimentosContrato1Click(Sender: TObject);
    procedure SbNotaEntradaClick(Sender: TObject);
    procedure RelConhecimentoProprietrio1Click(Sender: TObject);
    procedure BtContratoVendaClick(Sender: TObject);
    procedure RelatrioConhecimento1Click(Sender: TObject);
    procedure SBNotaCorrecaoClick(Sender: TObject);
    procedure RelConhecimentoIR1Click(Sender: TObject);
    procedure RelConhecimentoINSSRetido1Click(Sender: TObject);
    procedure BtCadastroDescargaClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SbFilialDestinoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLCCstPisCloseUp(Sender: TObject);
    procedure DBLCCstCofinsCloseUp(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure DBEdit56Exit(Sender: TObject);
    procedure btImportaCteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimentoCad: TFConhecimentoCad;

implementation

uses UConhecimento_cl, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UOperacaoCons, UOperacao_cl, UVeiculoConhecimentoCons, UVeiculoConhecimento_cl, UMotoristaCons,
  UMotorista_cl, UConhecimentoCons, UNotaSaidaCons, UNotaSaida_cl,
  UTributacaoCons, UTributacao_cl, USerieCons, USerie_cl, uBiblioteca,
  UOracle_cl, UBaseCalculoIRF_cl, UParamSistema_cl, USequencia_cl,
  UConhecimento_CP, UContasPagar_cl, UPlanilha_cl, UContratoVenda_Cons,
  Ucontrato_cl, UUsuario_cl, UMensagemCons, UMensagem_cl,
  UConhecimentoFrete_cl, UConhecimentoParam, URConhecimentoContrato,
  URConhecimentoSContrato, UNotaEntradaCons, UNotaEntrada_cl,
  URConhecimentoIRF, URConhecimentoCarga, UNotaCorrecao, UNotaCorrecao_cl,
  URConhecimentoIR, URConhecimentoValorRetido, UEmbarqueCons, UEmbarque_cl,
  UHistorico_cl, UBancoAgencia_cl, UCaixa_cl;

{$R *.DFM}

procedure TFConhecimentoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMConhecimento.QConhecimentoCad.open;
  DMConhecimento.QConhecimentoAlt.open;
end;

procedure TFConhecimentoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMConhecimento.QConhecimentoCad.close;
  DMConhecimento.QConhecimentoCons.close;
  DMConhecimento.QConhecimentoAlt.close;
  action := cafree;
  FConhecimentoCad := nil;
end;

procedure TFConhecimentoCad.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    DMConhecimento.QConhecimentoCadCod_Filial.value := DMFilial.QFilialConsCod_Filial.value;
end;

procedure TFConhecimentoCad.SBCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
    DMConhecimento.QConhecimentoCadCod_Cadastro.value := DMCadastro.QCadastroConsCod_Cadastro.value;
end;

procedure TFConhecimentoCad.SBOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.create(application);
  if FOperacaoCons.showmodal = mrOk then
    DMConhecimento.QConhecimentoCadCod_Operacao.value := DMOperacao.QOperacaoConsCod_Operacao.value;
end;

procedure TFConhecimentoCad.SBPlacaClick(Sender: TObject);
begin
  inherited;
  if FVeiculoConhecimentoCons = nil then
    FVeiculoConhecimentoCons := TFVeiculoConhecimentoCons.create(application);
  if FVeiculoConhecimentoCons.showmodal = mrOk then
    DMConhecimento.QConhecimentoCadDesc_Placa.value := DMVeiculoConhecimento.QVeiculoConsDesc_Placa.value;
end;

procedure TFConhecimentoCad.SBMotoristaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
    DMConhecimento.QConhecimentoCadCod_Motorista.value := DMCadastro.QCadastroConsCod_Cadastro.value;
end;

procedure TFConhecimentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FConhecimentoCons = nil then
    FConhecimentoCons := TFConhecimentoCons.Create(Application);
  if FConhecimentoCons.ShowModal = mrOk then
  begin
    with DMConhecimento do
    begin
      QConhecimentoCad.Close;
      QConhecimentoCad.SetVariable('PK', QConhecimentoConsCod_Conhecimento.Value);
      QConhecimentoCad.Open;
    end;
  end;
  bib.setModelo(DMConhecimento.QConhecimentoCad, lblModelo);
end;

procedure TFConhecimentoCad.SBNotaClick(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = nil then
    FNotaSaidaCons := TFNotaSaidaCons.create(application);
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL' then // A pedido de Andreia, Grasel - 07/08/2009
  begin
    FNotaSaidaCons.BtFilialCons.Enabled := False;
    FNotaSaidaCons.MeFilial.Enabled := False;
  end;
  FNotaSaidaCons.MeFilial.Text := IntToStr(DmUsuario.CodFilialUsuario);
  if FNotaSaidaCons.ShowModal = mrOk then
    DMConhecimento.QConhecimentoCadCod_Nota_Cab.value := DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.value;
  FNotaSaidaCons.BtFilialCons.Enabled := True;
  FNotaSaidaCons.MeFilial.Enabled := True;
  DBEdit6Exit(self);
end;

procedure TFConhecimentoCad.SBSerieClick(Sender: TObject);
begin
  inherited;
  if FSerieCons = nil then
    FSerieCons := TFSerieCons.Create(Application);
  if FSerieCons.ShowModal = mrOk then
    DMConhecimento.QConhecimentoCadCod_Serie.Value := DMSerie.QSerieConsCod_Serie.Value;
end;

procedure TFConhecimentoCad.SBTributacaoClick(Sender: TObject);
begin
  inherited;
  if FTributacaoCons = nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal = mrOk then
    DMConhecimento.QConhecimentoCadCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;

end;

procedure TFConhecimentoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [Dsinsert, DsEdit] then
  begin
    FConhecimentoCad.SBFilial.enabled := True;
    FConhecimentoCad.SbFilialDestino.enabled := True;
    FConhecimentoCad.SBCadastro.enabled := True;
    FConhecimentoCad.SBOperacao.enabled := True;
    FConhecimentoCad.SBPlaca.enabled := True;
    FConhecimentoCad.SBMotorista.enabled := True;
    FConhecimentoCad.SBNota.enabled := True;
    FConhecimentoCad.SBTributacao.enabled := True;
    FConhecimentoCad.SBSerie.enabled := True;
    FConhecimentoCad.SBContrato.enabled := True;
    FConhecimentoCad.SBMensagem.enabled := True;
    FConhecimentoCad.SbNotaEntrada.Enabled := True;
    FConhecimentoCad.SBNotaCorrecao.Enabled := False;
  end
  else
  begin
    FConhecimentoCad.SBFilial.enabled := false;
    FConhecimentoCad.SbFilialDestino.enabled := false;
    FConhecimentoCad.SBCadastro.enabled := false;
    FConhecimentoCad.SBOperacao.enabled := false;
    FConhecimentoCad.SBPlaca.enabled := false;
    FConhecimentoCad.SBMotorista.enabled := false;
    FConhecimentoCad.SBNota.enabled := false;
    FConhecimentoCad.SBTributacao.enabled := false;
    FConhecimentoCad.SBSerie.enabled := false;
    FConhecimentoCad.SBContrato.enabled := false;
    FConhecimentoCad.SBMensagem.enabled := false;
    FConhecimentoCad.SbNotaEntrada.Enabled := False;
    FConhecimentoCad.SBNotaCorrecao.Enabled := True;
  end;
  MMCadSimples.Items[2].Enabled := DSPrimario.DataSet.State = dsBrowse;
  DBLCCstPis.Enabled := not (DSPrimario.DataSet.State = dsBrowse);
  DBLCCstCofins.Enabled := not (DSPrimario.DataSet.State = dsBrowse);
  btImportaCte.Enabled := not (DSPrimario.DataSet.State = dsBrowse);

end;

procedure TFConhecimentoCad.ImpressoConhecimento1Click(Sender: TObject);
var
  wCont: Integer;
  wEspecie, wMens, wProduto, wUsuario, wDesc_produto, wTotal_Kg, wEmpresa,
    wRemNome, wRemCnpj, wRemEndereco, wRemCidade, wRemUf,
    wDesNome, wDesCnpj, wDesEndereco, wDesCidade, wDesUf, wPorta: string;
//  wDesconto : Real;
  X, Y: array of string;
begin
  inherited;
  with DMConhecimento do
  begin
    QRConhecimento.close;
    QRConhecimento.setVariable('Cod_Conhecimento', QConhecimentoCadCod_Conhecimento.value);
    QRConhecimento.open;
    DmUsuario.Checar_Filial_Usuario(Trim(QRConhecimentoCOD_FILIAL.Text), 'CONHECIMENTO');
    setLength(x, 7); //6 sql diferentes
    setLength(y, 7);

    x[0] := 'SELECT DESC_FILIAL FROM TB_FILIAL WHERE COD_FILIAL = ' + QRConhecimentoCod_Filial_Nota.Text;
    x[1] := 'SELECT DESC_ENDERECO FROM TB_FILIAL WHERE COD_FILIAL = ' + QRConhecimentoCod_Filial_Nota.Text;
    x[2] := 'SELECT DESC_CIDADE FROM TB_FILIAL WHERE COD_FILIAL = ' + QRConhecimentoCod_Filial_Nota.Text;
    x[3] := 'SELECT COD_ESTADO FROM TB_FILIAL WHERE COD_FILIAL = ' + QRConhecimentoCod_Filial_Nota.Text;
    x[4] := 'SELECT NUM_CGC FROM TB_FILIAL WHERE COD_FILIAL = ' + QRConhecimentoCod_Filial_Nota.Text;
    x[5] := 'SELECT DESC_INSCRICAO FROM TB_FILIAL WHERE COD_FILIAL = ' + QRConhecimentoCod_Filial_Nota.Text;
    x[6] := 'SELECT DESC_LPT_NOTA FROM TB_FILIAL WHERE COD_FILIAL = ' + QRConhecimentoCod_Filial_Nota.Text;

    DMOracle.BuscaNomes(x, y);
    wEmpresa := DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA', '');

    if Imp = nil then
      Imp := TImp.Create;

    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
    begin
      wPorta := DMOracle.FastSelect('DESC_LPT_CONHECIMENTO', 'TB_FILIAL',
          'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));
      if wPorta = 'LPT3' then
        Imp.AbreImpressora_Lpt3
      else if wPorta = 'LPT2' then
        Imp.AbreImpressora_Lpt2
      else
        Imp.AbreImpressora;
      if QRConhecimentoCOD_FILIAL.Value <> 9 then //filial 9 do moinho vai imprimir em outro formulário
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON', 'SEXTOS', 51); //-----configurar pagina

        wCont := 1;
        Imp.WriteXY(4.0, wCont, QRConhecimentoDESC_FILIAL.Value);
        wCont := WCont + 1;
        Imp.WriteXY(4.0, wCont, (QRConhecimentoDESC_ENDERECO.Value + ' ' + 'FONE/FAX' + QRConhecimentoDESC_TELEFONE.Value));

        if QRConhecimentoCOD_ESTADO.Value <> QRConhecimentoUF_DESTINATARIO.Value then
          Imp.WriteXY(16, wCont, QRConhecimentoNat_InterEstadual_Novo.Text)
        else
          Imp.WriteXY(16, wCont, QRConhecimentoNat_Estadual_Novo.Text);
        wCont := WCont + 1;
        Imp.WriteXY(4.0, wCont, ('CEP ' + QRConhecimentoDESC_CEP.Value + ' ' + QRConhecimentoDESC_CIDADE.Value + ' - ' + QRConhecimentoCOD_ESTADO.Value));
        Imp.WriteXY(11.5, wCont, QRConhecimentoDESC_OPERACAO.Value);
        wCont := WCont + 1;
        Imp.WriteXY(4.0, wCont, ('CGC ' + QRConhecimentoNUM_CGC.Value + '  I.E ' + QRConhecimentoDESC_INSCRICAO.Value));
        Imp.WriteXY(12.5, wCont, DateToStr(QRConhecimentoDT_EMISSAO.Value));
        Imp.WriteXY(15, wCont, TimeToStr(Time));
        Imp.WriteXY(18.3, wCont, Bib.NumToTexto(QRConhecimentoNUM_CONHECIMENTO.Value, 0, 6));
        wCont := WCont + 2;
        if QRConhecimentoInd_Entrada_Saida.Value = 'S' then
        begin
          Imp.WriteXY(1.7, wCont, Y[0]);
          Imp.WriteXY(12.4, wCont, QRConhecimentoNOME.Value);
        end
        else
        begin
          Imp.WriteXY(1.7, wCont, QRConhecimentoNOME.Value);
          Imp.WriteXY(12.4, wCont, Y[0]);
        end;
        wCont := WCont + 1;
        if QRConhecimentoInd_Entrada_Saida.Value = 'S' then
        begin
          Imp.WriteXY(1.7, wCont, Y[1]);
          Imp.WriteXY(12.4, wCont, QRConhecimentoENDERECO_DESTINATARIO.Value);
        end
        else
        begin
          Imp.WriteXY(1.7, wCont, QRConhecimentoENDERECO_DESTINATARIO.Value);
          Imp.WriteXY(12.4, wCont, Y[1]);
        end;
        wCont := WCont + 1;
        if QRConhecimentoInd_Entrada_Saida.Value = 'S' then
        begin
          Imp.WriteXY(1.7, wCont, Y[2] + ' - ' + Y[3]);
          Imp.WriteXY(12.4, wCont, QRConhecimentoCIDADE_DESTINATARIO.Value + ' - ' + QRConhecimentoUF_DESTINATARIO.Value);
        end
        else
        begin
          Imp.WriteXY(1.7, wCont, QRConhecimentoCIDADE_DESTINATARIO.Value + ' - ' + QRConhecimentoUF_DESTINATARIO.Value);
          Imp.WriteXY(12.4, wCont, Y[2] + ' - ' + Y[3]);
        end;
        wCont := WCont + 1;
        if QRConhecimentoInd_Entrada_Saida.Value = 'S' then
        begin
          Imp.WriteXY(1.7, wCont, Y[4]);
          Imp.WriteXY(7.5, wCont, Y[5]);
          Imp.WriteXY(12.4, wCont, QRConhecimentoCGC_DESTINATARIO.Value);
          Imp.WriteXY(17.5, wCont, QRConhecimentoNUM_INSCRICAO.Value);
        end
        else
        begin
          Imp.WriteXY(1.7, wCont, QRConhecimentoCGC_DESTINATARIO.Value);
          Imp.WriteXY(7.5, wCont, QRConhecimentoNUM_INSCRICAO.Value);
          Imp.WriteXY(12.4, wCont, Y[4]);
          Imp.WriteXY(17.5, wCont, Y[5]);
        end;
        wCont := WCont + 2;
        if (QRConhecimentoCod_Nota_Cab.Text <> '') then
        begin
          wProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_NOTA_ITEM', 'COD_NOTA_CAB = ' + IntToStr(QRConhecimentoCod_Nota_Cab.Value));
          wMens := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + wProduto);
        end;
        Imp.WriteXY(0.3, wCont, wMens);
        Imp.WriteXY(4.2, wCont, Bib.NumToTexto(QRConhecimentoNUM_NOTA_CAB.Value, 0, 6));
        Imp.WriteXY(7.0, wCont, Bib.NumToTexto(QRConhecimentoTOTAL_NOTA.Value, 2, 11));
        Imp.WriteXY(10.0, wCont, Bib.NumToTexto(QRConhecimentoTOTAL_QUANTIDADE.Value, 0, 11));
        Imp.WriteXY(12.2, wCont, Bib.NumToTexto(QRConhecimentoTOTAL_QUANTIDADE.Value, 0, 11));
        if (QRConhecimentoCod_Nota_Cab.Text <> '') then
        begin
          wEspecie := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO', 'COD_PRODUTO = ' + wProduto);
          Imp.WriteXY(15.1, wCont, wEspecie);
        end;
        wCont := WCont + 2;
        Imp.WriteXY(2.7, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value, 2, 11));
        Imp.WriteXY(7.0, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value, 2, 1));
        Imp.WriteXY(9.8, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value, 2, 1));
        Imp.WriteXY(12.0, wCont, Bib.NumToTexto(QRConhecimentoVAL_PEDAGIO.Value, 2, 11));
        Imp.WriteXY(14.7, wCont, Bib.NumToTexto((QRConhecimentoVAL_FRETE.Value +
          +QRConhecimentoVAL_PEDAGIO.Value), 2, 11));
        Imp.WriteXY(17.3, wCont, Bib.NumToTexto(QRConhecimentoPERC_ALIQUOTA.Value, 0, 6));
        Imp.WriteXY(18.1, wCont, Bib.NumToTexto(QRConhecimentoVAL_ICMS.Value, 2, 11));
        wCont := 15;
        Imp.WriteXY(0.3, wCont, QRConhecimentoDESC_TARIFA.Value);
        Imp.WriteXY(3.5, wCont, QRConhecimentoDESC_LOCAL_COLETA.Value);
        Imp.WriteXY(10.0, wCont, QRConhecimentoDESC_LOCAL_ENTREGA.Value);
        Imp.WriteXY(16.5, wCont, QRConhecimentoDESC_SEGURADORA.Value);
        wCont := 17;
        Imp.WriteXY(2.2, wCont, QRConhecimentoDESC_MOTORISTA.Value);
        wUsuario := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
        Imp.WriteXY(16.5, wCont, wUsuario);
        wCont := WCont + 1;
        Imp.WriteXY(2.2, wCont, QRConhecimentoDESC_CARTEIRA.Value);
        Imp.WriteXY(7.6, wCont, QRConhecimentoDT_EXPEDICAO.Text);
        wCont := WCont + 1;
        Imp.WriteXY(2.2, wCont, QRConhecimentoDESC_PLACA.Value);
        Imp.WriteXY(7.6, wCont, QRConhecimentoDesc_Cidade_Veiculo.Value);
        wCont := WCont + 1;
        Imp.WriteXY(2.2, wCont, QRConhecimentoProprietario.Value);
        Imp.WriteXY(6.5, wCont, 'INSS:');
        Imp.WriteXY(7.6, wCont, QRConhecimentoDESC_INSS.Value);
        wCont := WCont + 1;
        Imp.WriteXY(2.2, wCont, QRConhecimentoEndereco_Proprietario.Value);
        Imp.WriteXY(7.6, wCont, QRConhecimentoCidade_Proprietario.Value + ' - ' + QRConhecimentoUF_Proprietario.Value);
        wCont := WCont + 1;
        Imp.WriteXY(2.2, wCont, QRConhecimentoNUM_CNPJ_CGC.Value);
        wCont := wCont + 1;
        Imp.WriteXY(1.0, wCont, QRConhecimentoDESC_OBS.Value);
        wCont := wCont + 1;
        Imp.WriteXY(1.0, wCont, QRConhecimentoDESC_OBS2.Value);
        if QRConhecimentoCOD_MENSAGEM.Text <> '' then
        begin
          DMMensagem.QMensagem.Close;
          DMMensagem.QMensagem.SetVariable('PK', QRConhecimentoCOD_MENSAGEM.Text);
          DMMensagem.QMensagem.Open;
          if not (DMMensagem.QMensagem.Eof) then
          begin
            wCont := wCont + 1;
            Imp.WriteXY(1.0, wCont, DMMensagem.QMensagemDESC_MENSAGEM.Value);
            wCont := wCont + 1;
            Imp.WriteXY(1.0, wCont, DMMensagem.QMensagemDESC_COMPLEMENTO.Value);
            wCont := wCont + 1;
            Imp.WriteXY(1.0, wCont, DMMensagem.QMensagemDESC_COMPLEMENTO1.Value);
            wCont := wCont + 1;
            Imp.WriteXY(1.0, wCont, DMMensagem.QMensagemDESC_COMPLEMENTO2.Value);
            wCont := wCont + 1;
            Imp.WriteXY(1.0, wCont, DMMensagem.QMensagemDESC_COMPLEMENTO3.Value);
          end;
        end;
        Inc(wCont);
        if wCont < 30 then
          Imp.WriteXY(11.1, wCont, 'Cartão Pedágio:' + QRConhecimentoDESC_CARTAO_PEDAGIO.Value);
        wCont := 30;
        Imp.WriteXY(4.0, wCont, QRConhecimentoDESC_FILIAL.Value);
        wCont := WCont + 1;
        Imp.WriteXY(4.0, wCont, (QRConhecimentoDESC_ENDERECO.Value + ' ' + 'FONE/FAX' + QRConhecimentoDESC_TELEFONE.Value));
        wCont := WCont + 1;
        Imp.WriteXY(4.0, wCont, ('CEP ' + QRConhecimentoDESC_CEP.Value + ' ' + QRConhecimentoDESC_CIDADE.Value + ' - ' + QRConhecimentoCOD_ESTADO.Value));
        Imp.WriteXY(11.1, wCont, Bib.NumToTexto(QRConhecimentoNUM_CONHECIMENTO.Value, 0, 6));
        wCont := WCont + 1;
        Imp.WriteXY(4.0, wCont, ('CGC ' + QRConhecimentoNUM_CGC.Value + '  I.E ' + QRConhecimentoDESC_INSCRICAO.Value));
        Imp.WriteXY(12.5, wCont, DateToStr(QRConhecimentoDT_EMISSAO.Value));
        wCont := 35; //-----Remetente ---copia
        if QRConhecimentoInd_Entrada_Saida.Value = 'S' then
        begin
          Imp.WriteXY(1.8, wCont, Y[0]);
          Imp.WriteXY(12.2, wCont, QRConhecimentoNOME.Value);
        end
        else
        begin
          Imp.WriteXY(1.8, wCont, QRConhecimentoNOME.Value);
          Imp.WriteXY(12.2, wCont, Y[0]);
        end;
        wCont := 37;
        Imp.WriteXY(0.3, wCont, QRConhecimentoDESC_TARIFA.Value);
        Imp.WriteXY(4.5, wCont, Bib.NumToTexto(QRConhecimentoQT_NOTA.Value, 0, 11));
        Imp.WriteXY(8.5, wCont, Bib.NumToTexto(QRConhecimentoPERC_TOLERANCIA.Value, 2, 11));
        Imp.WriteXY(16.5, wCont, Bib.NumToTexto(QRConhecimentoNUM_CONHECIMENTO.Value, 0, 6));
        wCont := 39;
        Imp.WriteXY(5.8, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value, 2, 11));
        wCont := WCont + 1;
  {       If QRConhecimentoPerc_Desconto_Frete.Value > 0 Then  // retirado a pedido da Daiana dia 05/07/2007
            wDesconto := QRConhecimentoVAL_FRETE.Value * QRConhecimentoPerc_Desconto_Frete.Value / 100
         Else
            wDesconto := 0;
         Imp.WriteXY(5.8,wCont,Bib.NumToTexto(wDesconto,2,11));
         wCont:=WCont+1;
  }Imp.WriteXY(5.8, wCont, Bib.NumToTexto(QRConhecimentoVAL_ADIANTAMENTO.Value, 2, 11));
        wCont := WCont + 1;
  //       Imp.WriteXY(5.8,wCont,Bib.NumToTexto(QRConhecimentoVAL_PEDAGIO.Value,2,11));  // retirado a pedido da Daiana
        wCont := WCont + 1;
        Imp.WriteXY(5.8, wCont, Bib.NumToTexto(QRConhecimentoVAL_IRF.Value, 2, 11));
        Imp.WriteXY(8, wCont, '(-)INSS:' + Bib.NumToTexto(QRConhecimentoVAL_INSS_FORNECEDOR.Value, 2, 9));
        wCont := WCont + 1;
        Imp.WriteXY(5.8, wCont, Bib.NumToTexto(QRConhecimentoVAL_SEST_SENAT.Value, 2, 11));
        wCont := WCont + 1;
        Imp.WriteXY(5.8, wCont, Bib.NumToTexto(QRConhecimentoVAL_FALTA_MERCADORIA_CHEGADA.Value, 2, 11));
        wCont := WCont + 1;
        Imp.WriteXY(5.8, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value -
  //                                            wDesconto -
          QRConhecimentoVAL_IRF.Value -
          QRConhecimentoVAL_SEST_SENAT.Value -
          QRConhecimentoVal_Adiantamento.Value -
          QRConhecimentoVAL_INSS_FORNECEDOR.Value -
          QRConhecimentoVAL_FALTA_MERCADORIA_CHEGADA.Value, 2, 11));
      end
      else
      //aqui começa impresão conhec. moinho para filial 9
      begin
        Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 44); //-----configurar pagina
        wCont := 2;
        Imp.WriteXY(14.5, wCont, Bib.NumToTexto(QRConhecimentoNUM_CONHECIMENTO.Value, 0, 6));
        wCont := WCont + 1;
        Imp.WriteXY(12.0, wCont, QRConhecimentoDESC_OPERACAO.Value);
        wCont := WCont + 1;
        Imp.WriteXY(12.5, wCont, DateToStr(QRConhecimentoDT_EMISSAO.Value));
        Imp.WriteXY(15, wCont, TimeToStr(Time));
        if QRConhecimentoCOD_ESTADO.Value <> QRConhecimentoUF_DESTINATARIO.Value then
          Imp.WriteXY(18.5, wCont, QRConhecimentoNat_InterEstadual_Novo.Text)
        else
          Imp.WriteXY(18.5, wCont, QRConhecimentoNat_Estadual_Novo.Text);

        wCont := WCont + 3;
        if QRConhecimentoInd_Entrada_Saida.Value = 'S' then
        begin
          Imp.WriteXY(1.5, wCont, QRConhecimentoDESC_FILIAL.Value);
          Imp.WriteXY(11.5, wCont, QRConhecimentoNOME.Value);
        end
        else
        begin
          Imp.WriteXY(1.5, wCont, QRConhecimentoNOME.Value);
          Imp.WriteXY(11.5, wCont, QRConhecimentoDESC_FILIAL.Value);
        end;
        wCont := WCont + 1;
        if QRConhecimentoInd_Entrada_Saida.Value = 'S' then
        begin
          Imp.WriteXY(1.5, wCont, QRConhecimentoDESC_ENDERECO.Value);
          Imp.WriteXY(11.5, wCont, QRConhecimentoENDERECO_DESTINATARIO.Value);
        end
        else
        begin
          Imp.WriteXY(1.5, wCont, QRConhecimentoENDERECO_DESTINATARIO.Value);
          Imp.WriteXY(11.5, wCont, QRConhecimentoDESC_ENDERECO.Value);
        end;
        wCont := WCont + 1;
        if QRConhecimentoInd_Entrada_Saida.Value = 'S' then
        begin
          Imp.WriteXY(1.5, wCont, QRConhecimentoDESC_CIDADE.Value + ' - ' + QRConhecimentoCOD_ESTADO.Value);
          Imp.WriteXY(11.5, wCont, QRConhecimentoCIDADE_DESTINATARIO.Value + ' - ' + QRConhecimentoUF_DESTINATARIO.Value);
        end
        else
        begin
          Imp.WriteXY(1.5, wCont, QRConhecimentoCIDADE_DESTINATARIO.Value + ' - ' + QRConhecimentoUF_DESTINATARIO.Value);
          Imp.WriteXY(11.5, wCont, QRConhecimentoDESC_CIDADE.Value + ' - ' + QRConhecimentoCOD_ESTADO.Value);
        end;
        wCont := WCont + 1;
        if QRConhecimentoInd_Entrada_Saida.Value = 'S' then
        begin
          Imp.WriteXY(1.5, wCont, QRConhecimentoNUM_CGC.Value);
          Imp.WriteXY(6.5, wCont, QRConhecimentoDESC_INSCRICAO.Value);
          Imp.WriteXY(11.5, wCont, QRConhecimentoCGC_DESTINATARIO.Value);
          Imp.WriteXY(16.7, wCont, QRConhecimentoNUM_INSCRICAO.Value);
        end
        else
        begin
          Imp.WriteXY(1.5, wCont, QRConhecimentoCGC_DESTINATARIO.Value);
          Imp.WriteXY(6.5, wCont, QRConhecimentoNUM_INSCRICAO.Value);
          Imp.WriteXY(11.5, wCont, QRConhecimentoNUM_CGC.Value);
          Imp.WriteXY(16.7, wCont, QRConhecimentoDESC_INSCRICAO.Value);
        end;

        wCont := 20;
        Imp.WriteXY(3, wCont, 'XX'); //frete á pagar

        wCont := 25;
        if (QRConhecimentoCod_Nota_Cab.Text <> '') then
        begin
          wProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_NOTA_ITEM', 'COD_NOTA_CAB = ' + IntToStr(QRConhecimentoCod_Nota_Cab.Value));
          wMens := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + wProduto);
        end;
        if length(wMens) > 23 then
        begin
          wDesc_produto := copy(wMens, 1, 23);
          Imp.WriteXY(0.0, wCont, wDesc_produto);
        end
        else
          Imp.WriteXY(0.0, wCont, wMens);
        Imp.WriteXY(3.5, wCont, Bib.NumToTexto(QRConhecimentoTOTAL_QUANTIDADE.Value, 2, 11));
        if (QRConhecimentoCod_Nota_Cab.Text <> '') then
        begin
          wEspecie := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO', 'COD_PRODUTO = ' + wProduto);
          Imp.WriteXY(7, wCont, wEspecie);
        end;
        if (QRConhecimentoCod_Nota_Cab.Text <> '') then
        begin
          wEspecie := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO', 'COD_PRODUTO = ' + wProduto);
          wproduto := FloatToStr(QRConhecimentoTOTAL_QUANTIDADE.Value);
          wTotal_Kg := FloatToStr(QRConhecimentoTOTAL_QUANTIDADE.Value * StrToFloat(wEspecie));
          Imp.WriteXY(9, wCont, wTotal_Kg);
        end;
        Imp.WriteXY(14.5, wCont, Bib.NumToTexto(QRConhecimentoNUM_NOTA_CAB.Value, 0, 6));
        Imp.WriteXY(17, wCont, Bib.NumToTexto(QRConhecimentoTOTAL_NOTA.Value, 2, 11));
        if length(wMens) > 23 then
        begin
          inc(wcont);
          wDesc_produto := copy(wMens, 24, 23);
          Imp.WriteXY(0.0, wCont, wDesc_produto);
        end;

        wCont := 30;
        Imp.WriteXY(4, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value, 2, 11));
        Imp.WriteXY(6, wCont, Bib.NumToTexto(QRConhecimentoVAL_SEGURO.Value, 2, 11));
        Imp.WriteXY(11.3, wCont, Bib.NumToTexto(QRConhecimentoVAL_PEDAGIO.Value, 2, 11));
        Imp.WriteXY(17, wCont, Bib.NumToTexto((QRConhecimentoVAL_FRETE.Value + QRConhecimentoVAL_PEDAGIO.Value + QRConhecimentoVAL_SEGURO.Value), 2, 11));

        wCont := 33;
        Imp.WriteXY(1.5, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value + QRConhecimentoVAL_SEGURO.Value, 2, 11));
        Imp.WriteXY(4, wCont, Bib.NumToTexto(QRConhecimentoPERC_ALIQUOTA.Value, 0, 6));
        Imp.WriteXY(6, wCont, Bib.NumToTexto(QRConhecimentoVAL_ICMS.Value, 2, 11));
        Imp.WriteXY(10, wCont, QRConhecimentoDESC_LOCAL_COLETA.Value);
        Imp.WriteXY(14, wCont, QRConhecimentoDESC_LOCAL_ENTREGA.Value);
        wUsuario := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
        Imp.WriteXY(17.5, wCont, wUsuario);

        wCont := 35;
        Imp.WriteXY(1.8, wCont, QRConhecimentoDESC_VEICULO.Value);
        Imp.WriteXY(5, wCont, QRConhecimentoDESC_PLACA.Value);
        Imp.WriteXY(7.2, wCont, QRConhecimentoDesc_Cidade_Veiculo.Value);

        wCont := WCont + 2;
        Imp.WriteXY(0.0, wCont, QRConhecimentoDESC_OBS.Value);
        wCont := wCont + 1;
        Imp.WriteXY(0.0, wCont, QRConhecimentoDESC_OBS2.Value);
      end;
    end;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
    begin
      if Trim(Y[6]) = 'LPT2' then
        Imp.AbreImpressora_Lpt2
      else
        Imp.AbreImpressora; //----------abre impressora
      Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 48); //-----configurar pagina
      wCont := 0;
      if QRConhecimentoCOD_FILIAL.Value <> 1 then // impressão formulário de conhecimento novo
      begin
        if QRConhecimentoInd_Entrada_Saida.Value = 'S' then
        begin
          wRemNome := QRConhecimentoDESC_FILIAL.Value;
          wRemEndereco := QRConhecimentoDESC_ENDERECO.Value;
          wRemCnpj := QRConhecimentoNUM_CGC.Value;
          wRemCidade := QRConhecimentoDESC_CIDADE.Value;
          wRemUf := QRConhecimentoCOD_ESTADO.Value;

          wDesNome := QRConhecimentoNOME.Value;
          wDesEndereco := QRConhecimentoENDERECO_DESTINATARIO.Value;
          wDesCnpj := QRConhecimentoCGC_DESTINATARIO.Value;
          wDesCidade := QRConhecimentoCIDADE_DESTINATARIO.Value;
          wDesUf := QRConhecimentoUF_DESTINATARIO.Value;
        end
        else
        begin
          wRemNome := QRConhecimentoNOME.Value;
          wRemEndereco := QRConhecimentoENDERECO_DESTINATARIO.Value;
          wRemCnpj := QRConhecimentoCGC_DESTINATARIO.Value;
          wRemCidade := QRConhecimentoCIDADE_DESTINATARIO.Value;
          wRemUf := QRConhecimentoUF_DESTINATARIO.Value;

          wDesNome := QRConhecimentoDESC_FILIAL.Value;
          wDesEndereco := QRConhecimentoDESC_ENDERECO.Value;
          wDesCnpj := QRConhecimentoNUM_CGC.Value;
          wDesCidade := QRConhecimentoDESC_CIDADE.Value;
          wDesUf := QRConhecimentoCOD_ESTADO.Value;
        end;
        with DMFilial do
        begin
          QFilial.Close;
          QFilial.SetVariable('PK', QRConhecimentoCOD_FILIAL.Value);
          QFilial.Open;

          Imp.WriteXY(4.5, wCont, QFilialDESC_FILIAL.Value);
          Inc(wCont);
          Imp.WriteXY(4.5, wCont, 'Fone/Fax: ' + QFilialDESC_TELEFONE.Value);
          Inc(wCont);
          Imp.WriteXY(4.5, wCont, QFilialDESC_ENDERECO.Value + ', ' +
            QFilialDESC_CIDADE.Value + ' - ' + QFilialCOD_ESTADO.Value);
          Inc(wCont);
          Imp.WriteXY(4.5, wCont, 'CNPJ: ' + QFilialNUM_CGC.Value);
          Inc(wCont);
          Imp.WriteXY(4.5, wCont, 'INSCR. EST.: ' + QFilialDESC_INSCRICAO.Value);
          Imp.WriteXY(13, wCont, FormatDateTime('dd/MM/yyyy', QRConhecimentoDT_EMISSAO.Value));
          Imp.WriteXY(18.5, wCont, FormatFloat('000000', QRConhecimentoNUM_CONHECIMENTO.Value));
        end;
        Imp.ConfiguraImpressora('CONDENSADO_ON', 'SEXTOS', 33);
        Inc(wCont);
        Imp.WriteXY(14, wCont, wRemNome);
        Inc(wCont);
        Imp.WriteXY(2, wCont, QRConhecimentoPROPRIETARIO.Value);
        Imp.WriteXY(9, wCont, QRConhecimentoNUM_CNPJ_CGC.Value);
        Imp.WriteXY(14, wCont, wRemCnpj);
        Inc(wCont);
        Imp.WriteXY(2, wCont, QRConhecimentoENDERECO_PROPRIETARIO.Value);
        Imp.WriteXY(9, wCont, QRConhecimentoDESC_INSS.Value);
        Imp.WriteXY(14, wCont, wRemEndereco);
        Inc(wCont);
        Imp.WriteXY(2, wCont, QRConhecimentoCIDADE_PROPRIETARIO.Value + '/' +
          QRConhecimentoUF_PROPRIETARIO.Value);
        Imp.WriteXY(14, wCont, wRemCidade);
        Inc(wCont);
        Imp.WriteXY(2, wCont, QRConhecimentodesc_motorista.Value);
        Imp.WriteXY(9, wCont, QRConhecimentoCIDADE_MOTORISTA.Value);
        Imp.WriteXY(14, wCont, wRemUf);
        Inc(wCont);
        Imp.WriteXY(2, wCont, QRConhecimentodesc_carteira.Value);
        Imp.WriteXY(8.3, wCont, FormatDateTime('dd/MM/yyyy', QRConhecimentoDT_EXPEDICAO.Value));
        Imp.WriteXY(14, wCont, wDesNome);
        Inc(wCont);
        Imp.WriteXY(2, wCont, QRConhecimentoDESC_PLACA.Value);
        Imp.WriteXY(6.7, wCont, QRConhecimentodesc_cidade_veiculo.Value);
        Imp.WriteXY(14, wCont, wDesCnpj);
        Inc(wCont);
        Imp.WriteXY(14, wCont, wDesEndereco);
        Inc(wCont);
        Imp.WriteXY(14, wCont, wDesCidade);

        Inc(wCont);
        wMens := '';
        if (QRConhecimentoCOD_NOTA_CAB.Text <> '') then
        begin
          wProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_NOTA_ITEM',
            'COD_NOTA_CAB = ' + QRConhecimentoCOD_NOTA_CAB.Text);
          wMens := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
            'COD_PRODUTO = ' + wProduto);
        end;
        Imp.WriteXY(0.7, wCont, Copy(wMens, 1, 20));
        Imp.WriteXY(4.5, wCont, QRConhecimentoNUM_NOTA.Text);
        Imp.WriteXY(9, wCont, Bib.NumToTexto(QRConhecimentoTOTAL_NOTA.Value, 2, 11));
        Imp.WriteXY(14, wCont, wDesUf);

        Inc(wCont);
        Imp.WriteXY(0.7, wCont, Copy(wMens, 21, 20));

        Inc(wCont);
        if (QRConhecimentoCOD_NOTA_CAB.Text <> '') then
        begin
          wEspecie := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO',
            'COD_PRODUTO = ' + wProduto);
          wTotal_Kg := FloatToStr(QRConhecimentoTOTAL_QUANTIDADE.Value);
          wproduto := FloatToStr(QRConhecimentoTOTAL_QUANTIDADE.Value);
          if wEspecie <> 'KG' then
          begin
            wEspecie := '0' + DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO', 'COD_PRODUTO = ' + wProduto);
            wTotal_Kg := FloatToStr(QRConhecimentoTOTAL_QUANTIDADE.Value * StrToFloat(wEspecie));
          end;
          Imp.WriteXY(4, wCont, wTotal_Kg);
        end;

        Inc(wCont, 2);
        Imp.WriteXY(4, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value, 2, 11));
        Inc(wCont);
        Imp.WriteXY(4, wCont, Bib.NumToTexto(QRConhecimentoVAL_IRF.Value, 2, 11));
        Inc(wCont);
        Imp.WriteXY(4, wCont, Bib.NumToTexto(QRConhecimentoVAL_ADIANTAMENTO.Value, 2, 11));
        Inc(wCont);
        Imp.WriteXY(4, wCont, Bib.NumToTexto(QRConhecimentoVAL_FALTA_MERCADORIA_CHEGADA.Value, 2, 11));
        Inc(wCont);
        Imp.WriteXY(4, wCont, Bib.NumToTexto(QRConhecimentoVAL_SEST_SENAT.Value, 2, 11));
        Inc(wCont);
        Imp.WriteXY(4, wCont, Bib.NumToTexto(QRConhecimentoVAL_INSS_FORNECEDOR.Value, 2, 11));
        Inc(wCont);
        Imp.WriteXY(4, wCont, Bib.NumToTexto(QRConhecimentoVAL_SEGURO.Value, 2, 11));
        Inc(wCont);
        Imp.WriteXY(4, wCont, Bib.NumToTexto(QRConhecimentoVAL_PEDAGIO.Value, 2, 11));

        Inc(wCont, 2);
//        Imp.WriteXY(4,wCont,Bib.NumToTexto((QRConhecimentoVAL_FRETE.Value +
//            QRConhecimentoVAL_PEDAGIO.Value +
//            QRConhecimentoVAL_SEGURO.Value),2,11));
        Inc(wCont);
        Imp.WriteXY(4, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value -
          QRConhecimentoVAL_IRF.Value -
          QRConhecimentoVAL_ADIANTAMENTO.Value -
          QRConhecimentoVAL_FALTA_MERCADORIA_CHEGADA.Value -
          QRConhecimentoVAL_SEST_SENAT.Value -
          QRConhecimentoVAL_INSS_FORNECEDOR.Value -
          QRConhecimentoVAL_SEGURO.Value +
          QRConhecimentoVAL_PEDAGIO.Value, 2, 11));
        Inc(wCont);
        Imp.WriteXY(1, wCont, QRConhecimentoDESC_OBS.Value);
        Inc(wCont);
        Imp.WriteXY(1, wCont, QRConhecimentoDESC_OBS2.Value);
      end
      else
      begin // impressão formulário de conhecimento antigo (filial 2)
        Imp.WriteXY(15, wCont, Bib.NumToTexto(QRConhecimentoNUM_CONHECIMENTO.Value, 0, 6));
        wCont := WCont + 2;
        Imp.WriteXY(12, wCont, QRConhecimentoDESC_OPERACAO.Value);
        if QRConhecimentoCOD_ESTADO.Value <> QRConhecimentoUF_DESTINATARIO.Value then
          Imp.WriteXY(19, wCont, QRConhecimentoNat_InterEstadual_Novo.Text)
        else
          Imp.WriteXY(19, wCont, QRConhecimentoNat_Estadual_Novo.Text);
        wCont := WCont + 2;
        Imp.WriteXY(12.5, wCont, DateToStr(QRConhecimentoDT_EMISSAO.Value));
        wCont := WCont + 2;
        if QRConhecimentoInd_Entrada_Saida.Value = 'S' then
        begin
          Imp.WriteXY(1.6, wCont, QRConhecimentoDESC_FILIAL.Value);
          Imp.WriteXY(11.6, wCont, QRConhecimentoNOME.Value);
        end
        else
        begin
          Imp.WriteXY(1.6, wCont, QRConhecimentoNOME.Value);
          Imp.WriteXY(11.6, wCont, QRConhecimentoDESC_FILIAL.Value);
        end;
        wCont := WCont + 2;
        if QRConhecimentoInd_Entrada_Saida.Value = 'S' then
        begin
          Imp.WriteXY(1.6, wCont, QRConhecimentoDESC_ENDERECO.Value);
          Imp.WriteXY(7, wCont, QRConhecimentoDESC_CEP.Value);
          Imp.WriteXY(9.5, wCont, QRConhecimentoCOD_ESTADO.Value);
          Imp.WriteXY(11.6, wCont, QRConhecimentoENDERECO_DESTINATARIO.Value);
          Imp.WriteXY(17, wCont, QRConhecimentoCEP_DESTINATARIO.Value);
          Imp.WriteXY(19.6, wCont, QRConhecimentoUF_DESTINATARIO.Value);
        end
        else
        begin
          Imp.WriteXY(1.6, wCont, QRConhecimentoENDERECO_DESTINATARIO.Value);
          Imp.WriteXY(7, wCont, QRConhecimentoCEP_DESTINATARIO.Value);
          Imp.WriteXY(9.5, wCont, QRConhecimentoUF_DESTINATARIO.Value);
          Imp.WriteXY(11.6, wCont, QRConhecimentoDESC_ENDERECO.Value);
          Imp.WriteXY(17, wCont, QRConhecimentoDESC_CEP.Value);
          Imp.WriteXY(19.6, wCont, QRConhecimentoCOD_ESTADO.Value);
        end;
        wCont := WCont + 1;
        if QRConhecimentoInd_Entrada_Saida.Value = 'S' then
        begin
          Imp.WriteXY(1.6, wCont, QRConhecimentoDESC_CIDADE.Value + ' - ' + QRConhecimentoCOD_ESTADO.Value);
          Imp.WriteXY(11.6, wCont, QRConhecimentoCIDADE_DESTINATARIO.Value + ' - ' + QRConhecimentoUF_DESTINATARIO.Value);
        end
        else
        begin
          Imp.WriteXY(1.6, wCont, QRConhecimentoCIDADE_DESTINATARIO.Value + ' - ' + QRConhecimentoUF_DESTINATARIO.Value);
          Imp.WriteXY(11.6, wCont, QRConhecimentoDESC_CIDADE.Value + ' - ' + QRConhecimentoCOD_ESTADO.Value);
        end;
        wCont := WCont + 2;
        if QRConhecimentoInd_Entrada_Saida.Value = 'S' then
        begin
          Imp.WriteXY(1.2, wCont, QRConhecimentoNUM_CGC.Value);
          Imp.WriteXY(7, wCont, QRConhecimentoDESC_INSCRICAO.Value);
          Imp.WriteXY(11.5, wCont, QRConhecimentoCGC_DESTINATARIO.Value);
          Imp.WriteXY(17, wCont, QRConhecimentoNUM_INSCRICAO.Value);
        end
        else
        begin
          Imp.WriteXY(1.2, wCont, QRConhecimentoCGC_DESTINATARIO.Value);
          Imp.WriteXY(7, wCont, QRConhecimentoNUM_INSCRICAO.Value);
          Imp.WriteXY(11.5, wCont, QRConhecimentoNUM_CGC.Value);
          Imp.WriteXY(17, wCont, QRConhecimentoDESC_INSCRICAO.Value);
        end;
        Inc(wCont, 9);
        Imp.WriteXY(5.3, wCont, 'XX'); //frete á pagar  3.4
        wCont := 25;
        if (QRConhecimentoCod_Nota_Cab.Text <> '') then
        begin
          wProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_NOTA_ITEM', 'COD_NOTA_CAB = ' + IntToStr(QRConhecimentoCod_Nota_Cab.Value));
          wMens := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + wProduto);
        end;
        if length(wMens) > 23 then
        begin
          wDesc_produto := copy(wMens, 1, 23);
          Imp.WriteXY(1, wCont, wDesc_produto);
        end
        else
          Imp.WriteXY(1, wCont, wMens);
        Imp.WriteXY(4.5, wCont, Bib.NumToTexto(QRConhecimentoTOTAL_QUANTIDADE.Value, 0, 8));
        if (QRConhecimentoCod_Nota_Cab.Text <> '') then
        begin
          wEspecie := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO', 'COD_PRODUTO = ' + wProduto);
          Imp.WriteXY(7, wCont, wEspecie);
          wTotal_Kg := FloatToStr(QRConhecimentoTOTAL_QUANTIDADE.Value);
          wproduto := FloatToStr(QRConhecimentoTOTAL_QUANTIDADE.Value);
          if wEspecie <> 'KG' then
          begin
            wEspecie := '0' + DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO', 'COD_PRODUTO = ' + wProduto);
            wTotal_Kg := FloatToStr(QRConhecimentoTOTAL_QUANTIDADE.Value * StrToFloat(wEspecie));
          end;
          Imp.WriteXY(10, wCont, wTotal_Kg);
        end;
        Imp.WriteXY(14.5, wCont, Bib.NumToTexto(QRConhecimentoNUM_NOTA_CAB.Value, 0, 6));
        Imp.WriteXY(17.5, wCont, Bib.NumToTexto(QRConhecimentoTOTAL_NOTA.Value, 2, 11));
        if length(wMens) > 23 then
        begin
          inc(wcont);
          wDesc_produto := copy(wMens, 24, 23);
          Imp.WriteXY(1, wCont, wDesc_produto);
        end;
        wCont := 30;
        Imp.WriteXY(4.5, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value, 2, 11));
        Imp.WriteXY(7.5, wCont, Bib.NumToTexto(QRConhecimentoVAL_SEGURO.Value, 2, 8));
        Imp.WriteXY(11.8, wCont, Bib.NumToTexto(QRConhecimentoVAL_PEDAGIO.Value, 2, 11));
        Imp.WriteXY(17, wCont, Bib.NumToTexto((QRConhecimentoVAL_FRETE.Value + QRConhecimentoVAL_PEDAGIO.Value + QRConhecimentoVAL_SEGURO.Value), 2, 11));
        wCont := 33;
        Imp.WriteXY(1.5, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value + QRConhecimentoVAL_SEGURO.Value, 2, 11));
        Imp.WriteXY(5, wCont, Bib.NumToTexto(QRConhecimentoPERC_ALIQUOTA.Value, 0, 2));
        Imp.WriteXY(7, wCont, Bib.NumToTexto(QRConhecimentoVAL_ICMS.Value, 2, 11));
        Imp.WriteXY(10, wCont, QRConhecimentoDESC_LOCAL_COLETA.Value);
        Imp.WriteXY(13.8, wCont, QRConhecimentoDESC_LOCAL_ENTREGA.Value);
        wUsuario := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
        Imp.WriteXY(18, wCont, wUsuario);
        wCont := 36;
        Imp.WriteXY(1.8, wCont, QRConhecimentoDESC_VEICULO.Value);
        Imp.WriteXY(4.6, wCont, QRConhecimentoDESC_PLACA.Value);
        Imp.WriteXY(6.7, wCont, QRConhecimentoDesc_Cidade_Veiculo.Value);
        wCont := WCont + 2;
        Imp.WriteXY(1.8, wCont, QRConhecimentoDESC_OBS.Value);
        wCont := wCont + 1;
        Imp.WriteXY(1.8, wCont, QRConhecimentoDESC_OBS2.Value);
        Inc(wCont);
        Imp.WriteXY(1.8, wCont, 'Imposto Renda:' + Bib.NumToTexto(QRConhecimentoVAL_IRF.Value, 2, 11) + '   Adiantamento.:' + Bib.NumToTexto(QRConhecimentoVAL_ADIANTAMENTO.Value, 2, 11));
      end;
    end;
    Imp.SaltaPagina;
    Imp.FechaImpressora; // Finaliza os serviços de Impressao
  end;
end;

procedure TFConhecimentoCad.DBEdit6Exit(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    if QConhecimentoCadCod_Nota_Cab.Text <> '' then
    begin
      QConhecimentoCadCod_Filial_Destino.Value := StrToInt(DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_NOTA_CAB', 'COD_NOTA_CAB = ' + IntToStr(QConhecimentoCadCod_Nota_Cab.Value), True));
      QConhecimentoCadCod_Cadastro.Value := StrToInt(DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_NOTA_CAB', 'COD_NOTA_CAB = ' + IntToStr(QConhecimentoCadCod_Nota_Cab.Value), True));
      QConhecimentoCadVal_Nota.Value := StrToFloat('0' + DMOracle.BuscaNome('SELECT sum(tb_nota_item.val_total) FROM TB_NOTA_CAB, TB_NOTA_ITEM', 'TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB AND TB_NOTA_CAB.COD_NOTA_CAB = ' + IntToStr(QConhecimentoCadCod_Nota_Cab.Value)));
      QConhecimentoCadQT_Nota.Value := StrToFloat('0' + DMOracle.BuscaNome('SELECT sum(TB_NOTA_ITEM.QT_QUANTIDADE) FROM TB_NOTA_CAB, TB_NOTA_ITEM', 'TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB AND TB_NOTA_CAB.COD_NOTA_CAB = ' + IntToStr(QConhecimentoCadCod_Nota_Cab.Value)));
    end;
  end;
end;

procedure TFConhecimentoCad.SBConfirmarClick(Sender: TObject);
var wSerie, wRamo_Oper, wRamo_Classe, wProduto, wClasse, wProprietario: string;
begin
//  DmUsuario.Checar_Filial_Usuario(Trim(DMConhecimento.QConhecimentoCadCOD_FILIAL.Text),'CONHECIMENTO');
//  If DMconhecimento.QConhecimentoCadCod_Filial.Value <> DMUsuario.CodFilialUsuario then
//     Raise exception.Create ('Usuario Não Liberado Para Operar Nesta Filial');
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMconhecimento.QConhecimentoCadDt_Emissao.Value then
    raise Exception.Create('Não é Permitido Lançar Este Conhecimento - Fechamento Contabil');

  wProprietario := DMOracle.BuscaNome('SELECT COD_PROPRIETARIO FROM TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + Chr(39) + DMconhecimento.QConhecimentoCadDesc_Placa.Value + Chr(39));
  if (DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PROPRIETARIO', 'COD_PROPRIETARIO = ' + wProprietario)) = 'D' then
    raise Exception.Create('Proprietário com cadastro desativado');

  if (DMOracle.BuscaNome('SELECT DESC_INSCRICAO_IDENTIDADE FROM TB_PROPRIETARIO', 'COD_PROPRIETARIO = ' + wProprietario)) = '' then
    raise Exception.Create('Preencher Inscricao Estadual/Identidade no cadastro Proprietário');

  wSerie := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_OPERACAO', 'COD_OPERACAO = ' + IntToStr(DMconhecimento.QConhecimentoCadCOD_OPERACAO.Value));
  if (wSerie <> '') and (wSerie <> DMconhecimento.QConhecimentoCadCod_Serie.Value) then
    raise Exception.Create('Não é Permitido Lançar Com Esta Operação' + Chr(13) + 'Checar Série para conhecimento de frete');
  wRamo_Oper := DMOracle.BuscaNome('SELECT COD_RAMO FROM TB_OPERACAO', 'COD_OPERACAO = ' + IntToStr(DMconhecimento.QConhecimentoCadCOD_OPERACAO.Value));
  if DMconhecimento.QConhecimentoCadCOD_NOTA_CAB.Text <> '' then
  begin
    wProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_NOTA_ITEM', 'COD_NOTA_CAB = ' + IntToStr(DMconhecimento.QConhecimentoCadCOD_NOTA_CAB.Value));
    wClasse := DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO', 'COD_PRODUTO = ' + wProduto);
    wRamo_Classe := DMOracle.BuscaNome('SELECT COD_RAMO FROM TB_CLASSE', 'COD_CLASSE = ' + wClasse);
    if wRamo_Classe <> wRamo_Oper then
      raise Exception.Create('Não é Permitido Lançar está Operação para Esta Nota Fiscal' + Chr(13) + 'Checar ramo da classe do produto com ramo do cadastro de operação');
  end;
  inherited;
  DMOracle.DBCemapa.Commit;
  bib.setModelo(DMConhecimento.QConhecimentoCad, lblModelo);
end;

procedure TFConhecimentoCad.SBExcluirClick(Sender: TObject);
begin
  if DMConhecimento.QConhecimentoCadInd_Situacao.Value <> '1' then
    raise Exception.Create('Somente Excluir Conhecimentos Digitados?')
  else
    inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFConhecimentoCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if FSerieCons = nil then
    FSerieCons := TFSerieCons.Create(Application);
  FSerieCons.METexto.Text := DMConhecimento.QConhecimentoCadCOD_FILIAL.Text;
  FSerieCons.METexto.Enabled := false;
  FSerieCons.BtConsFilial.Enabled := false;
  FSerieCons.BtProcurarClick(Sender);
  if FSerieCons.ShowModal = mrOk then
  begin
    with DMConhecimento, DMSerie do
    begin
      QConhecimentoCad.AutoCalcFields := false;
      QConhecimentoCadCod_Serie.Value := QSerieConsCod_Serie.Value;
      QConhecimentoCadCOD_SERIE_MODELO.Value := QSerieConsCOD_SERIE_MODELO.Value;
      QConhecimentoCad.AutoCalcFields := true;
      DBEdit56Exit(Self);
    end;
  end;
end;

procedure TFConhecimentoCad.SbContratoClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal = mrOk then
    DMConhecimento.QConhecimentoCadCod_Contrato_Vend.Value := DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
end;

procedure TFConhecimentoCad.SbMensagemClick(Sender: TObject);
begin
  inherited;
  if FMensagemCons = nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  if FMensagemCons.ShowModal = mrOk then
    DMConhecimento.QConhecimentoCadCod_Mensagem.Value := DMMensagem.QMensagemConsCod_Mensagem.Value;
end;

procedure TFConhecimentoCad.Confirma1Click(Sender: TObject);
var wFisica_Juridica, wVal_Inss, wDesc_Inss, wNumDoc, wContaCred, wContaDeb: string;
  wCodDoc, wCodHistorico, wVlrLancto, wCodCompl, wDesconto: Real;
  wFilial, wProprietario: Integer;
  wDtLancto, wData: TDateTime;
  wSaldo, wValor_Base, wValor_Base_1, wIRF, wSaldo_IRF, wVlInss_Pg, wVlInss: real;
  wMes, wAno, wDia: Word;
begin
  inherited;
  DMOracle.DBCemapa.StartTransaction;
  try
    with DMConhecimento do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(QConhecimentoCadCOD_FILIAL.Text), 'CONHECIMENTO');
      QConhecimentoCad.Edit;
      if QConhecimentoCadNum_Conhecimento.Value = 0 then
        QConhecimentoCadNum_Conhecimento.Value := DMSerie.NumeroSerie(QConhecimentoCadCod_Filial.Value, QConhecimentoCadCod_Serie.Value,
          QConhecimentoCadCOD_SERIE_MODELO.Value);
      if FConhecimento_CP = nil then
        FConhecimento_CP := TFConhecimento_CP.Create(Application);
      FConhecimento_CP.MEDtVencimento.Visible := False;
      FConhecimento_CP.BitBtn1.Visible := False;
      if QConhecimentoCadPerc_Desconto_Frete.Value > 0 then
        wDesconto := QConhecimentoCadVAL_FRETE.Value * QConhecimentoCadPerc_Desconto_Frete.Value / 100
      else
        wDesconto := 0;
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
      begin
        FConhecimento_CP.MeCodDepartamento.text := '6';
        case DMConhecimento.QConhecimentoCadCod_Operacao.Value of
          402: FConhecimento_CP.MECodFinalidade.Text := '144';
          407: FConhecimento_CP.MECodFinalidade.Text := '145';
          408: FConhecimento_CP.MECodFinalidade.Text := '134';
          409: FConhecimento_CP.MECodFinalidade.Text := '128';
          410, 414: FConhecimento_CP.MECodFinalidade.Text := '132';
          411, 427: FConhecimento_CP.MECodFinalidade.Text := '133';
          412: FConhecimento_CP.MECodFinalidade.Text := '131';
          413, 415: FConhecimento_CP.MECodFinalidade.Text := '130';
          416: FConhecimento_CP.MECodFinalidade.Text := '135';
          419, 422..426: FConhecimento_CP.MECodFinalidade.Text := '17';
          421: FConhecimento_CP.MECodFinalidade.Text := '143';
          428: FConhecimento_CP.MECodFinalidade.Text := '299';
          429: FConhecimento_CP.MECodFinalidade.Text := '303';
          1441: FConhecimento_CP.MECodFinalidade.Text := '123';
        end;
        if (QConhecimentoCadCod_Operacao.Value = 421) or // isso foi a daiana que passou
          (QConhecimentoCadCod_Operacao.Value = 402) or
          (QConhecimentoCadCod_Operacao.Value = 407) then
        begin
          FConhecimento_CP.MECodbanco.Enabled := False;
          FConhecimento_CP.SbCodBanco.Enabled := False;
          FConhecimento_CP.FMHistorico.Enabled := False;
          FConhecimento_CP.FMContaCorrente.Enabled := False;
        end
        else
        begin
          FConhecimento_CP.MECodbanco.Enabled := True;
          FConhecimento_CP.SbCodBanco.Enabled := True;
          FConhecimento_CP.FMHistorico.Enabled := True;
          FConhecimento_CP.FMContaCorrente.Enabled := True;
          FConhecimento_CP.FMHistorico.MeHistorico.Text := '73328';
          FConhecimento_CP.FMContaCorrente.MeContaCorrente.Text := '50';
          FConhecimento_CP.MECodbanco.Text := '486';
        end;
      end
      else
      begin
        FConhecimento_CP.MECodbanco.Visible := False;
        FConhecimento_CP.MeBanco.Visible := False;
        FConhecimento_CP.SbCodBanco.Visible := False;
        FConhecimento_CP.FMHistorico.Visible := False;
        FConhecimento_CP.FMContaCorrente.Visible := False;
        FConhecimento_CP.LblPedagio.Visible := False;
        FConhecimento_CP.MeCodFinalidadePedagio.Visible := False;
        FConhecimento_CP.SbPedagio.Visible := False;
        FConhecimento_CP.LblBanco.Visible := False;
        FConhecimento_CP.MeFinalidadePedagio.Visible := False;
      end;

      if FConhecimento_CP.ShowModal = MrOk then
      begin
        wIrf := 0;
        with DMConhecimento do
        begin
          DMOperacao.QOperacao.Close;
          DMOperacao.QOperacao.SetVariable('PK', QConhecimentoCadCod_Operacao.Text);
          DMOperacao.QOperacao.Open;
          wVlInss := 0;
          wVlInss_Pg := 0;
          QConhecimentoCadVal_IRF.Value := 0;
          if QConhecimentoCadCOD_OPERACAO.Value <> 431 then
          begin
            wProprietario := StrToInt(DMOracle.BuscaNome('SELECT COD_PROPRIETARIO FROM TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + Chr(39) + QConhecimentoCadDesc_Placa.Value + Chr(39)));
            wFisica_Juridica := DMOracle.BuscaNome('SELECT IND_FISICA_JURIDICA FROM TB_PROPRIETARIO', 'COD_PROPRIETARIO = ' + IntToStr(wProprietario));
            DecodeDate(QConhecimentoCadDt_Emissao.Value, wAno, wMes, wDia);
            wData := StrToDate('01/' + (IntToStr(wMes)) + '/' + (IntToStr(wAno)));
            if wFisica_Juridica = 'F' then
            begin
              wDesc_Inss := DMOracle.BuscaNome('SELECT DESC_INSS FROM TB_PROPRIETARIO', 'COD_PROPRIETARIO = ' + IntToStr(wProprietario));
              if wDesc_Inss = '' then
                raise Exception.Create('Cadastro de Proprietário Sem Inscrição INSS');
              wVal_Inss := DMOracle.BuscaNome('SELECT SUM(VAL_INSS_FORNECEDOR) FROM TB_CONHECIMENTO,tb_veiculo_conhecimento,tb_proprietario',
                'tb_conhecimento.desc_placa = tb_veiculo_conhecimento.desc_placa and tb_veiculo_conhecimento.cod_proprietario = tb_proprietario.cod_proprietario ' +
                ' AND TB_CONHECIMENTO.IND_SITUACAO = ' + Chr(39) + '2' + Chr(39) +
                ' AND TB_PROPRIETARIO.COD_PROPRIETARIO = ' + IntToStr(wProprietario) +
//                ' AND TB_CONHECIMENTO.COD_FILIAL = 13' + // COLOCADO A PEDIDO DO JOAO
                ' and DT_EMISSAO >= ' + Chr(39) + DateToStr(wData) + Chr(39) +
                ' AND DT_EMISSAO <= ' + Chr(39) + DateToStr(DMOracle.UltimoDiaMes(wData)) + chr(39));
              if wVal_Inss <> '' then
                wVlInss_Pg := StrToFloat(wVal_Inss);
              wVlInss := wVlInss + (((QConhecimentoCadVal_Frete.Value * DMParamSistema.QParamSistemaPERC_Base_INSS_FRETE.Value) / 100) * ((DMParamSistema.QParamSistemaPerc_ALIQ_INSS_Frete_Fre.Value) / 100));
              if (wVlInss + wVlInss_Pg + QConhecimentoCadVal_Inss_Pg_Outras_Empresas.value) > DMParamSistema.QParamSistemaVal_Inss_Maximo_Mes.Value then
                wVlInss := DMParamSistema.QParamSistemaVal_Inss_Maximo_Mes.Value - (wVlInss_Pg + QConhecimentoCadVal_Inss_Pg_Outras_Empresas.value);
              if wVlInss < 0 then
                wVlInss := 0;
            end;
            QConhecimentoCadVal_Inss_Fornecedor.Value := wVlInss;
            if wFisica_Juridica = 'F' then
            begin
              QCalculaSaldo.Close;
              QCalculaSaldo.SetVariable('Cod_Proprietario', wProprietario);
              QCalculaSaldo.SetVariable('Cod_Filial', QConhecimentoCadCod_Filial.Value);
              QCalculaSaldo.SetVariable('DT_Emissao_I', wData);
              QCalculaSaldo.SetVariable('DT_Emissao_F', DMOracle.UltimoDiaMes(QConhecimentoCadDt_Emissao.Value));
              QCalculaSaldo.Open;
              wSaldo := ((QCalculaSaldoSaldo.value + QConhecimentoCadVal_Frete.Value) * 0.4) - wVlInss - wVlInss_Pg;
               //---------CALCULA SALDO IRF PAGO
              QCalculaIRFPago.Close;
              QCalculaIRFPago.SetVariable('Cod_Proprietario', wProprietario);
              QCalculaIRFPago.SetVariable('Cod_Filial', QConhecimentoCadCod_Filial.Value);
              DecodeDate(QConhecimentoCadDt_Emissao.Value, wAno, wMes, wDia);
              wData := StrToDate('01/' + (IntToStr(wMes)) + '/' + (IntToStr(wAno)));
              QCalculaIRFPago.SetVariable('DT_Emissao_I', wData);
              QCalculaIRFPago.SetVariable('DT_Emissao_F', DMOracle.UltimoDiaMes(QConhecimentoCadDt_Emissao.Value));
              QCalculaIRFPago.Open;
              wSaldo_IRF := (QCalculaIRFPagoSaldo_IRF.value);
              DMIRF.QListaBaseCalc.close;
              DMIRF.QListaBaseCalc.open;
              while not DMIRF.QListaBaseCalc.Eof do
              begin
                wValor_Base := DMIRF.QListaBaseCalcVal_Base_Calc.value;
                wValor_Base_1 := DMIRF.QListaBaseCalcVal_Base_Calc_1.value;
                case DMIRF.QlistaBaseCalcCod_Opcao.value of
                  0: if wSaldo <= wValor_Base_1 then
                      wIRF := ((wSaldo * DMIRF.QListaBaseCalcAliquota.value) / 100) - DMIRF.QListaBaseCalcVal_Deducao.value;
                  1: if ((wSaldo > wValor_Base) and (wSaldo <= wValor_Base_1)) then
                      wIRF := ((wSaldo * DMIRF.QListaBaseCalcAliquota.value) / 100) - DMIRF.QListaBaseCalcVal_Deducao.value;
                  2: if (wSaldo > wValor_Base) then
                      wIRF := ((wSaldo * DMIRF.QListaBaseCalcAliquota.value) / 100) - DMIRF.QListaBaseCalcVal_Deducao.value;
                end;
                DMIRF.QListaBaseCalc.next;
              end;
              QConhecimentoCadVal_IRF.VALUE := (wIRF - wSaldo_IRF);
              QConhecimentoCadVAL_SEST_SENAT.Value := ((QConhecimentoCadVal_Frete.Value * DMParamSistema.QParamSistemaPerc_Sest_Senat.value) / 100);
            end;
            if (QConhecimentoCadVal_ICMS.VALUE = 0) or (QConhecimentoCadVal_ICMS.Text = '') then
              QConhecimentoCadVal_ICMS.VALUE := (QConhecimentoCadVal_Frete.Value + QConhecimentoCadVal_Seguro.Value) * StrToFloat(DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_TRIBUTACAO', 'COD_TRIBUTACAO = ' + IntToStr(QConhecimentoCadCod_Tributacao.Value))) / 100;
          end;
        end;
        if DMOperacao.QOperacaoInd_Conta_Pagar.Value = 'S' then
          with DMContasPagar do
          begin
            QContasPagar_Mov.Close;
            QContasPagar_cab.Close;
            QContasPagar_cab.Open;
            QContasPagar_Mov.Open;
            QContasPagar_Cab.Insert;
            if Trim(FConhecimento_CP.MECodFinalidade.Text) <> '' then
              QContasPagar_cabCod_Finalidade.Value := StrToInt(Trim(FConhecimento_CP.MECodFinalidade.text));
            if Trim(FConhecimento_CP.MECodBanco.Text) <> '' then
              QContasPagar_CabCOD_BANCO_AGENCIA.Value := StrToInt(Trim(FConhecimento_CP.MECodBanco.text));
            if Trim(FConhecimento_CP.MECodDepartamento.Text) <> '' then
              QContasPagar_CabCOD_Departamento.Value := StrToInt(Trim(FConhecimento_CP.MECodDepartamento.text));
            QContasPagar_CabCod_Cadastro.Value := QConhecimentoCadCod_Motorista.Value;
            QContasPagar_CabCod_Filial.Value := QConhecimentoCadCod_Filial_Destino.Value;
            QContasPagar_CabDesc_tipo_Documento.Value := 'FRE';
            QContasPagar_CabDT_EMISSAO.Value := QConhecimentoCadDT_EMISSAO.value;
            QContasPagar_CabDT_VENCIMENTO.Value := QConhecimentoCadDT_Emissao.value;
            wVlrLancto := (QConhecimentoCadVal_Frete.Value +
              QConhecimentoCadVal_Seguro.Value {*+
                                                 QConhecimentoCadVal_Pedagio.Value *}-
              QConhecimentoCadVal_Irf.Value - QConhecimentoCadVAL_SEST_SENAT.Value -
              QConhecimentoCadVAL_INSS_FORNECEDOR.Value -
              QConhecimentoCadVAL_FALTA_MERCADORIA_CHEGADA.Value -
              wDesconto);
            if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
             begin
               if (QConhecimentoCadCod_Operacao.Value = 421) or // isso foi a daiana que passou
                 (QConhecimentoCadCod_Operacao.Value = 402) or
                 (QConhecimentoCadCod_Operacao.Value = 407) then
                 wVlrLancto := wVlrLancto + QConhecimentoCadVal_Pedagio.Value;
             end
            else
              wVlrLancto := wVlrLancto + QConhecimentoCadVal_Pedagio.Value;
            QContasPagar_CabVAL_TITULO.Value := wVlrLancto;
            QContasPagar_CabNUM_TITULO.Value := QConhecimentoCadNum_Conhecimento.Value;
            QContasPagar_CabIND_ACEITE.Value := 'NAO';
            QContasPagar_CabIND_SITUACAO.Value := 'ABERTO';
            QContasPagar_CabDESC_OBSERVACAO.Value := 'Referente ao Conhecimento nr.' + QConhecimentoCadNum_Conhecimento.Text + ' e Nf. Nr.' + QConhecimentoCadNum_Nota.Text;
            QCOntasPagar_Cab.Post;
            QConhecimentoCadCod_Conta_Pagar_Cab.Value := QContasPagar_CabCod_Conta_Pagar_Cab.Value;
            QContasPagar_Mov.Close;
            QContasPagar_cab.Close;
          end;
          //Calcula Pis e Cofins
          QConhecimentoCadVAL_PIS.Value := (((QConhecimentoCadVAL_FRETE.Value * DMOperacao.QOperacaoPERC_BASE_PIS.Value) / 100) *
              DMParamSistema.QParamSistemaPERC_PIS.Value / 100);
          QConhecimentoCadVAL_COFINS.Value := (((QConhecimentoCadVAL_FRETE.Value * DMOperacao.QOperacaoPERC_BASE_COFINS.Value) / 100) *
              DMParamSistema.QParamSistemaPERC_COFINS.Value / 100);

        if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
        begin
          if (DMOperacao.QOperacaoCod_Contabil_Irrf_Cred.Text <> '') and
            (DMOperacao.QOperacaoCod_Contabil_Irrf_Deb.Text <> '') and
            (QConhecimentoCadVal_Irf.Value <> 0) then
          begin
            wCodDoc := QConhecimentoCadCod_Conhecimento.Value;
            wNumDoc := FloatToStr(QConhecimentoCadNum_Conhecimento.Value);
            wFilial := QConhecimentoCadCod_Filial.Value;
            wContaCred := DMOperacao.QOperacaoCod_Contabil_Irrf_Cred.Value;
            wContaDeb := DMOperacao.QOperacaoCod_Contabil_Irrf_Deb.Value;
            if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
              wCodCompl := QConhecimentoCadCod_Cadastro.Value
            else
              wCodCompl := QConhecimentoCadCod_Motorista.Value;
            wCodHistorico := DMOperacao.QOperacaoCod_Historico_Contabil.Value;
            wVlrLancto := QConhecimentoCadVal_Irf.Value;
            wDtLancto := QConhecimentoCadDt_Emissao.Value;
            DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
            DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
          end;
          if (DMOperacao.QOperacaoCod_Contabil_Frete_Cred.Text <> '') and
            (QConhecimentoCadVal_Frete.Value <> 0) then
          begin
            wCodDoc := QConhecimentoCadCod_Conhecimento.Value;
            wNumDoc := FloatToStr(QConhecimentoCadNum_Conhecimento.Value);
            wFilial := QConhecimentoCadCod_Filial.Value;
            wContaCred := DMOperacao.QOperacaoCod_Contabil_Frete_Cred.Value;
            wContaDeb := DMOperacao.QOperacaoCod_Contabil_Frete_Deb.Value;
            if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
              wCodCompl := QConhecimentoCadCod_Cadastro.Value
            else
              wCodCompl := QConhecimentoCadCod_Motorista.Value;
            wCodHistorico := DMOperacao.QOperacaoCod_Historico_Contabil.Value; // retirado por solicitacao do João
            if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
               wVlrLancto := QConhecimentoCadVal_Frete.Value + QConhecimentoCadVal_Seguro.Value - QConhecimentoCadVal_Inss_Fornecedor.Value -
                 QConhecimentoCadVal_Sest_Senat.Value - QConhecimentoCadVal_Falta_Mercadoria_Chegada.Value - QConhecimentoCadVal_Irf.Value -
                 QConhecimentoCadVal_Contabil.Value
            Else
               wVlrLancto := QConhecimentoCadVal_Frete.Value;
            wDtLancto := QConhecimentoCadDt_Emissao.Value;
            DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
            DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
            if QConhecimentoCadVal_Falta_Mercadoria_Chegada.Value > 0 then
            begin // isto foi uma solicitacao do joao e daiane 02/12/2005 - esta invertido as contas contabeis debido/credito mas é isto mesmo
              wVlrLancto := QConhecimentoCadVal_Falta_Mercadoria_Chegada.Value;
              DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
              DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
            end;
          end;
          if (DMOperacao.QOperacaoCod_Contabil_Inss_Cred.Text <> '') and
            (DMOperacao.QOperacaoCod_Contabil_Inss_Deb.Text <> '') and
            (QConhecimentoCadVal_Inss_Fornecedor.Value <> 0) then
          begin
            wCodDoc := QConhecimentoCadCod_Conhecimento.Value;
            wNumDoc := FloatToStr(QConhecimentoCadNum_Conhecimento.Value); ;
            wFilial := QConhecimentoCadCod_Filial.Value;
            wContaCred := DMOperacao.QOperacaoCod_Contabil_Inss_Cred.Value;
            wContaDeb := DMOperacao.QOperacaoCod_Contabil_Inss_Deb.Value;
            if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
              wCodCompl := QConhecimentoCadCod_Cadastro.Value
            else
              wCodCompl := QConhecimentoCadCod_Motorista.Value;
            wCodHistorico := DMOperacao.QOperacaoCod_Historico_Contabil.Value;
            wVlrLancto := QConhecimentoCadVal_Inss_Fornecedor.Value;
            wDtLancto := QConhecimentoCadDt_Emissao.Value;
            DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
            DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
          end;
          if (DMOperacao.QOperacaoCod_Contabil_Sest_Cred.Text <> '') and
            (DMOperacao.QOperacaoCod_Contabil_Sest_Deb.Text <> '') and
            (QConhecimentoCadVal_Sest_Senat.Value <> 0) then
          begin
            wCodDoc := QConhecimentoCadCod_Conhecimento.Value;
            wNumDoc := FloatToStr(QConhecimentoCadNum_Conhecimento.Value); ;
            wFilial := QConhecimentoCadCod_Filial.Value;
            wContaCred := DMOperacao.QOperacaoCod_Contabil_Sest_Cred.Value;
            wContaDeb := DMOperacao.QOperacaoCod_Contabil_Sest_Deb.Value;
            if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
              wCodCompl := QConhecimentoCadCod_Cadastro.Value
            else
              wCodCompl := QConhecimentoCadCod_Motorista.Value;
            wCodHistorico := DMOperacao.QOperacaoCod_Historico_Contabil.Value;
            wVlrLancto := QConhecimentoCadVAL_SEST_SENAT.Value;
            wDtLancto := QConhecimentoCadDt_Emissao.Value;
            DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
            DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
          end;
          if (DMOperacao.QOperacaoCod_Contabil_Pedagio_Cred.Text <> '') and
            (DMOperacao.QOperacaoCod_Contabil_Pedagio_Deb.Text <> '') and
            (QConhecimentoCadVal_Pedagio.Value <> 0) then
          begin
{               DMHistorico.QHistorico.Close;
               DMHistorico.QHistorico.SetVariable('Pk',Trim(FConhecimento_CP.FmHistorico.MEHistorico.Text));
               DMHistorico.QHistorico.Open;
              }wCodDoc := QConhecimentoCadCod_Conhecimento.Value;
            wNumDoc := FloatToStr(QConhecimentoCadNum_Conhecimento.Value); ;
            wFilial := QConhecimentoCadCod_Filial.Value;
            wContaCred := DMOperacao.QOperacaoCod_Contabil_Pedagio_Cred.Value;
            wContaDeb := DMOperacao.QOperacaoCod_Contabil_Pedagio_Deb.Value;
            if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
              wCodCompl := QConhecimentoCadCod_Cadastro.Value
            else
              wCodCompl := QConhecimentoCadCod_Motorista.Value;
            wCodHistorico := DMOperacao.QOperacaoCod_Historico_Contabil.Value;
            wVlrLancto := QConhecimentoCadVal_Pedagio.Value;
            wDtLancto := QConhecimentoCadDt_Emissao.Value;
            DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
            DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
          end;
          if (DMOperacao.QOperacaoCOD_CONTABIL_PIS_CRED.Value <> '') and
            (DMOperacao.QOperacaoCOD_CONTABIL_PIS_DEB.Value <> '') and
            (DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL_PIS.Text <> '') and
            (DMOperacao.QOperacaoPERC_BASE_PIS.Text <> '') then
          begin
            wNumDoc := FloatToStr(QConhecimentoCadNum_Conhecimento.Value);
            wFilial := QConhecimentoCadCod_Filial.Value;
            wContaCred := DMOperacao.QOperacaoCOD_CONTABIL_PIS_CRED.Value;
            wContaDeb := DMOperacao.QOperacaoCOD_CONTABIL_PIS_DEB.Value;
            wCodCompl := QConhecimentoCadCod_Motorista.Value;
            wCodHistorico := DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL_PIS.Value;
            wVlrLancto := (((QConhecimentoCadVAL_FRETE.Value * DMOperacao.QOperacaoPERC_BASE_PIS.Value) / 100) *
              DMParamSistema.QParamSistemaPERC_PIS.Value / 100);
            wDtLancto := QConhecimentoCadDt_Emissao.Value;
            DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
            DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
          end;
          if (DMOperacao.QOperacaoCOD_CONTABIL_COFINS_CRED.Value <> '') and
            (DMOperacao.QOperacaoCOD_CONTABIL_COFINS_DEB.Value <> '') and
            (DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL_COFINS.Text <> '') and
            (DMOperacao.QOperacaoPERC_BASE_COFINS.Text <> '') then
          begin
            wNumDoc := FloatToStr(QConhecimentoCadNum_Conhecimento.Value);
            wFilial := QConhecimentoCadCod_Filial.Value;
            wContaCred := DMOperacao.QOperacaoCOD_CONTABIL_COFINS_CRED.Value;
            wContaDeb := DMOperacao.QOperacaoCOD_CONTABIL_COFINS_DEB.Value;
            wCodCompl := QConhecimentoCadCod_Motorista.Value;
            wCodHistorico := DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL_COFINS.Value;
            wVlrLancto := (((QConhecimentoCadVAL_FRETE.Value * DMOperacao.QOperacaoPERC_BASE_COFINS.Value) / 100) *
              DMParamSistema.QParamSistemaPERC_COFINS.Value / 100);
            wDtLancto := QConhecimentoCadDt_Emissao.Value;
            DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
            DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
          end;
        end;
        if (QConhecimentoCadCod_Filial.Value = 13) and // solicitacao do joao para gerar bancos apenas para filial 13
          (QConhecimentoCadVal_Pedagio.Value <> 0) and
          (Trim(FConhecimento_CP.FmHistorico.MEHistorico.Text) <> '') and
          (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO') then
        begin
          DMBancoAgencia.IncluiBanco(StrToInt(Trim(FConhecimento_CP.FmHistorico.MeHistorico.Text)),
            StrToInt(Trim(FConhecimento_CP.FmContaCorrente.MeContaCorrente.Text)),
            QConhecimentoCadNum_Conhecimento.Value,
            QConhecimentoCadCod_Cadastro.Value,
            StrToInt(Trim(FConhecimento_CP.MeCodDepartamento.Text)),
            QConhecimentoCadDt_Emissao.Value,
            QConhecimentoCadVal_Pedagio.Value,
            'Pedagio Conhecimento',
            ' ',
            '', '', 'N', '');
          QConhecimentoCadCod_Bco_Movimento.Value := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
        end;
        If QConhecimentoCadInd_Pagar_Pago.Value = 'Vista' Then  // condicao de pagamento a vista - cai no caixa
          If DMOperacao.QOperacaoCod_Historico_Caixa.Text <> '' Then
            DMCaixa.IncluiCaixa(QConhecimentoCadCod_Filial.Value,StrToInt(Trim(FConhecimento_CP.MeCodDepartamento.Text)),
                                DMOperacao.QOperacaoCod_Historico_Caixa.Value,
                                QConhecimentoCadVal_Frete.Value,QConhecimentoCadNum_Conhecimento.Value,
                                QConhecimentoCadCod_Cadastro.Value,'Conhecimento Frete',
                                QConhecimentoCadDt_Emissao.Value,'','','', QConhecimentoCadCod_Conhecimento.Text);

        QConhecimentoCadInd_Situacao.Value := '2';
        QConhecimentoCad.Post;
        if DMOperacao.QOperacaoCod_Operacao_Entrada.Value > 0 then
        begin
          QConhecimentoCad_New.Close;
          QConhecimentoCad_New.Open;
          QConhecimentoCad_New.Insert;
          QConhecimentoCad_NewCOD_FILIAL.Value := QConhecimentoCadCOD_FILIAL_DESTINO.Value;
          QConhecimentoCad_NewCOD_CADASTRO.Value := QConhecimentoCadCOD_CADASTRO.Value;
          QConhecimentoCad_NewCOD_OPERACAO.Value := 431;
          QConhecimentoCad_NewDT_EMISSAO.Value := QConhecimentoCadDT_EMISSAO.Value;
          QConhecimentoCad_NewNUM_CONHECIMENTO.Value := QConhecimentoCadNUM_CONHECIMENTO.Value;
          QConhecimentoCad_NewCOD_NOTA_CAB.Value := QConhecimentoCadCOD_NOTA_CAB.Value;
          QConhecimentoCad_NewVAL_FRETE.Value := QConhecimentoCadVAL_FRETE.Value;
          QConhecimentoCad_NewCOD_TRIBUTACAO.Value := QConhecimentoCadCOD_TRIBUTACAO.Value;
          QConhecimentoCad_NewCOD_SERIE.Value := QConhecimentoCadCOD_SERIE.Value;
          QConhecimentoCad_NewDESC_LOCAL_COLETA.Value := QConhecimentoCadDESC_LOCAL_COLETA.Value;
          QConhecimentoCad_NewDESC_LOCAL_ENTREGA.Value := QConhecimentoCadDESC_LOCAL_ENTREGA.Value;
          QConhecimentoCad_NewCOD_MOTORISTA.Text := QConhecimentoCadCOD_MOTORISTA.Text;
          QConhecimentoCad_NewDESC_PLACA.Value := QConhecimentoCadDESC_PLACA.Value;
          QConhecimentoCad_NewDESC_OBS.Value := QConhecimentoCadDESC_OBS.Value;
          QConhecimentoCad_NewVAL_NOTA.Value := QConhecimentoCadVAL_NOTA.Value;
          QConhecimentoCad_NewQT_NOTA.Value := QConhecimentoCadQT_NOTA.Value;
          QConhecimentoCad_NewDESC_OBS2.Value := QConhecimentoCadDESC_OBS2.Value;
          QConhecimentoCad_NewCOD_CONTRATO_VEND.Text := QConhecimentoCadCOD_CONTRATO_VEND.Text;
          QConhecimentoCad_NewCOD_MENSAGEM.Text := QConhecimentoCadCOD_MENSAGEM.Text;
          QConhecimentoCad_NewDESC_TARIFA.Value := QConhecimentoCadDESC_TARIFA.Value;
          QConhecimentoCad_NewIND_SITUACAO.Value := '1';
          QConhecimentoCad_NewCOD_USUARIO.Value := QConhecimentoCadCOD_USUARIO.Value;
          QConhecimentoCad_NewDT_RECEBIMENTO.Value := QConhecimentoCadDT_RECEBIMENTO.Value;
          QConhecimentoCad_NewDESC_CARTAO_PEDAGIO.Value := QConhecimentoCadDESC_CARTAO_PEDAGIO.Value;
          QConhecimentoCad_NewCOD_FILIAL_DESTINO.Value := QConhecimentoCadCOD_FILIAL.Value;
          QConhecimentoCad_NewVAL_CONTABIL.Value := QConhecimentoCadVAL_SEST_SENAT.Value + QConhecimentoCadVal_Inss_Fornecedor.Value + QConhecimentoCadVal_Irf.Value;
          QConhecimentoCad_NewVAL_PEDAGIO.Value := QConhecimentoCadVAL_PEDAGIO.Value;
          QConhecimentoCad_NewVAL_ICMS.Value := QConhecimentoCadVAL_ICMS.Value;
          QConhecimentoCad_New.Post;
          QConhecimentoCad_New.Close;
        end;
        DMOracle.DBCemapa.Commit;
        if QConhecimentoCadCOD_OPERACAO.Value <> 431 then // solicitado pelo joao e daiana 29/05/2007
          ImpressoConhecimento1Click(Self);
      end;
    end;
  except
    DMConhecimento.QConhecimentoCad.Cancel;
    DMContasPagar.QContasPagar_Cab.Cancel;
    DMContasPagar.QContasPagar_Mov.Cancel;
    DMOracle.DBCemapa.Rollback;
    raise;
  end;
end;

procedure TFConhecimentoCad.VoltarConfirmao1Click(Sender: TObject);
begin
  inherited;
  if DMConhecimento.QConhecimentoCadNum_Conhecimento.Value <> 0 then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(DMConhecimento.QConhecimentoCadCOD_FILIAL.Text), 'CONHECIMENTO');
    if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMconhecimento.QConhecimentoCadDt_Emissao.Value then
      raise Exception.Create('Não é Permitido Voltar Este Conhecimento - Fechamento Contabil');
    DMOracle.DBCemapa.StartTransaction;
    try
      with DMContasPagar do
      begin
        QContasPagar_Cab.Close;
        QContasPagar_Mov.Close;
        QContasPagar_Cab.SetVariable('Pk', DMConhecimento.QConhecimentoCadCod_Conta_Pagar_Cab.Value);
        QContasPagar_Cab.Open;
        QContasPagar_Mov.Open;
        DMConhecimento.QConhecimentoCad.Edit;
        DMConhecimento.QConhecimentoCadInd_Situacao.Value := '1';
        DMConhecimento.QConhecimentoCadCod_Conta_Pagar_Cab.Text := '';
        DMConhecimento.QConhecimentoCad.Post;
        while not QContasPagar_Cab.Eof do
        begin
          if QContasPagar_MovInd_Tipo_Movimento.Value <> '' then
          begin
            if (QContasPagar_MovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
              raise Exception.Create('Conta a Pagar com baixas!')
            else
              QContasPagar_Mov.Delete;
          end;
          QContasPagar_Cab.Delete;
        end;
      end;
      DMPlanilha.Descontabiliza(DMConhecimento.QConhecimentoCadCod_Conhecimento.Value, 'RPA');
      if DMConhecimento.QConhecimentoCadCod_Bco_Movimento.Value <> Null then
      begin
        DMBancoAgencia.QBancoMovimento.Close;
        DMBancoAgencia.QBancoMovimento.SetVariable('Pk', DMConhecimento.QConhecimentoCadCod_Bco_Movimento.Value);
        DMBancoAgencia.QBancoMovimento.Open;
        if not (DMBancoAgencia.QBancoMovimento.Eof) then
          DMBancoAgencia.QBancoMovimento.Delete;
      end;
      // 9. Voltar Caixa
      If DMConhecimento.QConhecimentoCadInd_Pagar_Pago.Value = 'Vista' Then
       Begin
         DMConhecimento.QCaixa_Volta_Conhecimento.Close;
         DMConhecimento.QCaixa_Volta_Conhecimento.SetVariable('Cod_Conhecimento',DMConhecimento.QConhecimentoCadCod_Conhecimento.Value);
         DMConhecimento.QCaixa_Volta_Conhecimento.Open;
         DMConhecimento.QCaixa_Volta_Conhecimento.Delete;
         DMConhecimento.QCaixa_Volta_Conhecimento.Close;
       End;
      DMOracle.Audit(TOracleDataset1(DSPrimario.Dataset), 'Volta Confirmação');
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      DMContasPagar.QContasPagar_Cab.Close;
      DMContasPagar.QContasPagar_Mov.Close;
      DMConhecimento.QConhecimentoCad.Close;
      DMConhecimento.QConhecimentoCad.Open;
      raise;
    end;
  end;
end;

procedure TFConhecimentoCad.DBEdit36Change(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    MMCadSimples.Items[2].Items[0].Enabled := QConhecimentoCadInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QConhecimentoCadInd_Situacao.Value = '2';
    MMCadSimples.Items[2].Items[2].Enabled := QConhecimentoCadInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[3].Enabled := QConhecimentoCadInd_Situacao.Value = '3';
  end;
end;

procedure TFConhecimentoCad.VoltarCancelamento1Click(Sender: TObject);
begin
  inherited;
  if DMConhecimento.QConhecimentoCadInd_Situacao.Value <> '3' then
    raise Exception.Create('Este conhecimento não foi cancelado!');
  with DMConhecimento do
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(QConhecimentoCadCOD_FILIAL.Text), 'CONHECIMENTO');
    try
      DMOracle.DBCemapa.StartTransaction;
      QConhecimentoCad.Edit;
      QConhecimentoCadInd_Situacao.Value := '1';
      QConhecimentoCad.Post;

      DMOracle.DBCemapa.Commit;
    except
      if QConhecimentoCad.State <> dsBrowse then
        QConhecimentoCad.Cancel;
      raise Exception.Create('Não é possível voltar cancelamento deste Conhecimento!');
    end;
  end;
end;

procedure TFConhecimentoCad.Cancela1Click(Sender: TObject);
begin
  inherited;
  if DMConhecimento.QConhecimentoCadInd_Situacao.Value <> '1' then
    raise Exception.Create('Não é possível cancelar este conhecimento!');
  with DMConhecimento do
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(QConhecimentoCadCOD_FILIAL.Text), 'CONHECIMENTO');
    try
      DMOracle.DBCemapa.StartTransaction;
      QConhecimentoCad.Edit;
      QConhecimentoCadInd_Situacao.Value := '3';
      //QConhecimentoCadCod_Nota_Cab.Text := '';
      QConhecimentoCad.Post;
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      if QConhecimentoCad.State <> dsBrowse then
        QConhecimentoCad.Cancel;
      raise Exception.Create('Não é possível cancelar este Conhecimento!');
    end;
  end;
end;

procedure TFConhecimentoCad.SBAlterarClick(Sender: TObject);
begin
  if DMConhecimento.QConhecimentoCadInd_Situacao.Value <> '1' then
    raise Exception.Create('Somente Alterar Conhecimento - Digitado')
  else
    inherited;
  DMConhecimento.QConhecimentoCadVal_ICMS.VALUE := 0;
end;

procedure TFConhecimentoCad.ImpressoConhecimentocContrato1Click(
  Sender: TObject);
begin
  inherited;
  if FConhecimentoParam = nil then
    FConhecimentoParam := TFConhecimentoParam.Create(Application);
  FConhecimentoParam.PGRelatorio.Pages[4].TabVisible := True;
  if FConhecimentoParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FConhecimentoParam.FmFilial5.MeFilial.Text), 'CONHECIMENTO');
    with DMConhecimento do
    begin
      QRConhecimentoContrato.Close;

        //Frames---------------------
      if Trim(FConhecimentoParam.FmContrato5.MeContrato.text) <> '' then
        QRConhecimentoContrato.SetVariable('COD_CONTRATO', Trim(FConhecimentoParam.FmContrato5.MeContrato.text))
      else
        QRConhecimentoContrato.SetVariable('COD_CONTRATO', Null);
      if Trim(FConhecimentoParam.FmFilial5.MeFilial.Text) <> '' then
        QRConhecimentoContrato.SetVariable('COD_FILIAL', Trim(FConhecimentoParam.FmFilial5.MeFilial.Text))
      else
        QRConhecimentoContrato.SetVariable('COD_FILIAL', Null);
      if Trim(FConhecimentoParam.FmFilialDestino5.MeFilial.Text) <> '' then
        QRConhecimentoContrato.SetVariable('FILIAL_DESTINO', Trim(FConhecimentoParam.FmFilialDestino5.MeFilial.Text))
      else
        QRConhecimentoContrato.SetVariable('FILIAL_DESTINO', Null);
      if Trim(FConhecimentoParam.FmProduto5.MeProduto.Text) <> '' then
        QRConhecimentoContrato.SetVariable('COD_PRODUTO', Trim(FConhecimentoParam.FmProduto5.MeProduto.Text))
      else
        QRConhecimentoContrato.SetVariable('COD_PRODUTO', Null);
      if Trim(FConhecimentoParam.FmCadastroParceiro5.MeCadastro.Text) <> '' then
        QRConhecimentoContrato.SetVariable('COD_CADASTRO_PARCEIRO', Trim(FConhecimentoParam.FmCadastroParceiro5.MeCadastro.Text))
      else
        QRConhecimentoContrato.SetVariable('COD_CADASTRO_PARCEIRO', Null);
        //---------------------------

      QRConhecimentoContrato.SetVariable('DATA_I', FConhecimentoParam.ME5DtInicial.Text);
      QRConhecimentoContrato.SetVariable('DATA_F', FConhecimentoParam.ME5DtFinal.Text);
      QRConhecimentoContrato.Open;
      if FRConhecimentoContrato = nil then
        FRConhecimentoContrato := TFRConhecimentoContrato.Create(Application);

        //Cabeçalho Relatório
        //----------------------------
      FRConhecimentoContrato.QRLFilialDestino.Caption := 'Filial Destino: ' + Trim(FConhecimentoParam.FmFilialDestino5.EdFilial.Text);
        //----------------------------

      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRConhecimentoContrato.QRPrimario.Preview
      else
        FRConhecimentoContrato.QRPrimario.Print;
      QRConhecimentoContrato.Close;
    end;
  end;
end;

procedure TFConhecimentoCad.ImpressoConhecimentosContrato1Click(
  Sender: TObject);
begin
  inherited;
  if FConhecimentoParam = nil then
    FConhecimentoParam := TFConhecimentoParam.Create(Application);
  FConhecimentoParam.PGRelatorio.Pages[5].TabVisible := True;
  if FConhecimentoParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FConhecimentoParam.FmFilial6.MeFilial.Text), 'CONHECIMENTO');
    with DMConhecimento do
    begin
      QRConhecimentoSContrato.Close;
      QRConhecimentoSContrato.SetVariable('DATA_I', FConhecimentoParam.ME6DtInicial.Text);
      QRConhecimentoSContrato.SetVariable('DATA_F', FConhecimentoParam.ME6DtFinal.Text);

          //Frames------------------------
      if Trim(FConhecimentoParam.FmCadastro6.MeCadastro.Text) <> '' then
        QRConhecimentoSContrato.SetVariable('COD_CADASTRO', Trim(FConhecimentoParam.FmCadastro6.MeCadastro.Text))
      else
        QRConhecimentoSContrato.SetVariable('COD_CADASTRO', Null);
      if Trim(FConhecimentoParam.FmCadastroParceiro6.MeCadastro.Text) <> '' then
        QRConhecimentoSContrato.SetVariable('COD_CADASTRO_PARCEIRO', Trim(FConhecimentoParam.FmCadastroParceiro6.MeCadastro.Text))
      else
        QRConhecimentoSContrato.SetVariable('COD_CADASTRO_PARCEIRO', Null);
      if Trim(FConhecimentoParam.FmFilialDestino6.MeFilial.Text) <> '' then
        QRConhecimentoSContrato.SetVariable('FILIAL_DESTINO', Trim(FConhecimentoParam.FmFilialDestino6.MeFilial.Text))
      else
        QRConhecimentoSContrato.SetVariable('FILIAL_DESTINO', Null);
      if Trim(FConhecimentoParam.FmFilial6.MeFilial.Text) <> '' then
        QRConhecimentoSContrato.SetVariable('COD_FILIAL', FConhecimentoParam.FmFilial6.MeFilial.Text)
      else
        QRConhecimentoSContrato.SetVariable('COD_FILIAL', Null);
      if Trim(FConhecimentoParam.FmProduto6.MeProduto.Text) <> '' then
        QRConhecimentoSContrato.SetVariable('COD_PRODUTO', Trim(FConhecimentoParam.FmProduto6.MeProduto.Text))
      else
        QRConhecimentoSContrato.SetVariable('COD_PRODUTO', Null);
          //-----------------------------

      QRConhecimentoSContrato.Open;
      if FRConhecimentoSContrato = nil then
        FRConhecimentoSContrato := TFRConhecimentoSContrato.Create(Application);

          //Cabeçalho Relatório
          //----------------------------
      FRConhecimentoSContrato.QRLFilialDestino.Caption := 'Filial Destino: ' + Trim(FConhecimentoParam.FmFilialDestino6.EdFilial.Text);
      FRConhecimentoSContrato.QRLTitulo.Caption := 'Relatório de Conhecimentos s/Contrato de ' + FConhecimentoParam.ME6DtInicial.Text + ' Até ' + FConhecimentoParam.ME6DtFinal.Text;
          //----------------------------

      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRConhecimentoSContrato.QRPrimario.Preview
      else
        FRConhecimentoSContrato.QRPrimario.Print;
      QRConhecimentoSContrato.Close;
    end;
  end;
end;

procedure TFConhecimentoCad.SbNotaEntradaClick(Sender: TObject);
begin
  inherited;
  if FNotaEntradaCons = nil then
    FNotaEntradaCons := TFNotaEntradaCons.create(application);
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL' then // A pedido de Andreia, Grasel - 07/08/2009
  begin
    FNotaEntradaCons.BtFilial.Enabled := False;
    FNotaEntradaCons.MeFilial.Enabled := False;
  end;
  FNotaEntradaCons.MeFilial.Text := IntToStr(DmUsuario.CodFilialUsuario);
  if FNotaEntradaCons.showmodal = mrOk then
    DMConhecimento.QConhecimentoCadCod_Nota_Cab.value := DMNotaEntrada.QNotaEntradaConsCod_Nota_Cab.value;
  FNotaEntradaCons.BtFilial.Enabled := True;
  FNotaEntradaCons.MeFilial.Enabled := True;
  DBEdit6Exit(self);

end;

procedure TFConhecimentoCad.RelConhecimentoProprietrio1Click(
  Sender: TObject);
begin
  inherited;
  if FConhecimentoParam = nil then
    FConhecimentoParam := TFConhecimentoParam.Create(Application);
  FConhecimentoParam.PGRelatorio.Pages[6].TabVisible := True;
  if FConhecimentoParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FConhecimentoParam.FmFilial7.MeFilial.Text), 'CONHECIMENTO');
    with DMConhecimento do
    begin
      QRConhecimentoProp.Close;

        //Frames-----------------------
      if Trim(FConhecimentoParam.FmProprietario7.MeProprietario.text) <> '' then
        QRConhecimentoProp.SetVariable('COD_PROPRIETARIO', Trim(FConhecimentoParam.FmProprietario7.MeProprietario.text))
      else
        QRConhecimentoProp.SetVariable('COD_PROPRIETARIO', Null);
      if Trim(FConhecimentoParam.FmFilial7.MeFilial.text) <> '' then
        QRConhecimentoProp.SetVariable('COD_FILIAL', Trim(FConhecimentoParam.FmFilial7.MeFilial.text))
      else
        QRConhecimentoProp.SetVariable('COD_FILIAL', Null);
      if Trim(FConhecimentoParam.FmFilialDestino7.MeFilial.text) <> '' then
        QRConhecimentoProp.SetVariable('FILIAL_DESTINO', Trim(FConhecimentoParam.FmFilialDestino7.MeFilial.text))
      else
        QRConhecimentoProp.SetVariable('FILIAL_DESTINO', Null);
        //-------------------------------

      case FConhecimentoParam.Rg7Tipo.ItemIndex of
        0: QRConhecimentoProp.SetVariable('IND_FISICA_JURIDICA', 'F');
        1: QRConhecimentoProp.SetVariable('IND_FISICA_JURIDICA', 'J');
        2: QRConhecimentoProp.SetVariable('IND_FISICA_JURIDICA', Null);
      end;
      QRConhecimentoProp.SetVariable('DT_EMISSAO_I', FConhecimentoParam.ME7Data_I.Text);
      QRConhecimentoProp.SetVariable('DT_EMISSAO_F', FConhecimentoParam.Me7Data_F.Text);
      QRConhecimentoProp.Open;

      if FRConhecimentoIRF = nil then
        FRConhecimentoIRF := TFRConhecimentoIRF.Create(Application);

        //Cabeçalho Relatório
        //----------------------------
      FRConhecimentoIRF.QRLFilialDestino.Caption := 'Filial Destino: ' + Trim(FConhecimentoParam.FmFilialDestino7.EdFilial.Text);
      FRConhecimentoIRF.QRLTitulo.Caption := 'Conhecimento de Frete Por Proprietario de ' + FConhecimentoParam.ME7Data_I.Text + ' Até ' + FConhecimentoParam.Me7Data_F.Text;
        //----------------------------

      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRConhecimentoIRF.QRPrimario.Preview
      else
        FRConhecimentoIRF.QRPrimario.Print;
      QRConhecimentoProp.Close;
    end;
  end;

end;

procedure TFConhecimentoCad.BtContratoVendaClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal = mrOk then
  begin
    if DMConhecimento.DSConhecimentoAlt.State in [DsBrowse] then
      DMConhecimento.DSConhecimentoAlt.Edit;
    DMConhecimento.QConhecimentoAltCod_Contrato_Vend.Value := DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
  end;
end;

procedure TFConhecimentoCad.RelatrioConhecimento1Click(Sender: TObject);
begin
  inherited;
  if FConhecimentoParam = nil then
    FConhecimentoParam := TFConhecimentoParam.Create(Application);
  FConhecimentoParam.PGRelatorio.Pages[7].TabVisible := True;
  if FConhecimentoParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FConhecimentoParam.FmFilial8.MeFilial.Text), 'CONHECIMENTO');
    with DMConhecimento do
    begin
      case FConhecimentoParam.RG8Conhecimento.ItemIndex of
        0: begin
            QRConhecimentoCarga.close;
            QRConhecimentoCarga.SQL.Clear;
            QRConhecimentoCarga.SQL.add('SELECT DISTINCT TB_CONHECIMENTO.COD_FILIAL,TB_FILIAL.DESC_FILIAL, TB_CONHECIMENTO.COD_CADASTRO,TB_CONHECIMENTO.COD_CADASTRO_DESCARGA, TB_CONHECIMENTO.DT_EMISSAO, TB_CONHECIMENTO.NUM_CONHECIMENTO,TB_CONHECIMENTO.DESC_PLACA,');
            QRConhecimentoCarga.SQL.add('TB_CONHECIMENTO.QT_NOTA,TB_CONHECIMENTO.QT_PESO_CHEGADA,(TB_CONHECIMENTO.VAL_FRETE+NVL(TB_CONHECIMENTO.VAL_SEGURO,0)) AS VAL_FRETE,TB_CONHECIMENTO.VAL_PEDAGIO,TB_CONHECIMENTO.VAL_ICMS,');
            QRConhecimentoCarga.SQL.add('TB_CONHECIMENTO.VAL_ESTADIA,TB_CONHECIMENTO.VAL_VARIACAO_FRETE,TB_NOTA_CAB.NUM_NOTA,TB_CONHECIMENTO.COD_OPERACAO,TB_OPERACAO.DESC_OPERACAO,TB_CADASTRO.NOME ');
            QRConhecimentoCarga.SQL.add('FROM TB_CONHECIMENTO,TB_OPERACAO,TB_NOTA_CAB,TB_CADASTRO,TB_FILIAL,TB_NOTA_ITEM,TB_CONTA_PAGAR_CAB WHERE TB_CONHECIMENTO.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB(+)  ');
            QRConhecimentoCarga.SQL.add('AND NOT(TB_CONHECIMENTO.QT_PESO_CHEGADA IS NULL) AND TB_CONHECIMENTO.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO AND TB_CONHECIMENTO.COD_FILIAL = TB_FILIAL.COD_FILIAL ');
            QRConhecimentoCarga.SQL.add('AND TB_CONHECIMENTO.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB(+) AND TB_CONHECIMENTO.IND_SITUACAO = 2');
            QRConhecimentoCarga.SQL.add('AND TB_CONHECIMENTO.COD_CONTA_PAGAR_CAB = TB_CONTA_PAGAR_CAB.COD_CONTA_PAGAR_CAB AND TB_CONHECIMENTO.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO(+)');
          end;
        1: begin
            QRConhecimentoCarga.close;
            QRConhecimentoCarga.SQL.Clear;
            QRConhecimentoCarga.SQL.add('SELECT DISTINCT TB_CONHECIMENTO.COD_FILIAL, TB_FILIAL.DESC_FILIAL,TB_CONHECIMENTO.COD_CADASTRO,TB_CONHECIMENTO.COD_CADASTRO_DESCARGA, TB_CONHECIMENTO.DT_EMISSAO, TB_CONHECIMENTO.NUM_CONHECIMENTO,TB_CONHECIMENTO.DESC_PLACA, ');
            QRConhecimentoCarga.SQL.add('TB_CONHECIMENTO.QT_NOTA,TB_CONHECIMENTO.QT_PESO_CHEGADA,(TB_CONHECIMENTO.VAL_FRETE+NVL(TB_CONHECIMENTO.VAL_SEGURO,0)) AS VAL_FRETE,TB_CONHECIMENTO.VAL_PEDAGIO,TB_CONHECIMENTO.VAL_ICMS,');
            QRConhecimentoCarga.SQL.add('TB_CONHECIMENTO.VAL_ESTADIA,TB_CONHECIMENTO.VAL_VARIACAO_FRETE,TB_NOTA_CAB.NUM_NOTA,TB_CONHECIMENTO.COD_OPERACAO,TB_OPERACAO.DESC_OPERACAO,TB_CADASTRO.NOME ');
            QRConhecimentoCarga.SQL.add('FROM TB_CONHECIMENTO,TB_OPERACAO,TB_NOTA_CAB,TB_CADASTRO,TB_FILIAL,TB_NOTA_ITEM,TB_CONTA_PAGAR_CAB WHERE TB_CONHECIMENTO.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB(+) ');
            QRConhecimentoCarga.SQL.add('AND (TB_CONHECIMENTO.QT_PESO_CHEGADA IS NULL) AND TB_CONHECIMENTO.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO ');
            QRConhecimentoCarga.SQL.add('AND TB_CONHECIMENTO.COD_FILIAL = TB_FILIAL.COD_FILIAL AND TB_CONHECIMENTO.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB(+) AND TB_CONHECIMENTO.IND_SITUACAO = 2');
            QRConhecimentoCarga.SQL.add('AND TB_CONHECIMENTO.COD_CONTA_PAGAR_CAB = TB_CONTA_PAGAR_CAB.COD_CONTA_PAGAR_CAB AND TB_CONHECIMENTO.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO(+)');
          end;
      else
        begin
          QRConhecimentoCarga.close;
          QRConhecimentoCarga.SQL.Clear;
          QRConhecimentoCarga.SQL.add('SELECT DISTINCT TB_CONHECIMENTO.COD_FILIAL, TB_FILIAL.DESC_FILIAL, TB_CONHECIMENTO.COD_CADASTRO,TB_CONHECIMENTO.COD_CADASTRO_DESCARGA, TB_CONHECIMENTO.DT_EMISSAO, TB_CONHECIMENTO.NUM_CONHECIMENTO,TB_CONHECIMENTO.DESC_PLACA, ');
          QRConhecimentoCarga.SQL.add('TB_CONHECIMENTO.QT_NOTA,TB_CONHECIMENTO.QT_PESO_CHEGADA,(TB_CONHECIMENTO.VAL_FRETE+NVL(TB_CONHECIMENTO.VAL_SEGURO,0)) AS VAL_FRETE,TB_CONHECIMENTO.VAL_PEDAGIO,TB_CONHECIMENTO.VAL_ICMS,');
          QRConhecimentoCarga.SQL.add('TB_CONHECIMENTO.VAL_ESTADIA,TB_CONHECIMENTO.VAL_VARIACAO_FRETE,TB_NOTA_CAB.NUM_NOTA,TB_CONHECIMENTO.COD_OPERACAO,TB_OPERACAO.DESC_OPERACAO,TB_CADASTRO.NOME ');
          QRConhecimentoCarga.SQL.add('FROM TB_CONHECIMENTO,TB_OPERACAO,TB_NOTA_CAB,TB_CADASTRO,TB_FILIAL,TB_NOTA_ITEM,TB_CONTA_PAGAR_CAB WHERE TB_CONHECIMENTO.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB(+) ');
          QRConhecimentoCarga.SQL.add('AND TB_CONHECIMENTO.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO AND TB_CONHECIMENTO.COD_FILIAL = TB_FILIAL.COD_FILIAL AND TB_CONHECIMENTO.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB(+) AND TB_CONHECIMENTO.IND_SITUACAO = 2');
          QRConhecimentoCarga.SQL.add('AND TB_CONHECIMENTO.COD_CONTA_PAGAR_CAB = TB_CONTA_PAGAR_CAB.COD_CONTA_PAGAR_CAB AND TB_CONHECIMENTO.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO(+)');
        end;
      end;

       //Frames------------------------
      if trim(FConhecimentoParam.FmFilial8.MeFilial.Text) <> '' then
        QRConhecimentoCarga.SQL.add(' AND TB_CONHECIMENTO.COD_FILIAL=' + trim(FConhecimentoParam.FmFilial8.MeFilial.Text));
      if trim(FConhecimentoParam.FmFilialDestino8.MeFilial.Text) <> '' then
        QRConhecimentoCarga.SQL.add(' AND TB_CONHECIMENTO.COD_FILIAL_DESTINO=' + trim(FConhecimentoParam.FmFilialDestino8.MeFilial.Text));
      if Trim(FConhecimentoParam.FmCadastro8.MeCadastro.Text) <> '' then
        QRConhecimentoCarga.SQL.add(' AND TB_CONHECIMENTO.COD_CADASTRO=' + Trim(FConhecimentoParam.FmCadastro8.MeCadastro.Text));
      if Trim(FConhecimentoParam.ME8CodParceiro.Text) <> '' then
        QRConhecimentoCarga.SQL.add(' AND TB_NOTA_CAB.COD_CADASTRO_PARCEIRO=' + Trim(FConhecimentoParam.ME8CodParceiro.Text));
      if Trim(FConhecimentoParam.FmProduto8.MeProduto.Text) <> '' then
        QRConhecimentoCarga.SQL.add(' AND TB_NOTA_ITEM.COD_PRODUTO=' + Trim(FConhecimentoParam.FmProduto8.MeProduto.Text));
      if Trim(FConhecimentoParam.FmFinalidade8.MeFinalidade.Text) <> '' then
        QRConhecimentoCarga.SQL.add(' AND TB_CONTA_PAGAR_CAB.COD_FINALIDADE=' + Trim(FConhecimentoParam.FmFinalidade8.MeFinalidade.Text));
       //-------------------------------
      if Trim(FConhecimentoParam.ME8Data_I.Text) <> '' then
        QRConhecimentoCarga.SQL.add(' AND TB_CONHECIMENTO.DT_EMISSAO >= ' + CHR(39) + Trim(FConhecimentoParam.ME8Data_I.Text) + chr(39));
      if Trim(FConhecimentoParam.ME8Data_F.Text) <> '' then
        QRConhecimentoCarga.SQL.add(' AND TB_CONHECIMENTO.DT_EMISSAO <= ' + CHR(39) + Trim(FConhecimentoParam.ME8Data_F.Text) + chr(39));
      if FConhecimentoParam.RG8TipoNota.ItemIndex = 0 then
        QRConhecimentoCarga.SQL.add(' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + CHR(39) + 'E' + chr(39))
      else
        if FConhecimentoParam.RG8TipoNota.ItemIndex = 1 then
          QRConhecimentoCarga.SQL.add(' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + CHR(39) + 'S' + chr(39));
      QRConhecimentoCarga.SQL.add(' ORDER BY TB_CONHECIMENTO.COD_OPERACAO,TB_CONHECIMENTO.NUM_CONHECIMENTO');
      QRConhecimentoCarga.open;

      if FRConhecimentoCarga = nil then
        FRConhecimentoCarga := TFRConhecimentoCarga.create(application);

       //Cabeçalho Relatório
       //----------------------------
      FRConhecimentoCarga.QRLFilialDestino.Caption := 'Filial Destino: ' + Trim(FConhecimentoParam.FmFilialDestino8.EdFilial.Text);
      FRConhecimentoCarga.QRLbFilial.Caption := 'Filial: ' + trim(FConhecimentoParam.FmFilial8.MeFilial.Text) + ' ' + FConhecimentoParam.FmFilial8.EdFilial.Text +
        ' De ' + FConhecimentoParam.ME8Data_I.Text + ' Até ' + FConhecimentoParam.ME8Data_F.Text;
      FRConhecimentoCarga.QRLFinalidade.Caption := 'Finalidade: ' + Trim(FconhecimentoParam.FmFinalidade8.EdFinalidade.Text);
      if (Trim(FConhecimentoParam.Me8CodParceiro.Text) <> '') then
        FRConhecimentoCarga.QRLbParceiro.Caption := 'Parceiro: ' + Trim(FConhecimentoParam.Me8CodParceiro.Text) + ' ' + DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(FConhecimentoParam.Me8CodParceiro.Text))
      else
        FRConhecimentoCarga.QRLbParceiro.Caption := 'Parceiro: Todos';
      if Trim(FConhecimentoParam.FmProduto8.MeProduto.Text) <> '' then
        FRConhecimentoCarga.QRLbParceiro.Caption := FRConhecimentoCarga.QRLbParceiro.Caption + ' - Produto:' + Trim(FConhecimentoParam.FmProduto8.MeProduto.Text) + ' - ' + Trim(FConhecimentoParam.FmProduto8.EdProduto.Text);
       //----------------------------

      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRConhecimentoCarga.QRPrimario.Preview
      else
        FRConhecimentoCarga.QRPrimario.Print;
      QRConhecimentoCarga.Close;
    end;
  end;
end;

procedure TFConhecimentoCad.SBNotaCorrecaoClick(Sender: TObject);
begin
  inherited;
  if DMConhecimento.QConhecimentoCadCOD_CONHECIMENTO.Value = 0 then
    raise Exception.Create('É necessário escolher um Registro para emitir uma Carta Corretiva');
  if FNotaCorrecao = nil then
    FNotaCorrecao := TFNotaCorrecao.Create(application);
  DMNotaCorrecao.pCodNota := DMConhecimento.QConhecimentoCadCOD_NOTA_CAB.Value;
  DMNotaCorrecao.pCodConhecimento := DMConhecimento.QConhecimentoCadCOD_CONHECIMENTO.Value;
  FNotaCorrecao.ShowModal;
end;

procedure TFConhecimentoCad.RelConhecimentoIR1Click(Sender: TObject);
var
  wstrDTInicio, wstrDTFim: string;
begin
  inherited;
  if FConhecimentoParam = nil then
    FConhecimentoParam := TFConhecimentoParam.Create(Application);
  FConhecimentoParam.PGRelatorio.Pages[10].TabVisible := True;
  if FConhecimentoParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FConhecimentoParam.FmFilial11.MeFilial.Text), 'CONHECIMENTO');
    with DMConhecimento do
    begin
      QRConhecimentoIR.Close;

      //Frames-----------------------
      if (Trim(FConhecimentoParam.FmFilial11.MeFilial.Text) <> '') then
        QRConhecimentoIR.SetVariable('FILIAL', StrToInt(Trim(FConhecimentoParam.FmFilial11.MeFilial.Text)))
      else
        QRConhecimentoIR.SetVariable('FILIAL', null);
      if (Trim(FConhecimentoParam.FmProprietario11.MeProprietario.Text) <> '') then
        QRConhecimentoIR.SetVariable('PROPRIETARIO', StrToInt(Trim(FConhecimentoParam.FmProprietario11.MeProprietario.Text)))
      else
        QRConhecimentoIR.SetVariable('PROPRIETARIO', null);
      if (Trim(FConhecimentoParam.FmFilialDestino11.MeFilial.Text) <> '') then
        QRConhecimentoIR.SetVariable('FILIAL_DESTINO', StrToInt(Trim(FConhecimentoParam.FmFilialDestino11.MeFilial.Text)))
      else
        QRConhecimentoIR.SetVariable('FILIAL_DESTINO', null);
      //------------------------------

      if (Trim(FConhecimentoParam.ME11CodConhecimento.Text) <> '') then
        QRConhecimentoIR.SetVariable('CONHECIMENTO', StrToInt(Trim(FConhecimentoParam.ME11CodConhecimento.Text)))
      else
        QRConhecimentoIR.SetVariable('CONHECIMENTO', null);

      if (Trim(FConhecimentoParam.ME11DtInicio.Text) <> '') then
      begin
        wstrDTInicio := FConhecimentoParam.ME11DtInicio.Text;
        QRConhecimentoIR.SetVariable('DT_INICIO', wstrDTInicio);
      end
      else
      begin
        wstrDTInicio := '01/01/1900';
        QRConhecimentoIR.SetVariable('DT_INICIO', StrToDate(wstrDTInicio));
      end;

      if (Trim(FConhecimentoParam.ME11DtFim.Text) <> '') then
      begin
        wstrDTFim := FConhecimentoParam.ME11DtFim.Text;
        QRConhecimentoIR.SetVariable('DT_FIM', wstrDTFim);
      end
      else
      begin
        wstrDTFim := '01/01/2040';
        QRConhecimentoIR.SetVariable('DT_FIM', StrToDate(wstrDTFim));
      end;
      QRConhecimentoIR.Open;

      if (FRConhecimentoIR = nil) then
        FRConhecimentoIR := TFRConhecimentoIR.Create(Application);

      //Cabeçalho Relatório
      //----------------------------
      FRConhecimentoIR.QRLFilialDestino.Caption := 'Filial Destino: ' + Trim(FConhecimentoParam.FmFilialDestino11.EdFilial.Text);
      FRConhecimentoIR.QRLTitulo.Caption := 'Relatório de Conhecimento IRF Cliente';
      FRConhecimentoIR.QRLFilial.Caption := 'Filial: ' + FConhecimentoParam.FmFilial11.EdFilial.Text;
      FRConhecimentoIR.QRLPeriodo.Caption := 'Período entre ' + wstrDTInicio + ' até ' + wstrDTFim;
      //----------------------------

      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRConhecimentoIR.QRPrimario.Preview
      else
        FRConhecimentoIR.QRPrimario.Print;
      QRConhecimentoIR.Close;
    end;
  end;
end;

procedure TFConhecimentoCad.RelConhecimentoINSSRetido1Click(
  Sender: TObject);
begin
  inherited;
  if FConhecimentoParam = nil then
    FConhecimentoParam := TFConhecimentoParam.Create(Application);
  FConhecimentoParam.PGRelatorio.Pages[14].TabVisible := True;
  if FConhecimentoParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FConhecimentoParam.FmFilial15.MeFilial.Text), 'CONHECIMENTO');
    with DMConhecimento do
    begin
      QRConhecimentoValorRetido.Close;

      //Frames---------------------------
      if (Trim(FConhecimentoParam.FmFilial15.MeFilial.Text) <> '') then
        QRConhecimentoValorRetido.SetVariable('FILIAL', Trim(FConhecimentoParam.FmFilial15.MeFilial.Text))
      else
        QRConhecimentoValorRetido.SetVariable('FILIAL', null);
      if (Trim(FConhecimentoParam.FmProprietario15.MeProprietario.Text) <> '') then
        QRConhecimentoValorRetido.SetVariable('PROPRIETARIO', Trim(FConhecimentoParam.FmProprietario15.MeProprietario.Text))
      else
        QRConhecimentoValorRetido.SetVariable('PROPRIETARIO', null);
      if (Trim(FConhecimentoParam.FmFinalidade15.MeFinalidade.Text) <> '') then
        QRConhecimentoValorRetido.SetVariable('FINALIDADE', Trim(FConhecimentoParam.FmFinalidade15.MeFinalidade.Text))
      else
        QRConhecimentoValorRetido.SetVariable('FINALIDADE', null);
      if (Trim(FConhecimentoParam.FmFilialDestino15.MeFilial.Text) <> '') then
        QRConhecimentoValorRetido.SetVariable('FILIAL_DESTINO', Trim(FConhecimentoParam.FmFilialDestino15.MeFilial.Text))
      else
        QRConhecimentoValorRetido.SetVariable('FILIAL_DESTINO', null);
      //---------------------------------

      QRConhecimentoValorRetido.SetVariable('DT_INICIAL', Trim(FConhecimentoParam.Me15DtInicial.Text));
      QRConhecimentoValorRetido.SetVariable('DT_FINAL', Trim(FConhecimentoParam.Me15DtFinal.Text));

      QRConhecimentoValorRetido.Open;

      if (FRConhecimentoValorRetido = nil) then
        FRConhecimentoValorRetido := TFRConhecimentoValorRetido.Create(Application);

      //Cabeçalho Relatório
      //----------------------------
      FRConhecimentoValorRetido.QRLFilialDestino.Caption := 'Filial Destino: ' + Trim(FConhecimentoParam.FmFilialDestino15.EdFilial.Text);
      FRConhecimentoValorRetido.QRLbFilial.Caption := 'Filial: ' + FConhecimentoParam.FmFilial15.EdFilial.Text + 'Finalidade: ' + FConhecimentoParam.FmFinalidade15.EdFinalidade.Text;
      FRConhecimentoValorRetido.QRLbPeriodo.Caption := 'Período entre ' + FConhecimentoParam.Me15DtInicial.Text +
        ' até ' + FConhecimentoParam.Me15DtFinal.Text;
      //----------------------------

      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRConhecimentoValorRetido.QRPrimario.Preview
      else
        FRConhecimentoValorRetido.QRPrimario.Print;
      QRConhecimentoValorRetido.Close;
    end;
  end;
end;

procedure TFConhecimentoCad.BtCadastroDescargaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
  begin
    if DMConhecimento.DSConhecimentoAlt.State in [DsBrowse] then
      DMConhecimento.DSConhecimentoAlt.Edit;
    DMConhecimento.QConhecimentoCadCod_Cadastro_Descarga.value := DMCadastro.QCadastroConsCod_Cadastro.value;
  end
end;

procedure TFConhecimentoCad.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if (Trim(DbEdit3.Text) = '402') or
    (Trim(DbEdit3.Text) = '407') or
    (Trim(DbEdit3.Text) = '421') then
  begin
    Label2.Caption := 'Destinatário';
    Label12.Caption := 'Emitente';
  end
  else
  begin
    Label2.Caption := 'Cliente';
    Label12.Caption := 'Motorista';
  end;
end;

procedure TFConhecimentoCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueCons = nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  if FEmbarqueCons.ShowModal = mrOk then
  begin
    if DMConhecimento.DSConhecimentoAlt.State in [DsBrowse] then
      DMConhecimento.DSConhecimentoAlt.Edit;
    DMConhecimento.QConhecimentoAltCod_Embarque.Value := DMEmbarque.QEmbarqueConsCOD_EMBARQUE.Value;
  end;

end;

procedure TFConhecimentoCad.SbFilialDestinoClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    DMConhecimento.QConhecimentoCadCod_Filial_Destino.value := DMFilial.QFilialConsCod_Filial.value;

end;

procedure TFConhecimentoCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DmParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
  begin
    Label55.Visible := False;
    DBEdit55.Visible := False;
    SbFilialDestino.Visible := False;
    DBDirceu3.Visible := False;
  end;
  bib.addControleCharCase(dbedit89, Self.Name);
end;

procedure TFConhecimentoCad.DBLCCstPisCloseUp(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    if QCstpisCOD_CST_PIS.Value = '' then
      QConhecimentoCadCOD_CST_PIS.Clear;
  end;
end;

procedure TFConhecimentoCad.DBLCCstCofinsCloseUp(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    if QCstCofinsCOD_CST_COFINS.Value = '' then
      QConhecimentoCadCOD_CST_COFINS.Clear;
  end;
end;

procedure TFConhecimentoCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  with DMParamSistema, DMConhecimento do
  begin
    if QParamSistema.State = dsInactive then
      QParamSistema.Open;
    if not QParamSistemaCOD_CST_PIS_FRETE.IsNull then
    begin
      QConhecimentoCadCOD_CST_PIS.Value :=
        QParamSistemaCOD_CST_PIS_FRETE.Value;
      DBLCCstPis.KeyValue := QParamSistemaCOD_CST_PIS_FRETE.Value;
    end;
    if not QParamSistemaCOD_CST_COFINS_FRETE.IsNull then
    begin
      QConhecimentoCadCOD_CST_COFINS.Value :=
        QParamSistemaCOD_CST_COFINS_FRETE.Value;
      DBLCCstCofins.KeyValue := QParamSistemaCOD_CST_COFINS_FRETE.Value;
    end;
  end;
end;

procedure TFConhecimentoCad.DBEdit56Exit(Sender: TObject);
begin
  inherited;
  bib.setModelo(DMNotaEntrada.QNotaEntrada, lblModelo);
end;

procedure TFConhecimentoCad.btImportaCteClick(Sender: TObject);
var
  od: TOpenDialog;
  xml: TXmlDocument;
  nodeCte: IXMLNode;
  nodeInfCte: IXMLNode;
  chaveAcesso: String;
begin
  inherited;
  chaveAcesso := '';
  xml := TXmlDocument.Create(Application);
  od := TOpenDialog.Create(Application);
  od.Filter := 'XML files|*.xml';
  if od.Execute then
  begin
    xml.LoadFromFile(od.FileName);
    if xml.DocumentElement.NodeName <> 'cteProc' then
    begin
      MessageDlg('Erro: Tag cteProc inexistente neste documento.' +
      ' Este documento não está em conformidade com o Layout da Distribuição CT-e.' +
      ' Entre em contato com o seu fornecedor.',
      mtError, [mbOk],0);
    end;
    nodeCte := xml.DocumentElement.ChildNodes['CTe'];
    if NodeCte <> Nil then
      nodeInfCte := NodeCte.ChildNodes['infCte'];
    chaveAcesso := nodeInfCte.GetAttributeNS('Id', '');
  end;
  DMConhecimento.QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value := chaveAcesso;  
end;

end.

