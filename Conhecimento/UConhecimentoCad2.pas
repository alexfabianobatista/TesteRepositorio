unit UConhecimentoCad2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, OracleData, OraTeste, DBDirceu, variants, ActnList,
  DBPanel, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TFConhecimentoCad2 = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label31: TLabel;
    Panel3: TPanel;
    Panel2: TPanel;
    DBEdit18: TDBEdit;
    ImpressoCpiaConhecimento1: TMenuItem;
    ImpressoConhecimentocConhtrato1: TMenuItem;
    ImpressoConhecimentosContrato1: TMenuItem;
    RelConhecimento1: TMenuItem;
    RelConhecimentoCarga1: TMenuItem;
    RelConhecimentoIRF1: TMenuItem;
    RelConhecimentoINSSRetido1: TMenuItem;
    Operaes1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    Confirma1: TMenuItem;
    VoltarConfirmao1: TMenuItem;
    Cancela1: TMenuItem;
    VoltarCancelamento1: TMenuItem;
    SBNotaCorrecao: TSpeedButton;
    EmitirMICDTA1: TMenuItem;
    DBEdit37: TDBEdit;
    DBPNumNota: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel8: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel9: TDBPanel;
    DBPanel10: TDBPanel;
    DBPanel11: TDBPanel;
    DBPanel12: TDBPanel;
    DBPanel13: TDBPanel;
    DBPanel14: TDBPanel;
    DBPanel15: TDBPanel;
    DBPanel16: TDBPanel;
    DBPanel17: TDBPanel;
    DBPanel18: TDBPanel;
    DBPanel19: TDBPanel;
    DBPanel20: TDBPanel;
    DBPanel21: TDBPanel;
    DBPanel22: TDBPanel;
    DBPanel23: TDBPanel;
    DBPanel24: TDBPanel;
    DBPanel25: TDBPanel;
    DBPanel26: TDBPanel;
    DBPanel27: TDBPanel;
    DBPanel28: TDBPanel;
    DBPanel29: TDBPanel;
    DBPanel30: TDBPanel;
    DBPanel31: TDBPanel;
    DBPanel32: TDBPanel;
    DBPanel33: TDBPanel;
    DBPanel34: TDBPanel;
    DBPanel35: TDBPanel;
    DBPanel36: TDBPanel;
    DBPanel37: TDBPanel;
    DBPanel38: TDBPanel;
    DBPanel39: TDBPanel;
    DBPanel40: TDBPanel;
    DBPanel41: TDBPanel;
    DBPanel42: TDBPanel;
    DBPanel43: TDBPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBNotaCorrecaoClick(Sender: TObject);
    procedure DBEdit36Change(Sender: TObject);
    procedure RelConhecimento1Click(Sender: TObject);
    procedure RelConhecimentoCarga1Click(Sender: TObject);
    procedure RelConhecimentoIRF1Click(Sender: TObject);
    procedure RelConhecimentoINSSRetido1Click(Sender: TObject);
    procedure ImpressoCpiaConhecimento1Click(Sender: TObject);
    procedure ImpressoConhecimentocConhtrato1Click(Sender: TObject);
    procedure ImpressoConhecimentosContrato1Click(Sender: TObject);
    procedure Confirma1Click(Sender: TObject);
    procedure VoltarConfirmao1Click(Sender: TObject);
    procedure Cancela1Click(Sender: TObject);
    procedure VoltarCancelamento1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure EmitirMICDTA1Click(Sender: TObject);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel10DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel11DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel22DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel24DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel26DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel31DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel28DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel27DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel33CodigoExit(Sender: TObject);
    procedure DBPanel36DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel37DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel40DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel43DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure FormCreate(Sender: TObject);
    procedure DBPanel23CodigoChange(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimentoCad2: TFConhecimentoCad2;

implementation

uses UConhecimento_cl, UConhecimentoCad, UNotaSaidaCons, UUsuario_cl,
  UNotaSaida_cl, UNotaCorrecao, UNotaCorrecao_cl, UOracle_cl,
  UNotaEntradaCons, USerieCons, UContratoVenda_Cons, UOperacaoCons,
  UFilialCons, UCadastroCons, UVeiculoConhecimentoCons, UTributacaoCons, UMensagemCons,
  UConhecimentoParam, UNotaEntrada_cl, USerie_cl, Ucontrato_cl,
  UOperacao_cl, UFilial_cl, UCadastro_cl, UVeiculoConhecimento_cl,
  UTributacao_cl, UMensagem_cl, URConhecimentoIRF, URConhecimentoCarga,
  URConhecimentoIR, URConhecimentoValorRetido, UBiblioteca,
  URConhecimentoContrato, URConhecimentoSContrato, UConhecimento_CP,
  UParamSistema_cl, UBaseCalculoIRF_cl, UContasPagar_cl, UPlanilha_cl,
  UBancoAgencia_cl, UProdutoCons, UProduto_cl, UConhecimentoCons,
  UContasReceber_cl, UConhecimento_CR;

{$R *.dfm}

procedure TFConhecimentoCad2.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
//  if DSPrimario.State in [Dsinsert, DsEdit] then
//  begin
//    FConhecimentoCad2.SBFilial.enabled := True;
//    FConhecimentoCad2.SBCadastro.enabled := True;
//    FConhecimentoCad2.SBOperacao.enabled := True;
//    FConhecimentoCad2.SBPlaca.enabled := True;
//    FConhecimentoCad2.SBPlacaReb.enabled := True;
//    FConhecimentoCad2.SBMotorista.enabled := True;
//    FConhecimentoCad2.SBTributacao.enabled := True;
//    FConhecimentoCad2.SBSerie.enabled := True;
//    FConhecimentoCad2.SBMensagem.enabled := True;
//    FConhecimentoCad2.SBNotaCorrecao.Enabled := False;
//    FConhecimentoCad2.SBProduto.Enabled := True;
//    FConhecimentoCad2.SBCadastroRemetente.Enabled := True;
//    FConhecimentoCad2.SBCadastroPagador.Enabled := True;
//    FConhecimentoCad2.SBCadastroConsig.Enabled := True;
//  end
//  else
//  begin
//    FConhecimentoCad2.SBFilial.enabled := false;
//    FConhecimentoCad2.SBCadastro.enabled := false;
//    FConhecimentoCad2.SBOperacao.enabled := false;
//    FConhecimentoCad2.SBPlaca.enabled := false;
//    FConhecimentoCad2.SBPlacaReb.enabled := false;
//    FConhecimentoCad2.SBMotorista.enabled := false;
//    FConhecimentoCad2.SBTributacao.enabled := false;
//    FConhecimentoCad2.SBSerie.enabled := false;
//    FConhecimentoCad2.SBMensagem.enabled := false;
//    FConhecimentoCad2.SBNotaCorrecao.Enabled := True;
//    FConhecimentoCad2.SBProduto.Enabled := False;
//    FConhecimentoCad2.SBCadastroRemetente.Enabled := False;
//    FConhecimentoCad2.SBCadastroPagador.Enabled := False;
//    FConhecimentoCad2.SBCadastroConsig.Enabled := False;
//  end;
  MMCadSimples.Items[2].Enabled := DSPrimario.DataSet.State = dsBrowse;
end;

procedure TFConhecimentoCad2.SBNotaCorrecaoClick(Sender: TObject);
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

procedure TFConhecimentoCad2.DBEdit36Change(Sender: TObject);
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

procedure TFConhecimentoCad2.RelConhecimento1Click(Sender: TObject);
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

procedure TFConhecimentoCad2.RelConhecimentoCarga1Click(Sender: TObject);
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
        0:
          begin
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
        1:
          begin
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
      else if FConhecimentoParam.RG8TipoNota.ItemIndex = 1 then
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

procedure TFConhecimentoCad2.RelConhecimentoIRF1Click(Sender: TObject);
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

procedure TFConhecimentoCad2.RelConhecimentoINSSRetido1Click(
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

procedure TFConhecimentoCad2.ImpressoCpiaConhecimento1Click(
  Sender: TObject);
var
  wCont: Integer;
  wUsuario, wExtenso: string;
  wDesconto: Real;
  wRemetente, wPagador, wProduto, wMotorista, wPorta: string;
  wAno, wMes, wDia: Word;
begin
  inherited;
  with DMConhecimento do
  begin
    QRConhecimento.close;
    QRConhecimento.setVariable('Cod_Conhecimento', QConhecimentoCadCod_Conhecimento.value);
    QRConhecimento.open;
    DmUsuario.Checar_Filial_Usuario(Trim(QRConhecimentoCOD_FILIAL.Text), 'CONHECIMENTO');
    wDesconto := (QRConhecimentoPERC_DESCONTO_FRETE.Value / 100) * QRConhecimentoVAL_FRETE.Value;
    if Imp = nil then
      Imp := TImp.Create;
    wPorta := DMOracle.FastSelect('DESC_LPT_CONHECIMENTO', 'TB_FILIAL','COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));
    if wPorta = 'LPT3' then
      Imp.AbreImpressora_Lpt3
    else if wPorta = 'LPT2' then
      Imp.AbreImpressora_Lpt2
    else
      Imp.AbreImpressora;

    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 80); //-----configurar pagina

      DecodeDate(QRConhecimentoDT_EMISSAO.Value, wAno, wMes, wDia);

      wCont := 2;
      Imp.WriteXY(16, wCont, FormatFloat('00', wDia));
      Imp.WriteXY(17.8, wCont, FormatFloat('00', wMes));
      Imp.WriteXY(19.2, wCont, FormatFloat('0000', wAno));

      inc(wCont, 2);
      Imp.WriteXY(4, wCont, QRConhecimentoDESC_OPERACAO.Value);
      if QRConhecimentoCOD_ESTADO.Value <> QRConhecimentoUF_DESTINATARIO.Value then
         Imp.WriteXY(10, wCont, QRConhecimentoNAT_INTERESTADUAL_NOVO.Text)
      else
         Imp.WriteXY(10, wCont, QRConhecimentoNAT_ESTADUAL_NOVO.Text);
      Imp.WriteXY(15, wCont, QRConhecimentoDESC_CIDADE.Value);

      inc(wCont);
      Imp.WriteXY(4, wCont, QRConhecimentoNOME_REMETENTE.Value);

      Inc(WCont, 2);
      Imp.WriteXY(4, wCont, QRConhecimentoDESC_ENDERECO_REMETENTE.Value);
      Imp.WriteXY(13, wCont, QRConhecimentoDESC_CIDADE_REMETENTE.Value);
      Imp.WriteXY(19, wCont, QRConhecimentoCOD_ESTADO_REMETENTE.Value);

      Inc(WCont, 2);
      Imp.WriteXY(4, wCont, QRConhecimentoNUM_INSCRICAO_REMETENTE.Value);
      Imp.WriteXY(12, wCont, QRConhecimentoNUM_CGC_CPF_REMETENTE.Value);

      Inc(WCont);
      Imp.WriteXY(4, wCont, QRConhecimentoNOME.Value);

      Inc(WCont, 2);
      Imp.WriteXY(4, wCont, QRConhecimentoENDERECO_DESTINATARIO.Value);
      Imp.WriteXY(13, wCont, QRConhecimentoDESC_CIDADE_DESTINATARIO.Value);
      Imp.WriteXY(19, wCont, QRConhecimentoUF_DESTINATARIO.Value);

      Inc(WCont, 2);
      Imp.WriteXY(4, wCont, QRConhecimentoNUM_INSCRICAO.Value);
      Imp.WriteXY(12, wCont, QRConhecimentoCGC_DESTINATARIO.Value);

      Inc(WCont, 19);
      Imp.WriteXY(2, wCont, Copy(QRConhecimentoDESC_PRODUTO.Value, 1, 22));
//      Imp.WriteXY(6.5, wCont, FormatFloat('000000', QRConhecimentoNUM_NOTA.Value));
      Imp.WriteXY(6.2, wCont, QRConhecimentoDESC_NOTAS.Value);
      Imp.WriteXY(10.5, wCont, FormatFloat('#,###,##0.00', QRConhecimentoVAL_NOTA.Value));
      Imp.WriteXY(13.8, wCont, FormatFloat('#,###,###.##', QRConhecimentoQT_NOTA.Value));
      Imp.WriteXY(15.8, wCont, FormatFloat('#,###,###.##', QRConhecimentoNUM_VOLUME.Value));
      Imp.WriteXY(17, wCont, QRConhecimentoDESC_ESPECIE_VOLUME.Value);

      Inc(WCont, 5);
      Imp.WriteXY(2.5, wCont, FormatFloat('#,###,###.##', QRConhecimentoQT_NOTA.Value));
      Imp.WriteXY(6, wCont, FormatFloat('#,###,##0.00', QRConhecimentoVAL_FRETE.Value));
      Imp.WriteXY(9, wCont, FormatFloat('#,###,##0.00', 0));
      Imp.WriteXY(11.3, wCont, FormatFloat('#,###,##0.00', 0));
      Imp.WriteXY(14.3, wCont, FormatFloat('#,###,##0.00', QRConhecimentoVAL_PEDAGIO.Value));
      Imp.WriteXY(17.4, wCont, FormatFloat('#,###,##0.00', QRConhecimentoVAL_DESCARGA.Value));

      Inc(wCont, 3);
      Imp.WriteXY(2.5, wCont, FormatFloat('#,###,##0.00', QRConhecimentoVAL_FRETE.Value + QRConhecimentoVAL_PEDAGIO.Value + QRConhecimentoVAL_DESCARGA.Value));
      If QRConhecimentoVAL_ICMS.Value > 0 Then
         Imp.WriteXY(8, wCont, FormatFloat('#,###,##0.00', QRConhecimentoVAL_FRETE.Value));
      Imp.WriteXY(11.5, wCont, FormatFloat('#,###,##0.00', QRConhecimentoPERC_ALIQUOTA.Value));
      Imp.WriteXY(15, wCont, FormatFloat('#,###,##0.00', QRConhecimentoVAL_ICMS.Value));
      Imp.WriteXY(18.5, wCont, FormatFloat('#,###,##0.00', QRConhecimentoVAL_TARIFA.Value));

      Inc(wCont, 2);
      Imp.WriteXY(3.3, wCont, QRConhecimentoDESC_LOCAL_COLETA.Value);
      Imp.WriteXY(10.3, wCont, QRConhecimentoDESC_LOCAL_ENTREGA.Value);
      Imp.WriteXY(17.4, wCont, QRConhecimentoDESC_SEGURADORA.Value);

      Inc(wCont);
      Imp.WriteXY(2.5, wCont, QRConhecimentoDESC_OBS.Value + '. ' + QRConhecimentoDESC_OBS2.Value);

      Inc(wCont, 4);
      Imp.WriteXY(3.5, wCont, QRConhecimentoDESC_PLACA.Value);
      Imp.WriteXY(18, wCont, QRConhecimentoDESC_TIPO_VEICULO.Value);

      Inc(wCont, 1);
      Imp.WriteXY(3, wCont, QRConhecimentoENDERECO_PROPRIETARIO.Value);
      Imp.WriteXY(11.7, wCont, QRConhecimentoCIDADE_PROPRIETARIO.Value);
      Imp.WriteXY(19, wCont, QRConhecimentoUF_PROPRIETARIO.Value);

      Inc(wCont, 2);
      Imp.WriteXY(3, wCont, QRConhecimentoPROPRIETARIO.Value);
      Imp.WriteXY(14, wCont, QRConhecimentoNUM_CNPJ_CGC.Value);

      Inc(wCont);
      Imp.WriteXY(3, wCont, QRConhecimentoNOME_MOTORISTA.Value);
      Imp.WriteXY(12.5, wCont, QRConhecimentoNUM_CPF_MOTORISTA.Value);
      Imp.WriteXY(17, wCont, QRConhecimentoDESC_INSCRICAO_INSS_MOTORISTA.Value);

      Inc(wCont, 2);
      Imp.WriteXY(3, wCont, QRConhecimentoENDERECO_MOTORISTA.Value);

      Inc(wCont, 3);
      Imp.WriteXY(11.8, wCont, QRConhecimentoDESC_CIDADE.Value);
      Imp.WriteXY(14.2, wCont, FormatFloat('00', wDia));
      Imp.WriteXY(15.5, wCont, FormatDateTime('MMMM', QRConhecimentoDT_EMISSAO.Value));
      Imp.WriteXY(18, wCont, FormatFloat('0000', wAno));

      Imp.SaltaPagina;
      Imp.FechaImpressora; // Finaliza os serviços de Impressao
    end
    else
    begin
      Imp.ConfiguraImpressora('CONDENSADO_ON', 'SEXTOS', 80); //-----configurar pagina

      wCont := 3;
      Imp.WriteXY(17.5, wCont, FormatFloat('000000', QRConhecimentoNUM_CONHECIMENTO.Value));
      Inc(wCont);
      Imp.WriteXY(13, wCont, QRConhecimentoDESC_OPERACAO.Value);
      if QRConhecimentoCOD_ESTADO.Value <> QRConhecimentoUF_DESTINATARIO.Value then
        Imp.WriteXY(19, wCont, QRConhecimentoNat_InterEstadual_Novo.Text)
      else
        Imp.WriteXY(19, wCont, QRConhecimentoNat_Estadual_Novo.Text);
      Inc(WCont);
      Imp.WriteXY(13, wCont, DateToStr(QRConhecimentoDT_EMISSAO.Value));
      Inc(wCont, 3);

      if QRConhecimentoCOD_CADASTRO_REMETENTE.Text = '' then
        wRemetente := '0'
      else
        wRemetente := QRConhecimentoCOD_CADASTRO_REMETENTE.Text;
      if QRConhecimentoCOD_CADASTRO_PAGADOR.Text = '' then
        wPagador := '0'
      else
        wPagador := QRConhecimentoCOD_CADASTRO_PAGADOR.Text;
      if QRConhecimentoCOD_PRODUTO.Text = '' then
        wProduto := '0'
      else
        wProduto := QRConhecimentoCOD_PRODUTO.Text;
      if QRConhecimentoCOD_MOTORISTA.Text = '' then
        wMotorista := '0'
      else
        wMotorista := QRConhecimentoCOD_MOTORISTA.Text;

      Imp.WriteXY(2, wCont, DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + wRemetente));
      Imp.WriteXY(12, wCont, QRConhecimentoNOME.Value);

      Inc(WCont);
      Imp.WriteXY(2, wCont, DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO', 'COD_CADASTRO = ' + wRemetente));
      Imp.WriteXY(12, wCont, QRConhecimentoENDERECO_DESTINATARIO.Value);

      Inc(WCont);
      Imp.WriteXY(2, wCont, DMOracle.BuscaNome('SELECT TB_CIDADE.DESC_CIDADE FROM TB_CIDADE, TB_CADASTRO',
        'TB_CADASTRO.COD_CIDADE = TB_CIDADE.COD_CIDADE AND TB_CADASTRO.COD_CADASTRO = ' + wRemetente));
      Imp.WriteXY(8.5, wCont, DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO', 'COD_CADASTRO = ' + wRemetente));
      Imp.WriteXY(12, wCont, QRConhecimentoCIDADE_DESTINATARIO.Value);
      Imp.WriteXY(18.5, wCont, QRConhecimentoUF_DESTINATARIO.Value);

      Inc(WCont);
      Imp.WriteXY(2, wCont, DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' + wRemetente));
      Imp.WriteXY(7.5, wCont, DMOracle.BuscaNome('SELECT NUM_INSCRICAO FROM TB_CADASTRO', 'COD_CADASTRO = ' + wRemetente));
      Imp.WriteXY(12, wCont, QRConhecimentoCGC_DESTINATARIO.Value);
      Imp.WriteXY(18, wCont, QRConhecimentoNUM_INSCRICAO.Value);

      Inc(WCont, 5);
      Imp.WriteXY(0.8, wCont, Bib.NumToTexto(QRConhecimentoVAL_TARIFA.Value, 2, 5));
      if QRConhecimentoIND_PAGAR_PAGO.Value = 'PAGAR' then
        Imp.WriteXY(3.2, wCont, 'X')
      else
        Imp.WriteXY(6, wCont, 'X');

      Inc(wCont, 3);
      Imp.WriteXY(2.5, wCont, DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + wPagador));

      Inc(wCont, 2);
      Imp.WriteXY(2.5, wCont, DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO', 'COD_CADASTRO = ' + wRemetente));
      Imp.WriteXY(10.5, wCont, DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' + wRemetente));
      Imp.WriteXY(16.5, wCont, DMOracle.BuscaNome('SELECT NUM_INSCRICAO FROM TB_CADASTRO', 'COD_CADASTRO = ' + wRemetente));

      Inc(WCont, 3);
      Imp.WriteXY(0.8, wCont, Copy(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + wProduto), 1, 22));
      Imp.WriteXY(4.5, wCont, QRConhecimentoNUM_NOTA.Text);
      Imp.WriteXY(6.5, wCont, Bib.NumToTexto(QRConhecimentoVAL_NOTA.Value, 2, 11));
      Imp.WriteXY(9.2, wCont, Bib.NumToTexto(QRConhecimentoQT_NOTA.Value, 0, 11));
      Imp.WriteXY(11, wCont, Bib.NumToTexto(QRConhecimentoQT_NOTA.Value, 0, 11));
      Imp.WriteXY(14, wCont, DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO', 'COD_PRODUTO = ' + wProduto));

      Inc(WCont, 5);
      Imp.WriteXY(2, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value, 2, 11));
      Imp.WriteXY(6.6, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value, 2, 1));
      Imp.WriteXY(9, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value, 2, 1));
      Imp.WriteXY(10.5, wCont, Bib.NumToTexto(QRConhecimentoVAL_PEDAGIO.Value, 2, 11));
      Imp.WriteXY(13, wCont, Bib.NumToTexto((QRConhecimentoVAL_FRETE.Value + QRConhecimentoVAL_PEDAGIO.Value), 2, 11));
      Imp.WriteXY(15.8, wCont, Bib.NumToTexto(QRConhecimentoPERC_ALIQUOTA.Value, 0, 6));
      Imp.WriteXY(17.5, wCont, Bib.NumToTexto(QRConhecimentoVAL_ICMS.Value, 2, 11));

      Inc(wCont, 3);
      Imp.WriteXY(2.6, wCont, QRConhecimentoDESC_LOCAL_COLETA.Value);
      Imp.WriteXY(12.5, wCont, QRConhecimentoDESC_LOCAL_ENTREGA.Value);
      Inc(wCont);
      Inc(wCont, 4);
      Imp.WriteXY(18, wCont, Bib.NumToTexto((QRConhecimentoVAL_FRETE.Value + QRConhecimentoVAL_PEDAGIO.Value - wDesconto), 2, 11));

      Inc(wCont, 3);
      Imp.WriteXY(4, wCont, QRConhecimentoDESC_VEICULO.Value);
      Inc(wCont, 2);
      Imp.WriteXY(3, wCont, QRConhecimentoDESC_PLACA.Value);
      Imp.WriteXY(5.5, wCont, QRConhecimentoDesc_Cidade_Veiculo.Value);
      Imp.WriteXY(9.3, wCont, QRConhecimentoUF_Proprietario.Value);
      Inc(WCont, 2);
      wExtenso := Bib.Extenso(QRConhecimentoQT_NOTA.Value * QRConhecimentoVAL_TARIFA_PROPRIETARIO.Value / 1000, 'REAL');
      Imp.WriteXY(2.3, wCont, Copy(wExtenso, 1, 50));
      wUsuario := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
      Imp.WriteXY(17.4, wCont, wUsuario);

      Inc(WCont, 1);
      Imp.WriteXY(1, wCont, Copy(wExtenso, 51, Length(wExtenso) - 50));

      Inc(WCont, 10);
      Imp.WriteXY(12.5, wCont, QRConhecimentoDT_EMISSAO.Text);
      Inc(WCont, 2);
      Imp.WriteXY(2, wCont, QRConhecimentoProprietario.Value);
      Imp.WriteXY(9.2, wCont, QRConhecimentoNUM_CNPJ_CGC.Value);
      Inc(WCont, 2);
      Imp.WriteXY(2, wCont, QRConhecimentoEndereco_Proprietario.Value);
      Imp.WriteXY(8, wCont, QRConhecimentoCidade_Proprietario.Value);
      Imp.WriteXY(11, wCont, QRConhecimentoUF_Proprietario.Value);
      Inc(WCont, 2);
      Imp.WriteXY(2, wCont, QRConhecimentodesc_motorista.Value);
      Imp.WriteXY(10, wCont, QRConhecimentodesc_carteira.Value);
      Imp.WriteXY(13.2, wCont, Bib.NumToTexto(QRConhecimentoQT_NOTA.Value, 0, 8));
      Imp.WriteXY(16, wCont, Bib.NumToTexto(QRConhecimentoVAL_TARIFA_PROPRIETARIO.Value, 2, 5));
      Imp.WriteXY(17.5, wCont, Bib.NumToTexto(QRConhecimentoQT_NOTA.Value *
        QRConhecimentoVAL_TARIFA_PROPRIETARIO.Value /
        1000, 2, 11));
      Inc(WCont);
      Imp.WriteXY(17.5, wCont, Bib.NumToTexto(QRConhecimentoVAL_PEDAGIO.Value, 2, 11));
      Inc(WCont);
      Imp.WriteXY(1.4, wCont, Copy(DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO',
        'COD_CADASTRO = ' + wMotorista), 1, 26));
      //      Imp.WriteXY(7.3,wCont,QRConhecimento);
      Imp.WriteXY(6.5, wCont, DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO', 'COD_CADASTRO = ' + wMotorista));
      Imp.WriteXY(11, wCont, DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO', 'COD_CADASTRO = ' + wMotorista));
      Imp.WriteXY(17.5, wCont, Bib.NumToTexto(QRConhecimentoVAL_IRF.Value, 2, 11));
      Inc(WCont);
      Imp.WriteXY(17.5, wCont, Bib.NumToTexto(QRConhecimentoVAL_ADIANTAMENTO.Value, 2, 11));
      Inc(WCont);
      Imp.WriteXY(2, wCont, QRConhecimentoDESC_VEICULO.Value);
      Imp.WriteXY(6.5, wCont, QRConhecimentoDESC_PLACA.Text);
      Imp.WriteXY(11, wCont, QRConhecimentoUF_PROPRIETARIO.Text);
      if wDesconto > 0 then
      begin
        Imp.WriteXY(12.5, wCont, '(-) Desconto:');
        Imp.WriteXY(17.5, wCont, Bib.NumToTexto(wDesconto, 2, 11));
      end;
      Inc(WCont, 8);
      Imp.WriteXY(17.5, wCont, Bib.NumToTexto(QRConhecimentoVAL_FRETE.Value -
        wDesconto -
        QRConhecimentoVAL_IRF.Value -
        QRConhecimentoVAL_SEST_SENAT.Value -
        QRConhecimentoVal_Adiantamento.Value -
        QRConhecimentoVAL_INSS_FORNECEDOR.Value -
        QRConhecimentoVAL_FALTA_MERCADORIA_CHEGADA.Value, 2, 11));

      Imp.SaltaPagina;
      Imp.FechaImpressora; // Finaliza os serviços de Impressao
    end;
  end;
end;

procedure TFConhecimentoCad2.ImpressoConhecimentocConhtrato1Click(
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

procedure TFConhecimentoCad2.ImpressoConhecimentosContrato1Click(
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

procedure TFConhecimentoCad2.Confirma1Click(Sender: TObject);
var
  wFisica_Juridica, wVal_Inss, wDesc_Inss, wNumDoc, wContaCred, wContaDeb: string;
  wCodDoc, wCodHistorico, wVlrLancto, wCodCompl: Real;
  wFilial, wProprietario: Integer;
  wDtLancto, wData: TDateTime;
  wSaldo, wValor_Base, wValor_Base_1, wIRF, wSaldo_IRF, wVlInss_Pg, wVlInss: real;
  wMes, wAno, wDia: Word;
begin
  inherited;
  If DMConhecimento.QConhecimentoCadInd_Situacao.Value <> '1' Then
     Raise Exception.Create('Conhecimento está Confirmado ou Cancelado');

  wVlrLancto := 0;
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
      if FConhecimento_CR = nil then
         FConhecimento_CR := TFConhecimento_CR.Create(Application);
      wIrf := 0;
      with DMConhecimento do
      begin
        DMOperacao.QOperacao.Close;
        DMOperacao.QOperacao.SetVariable('PK', QConhecimentoCadCod_Operacao.Text);
        DMOperacao.QOperacao.Open;
        wVlInss := 0;
        wVlInss_Pg := 0;
        QConhecimentoCadVal_IRF.Value := 0;
        //          If QConhecimentoCadCOD_OPERACAO.Value <> 431 Then --> COMENTANDO CODIGO FIXO (CODIGO DO MOINHO)
        //          Begin
        wProprietario := StrToInt(DMOracle.BuscaNome('SELECT COD_PROPRIETARIO FROM TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + Chr(39) + QConhecimentoCadDesc_Placa.Value + Chr(39)));
        wFisica_Juridica := DMOracle.BuscaNome('SELECT IND_FISICA_JURIDICA FROM TB_PROPRIETARIO', 'COD_PROPRIETARIO = ' + IntToStr(wProprietario));
        DecodeDate(QConhecimentoCadDt_Emissao.Value, wAno, wMes, wDia);
        wData := StrToDate('01/' + (IntToStr(wMes)) + '/' + (IntToStr(wAno)));
        if wFisica_Juridica = 'F' then
        begin
          wDesc_Inss := DMOracle.BuscaNome('SELECT DESC_INSS FROM TB_PROPRIETARIO', 'COD_PROPRIETARIO = ' + IntToStr(wProprietario));
          if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'NUTRI' then
          if wDesc_Inss = '' then
            raise Exception.Create('Cadastro de Proprietário Sem Inscrição INSS');
          wVal_Inss := DMOracle.BuscaNome('SELECT SUM(VAL_INSS_FORNECEDOR) FROM TB_CONHECIMENTO,tb_veiculo_conhecimento,tb_proprietario',
            'tb_conhecimento.desc_placa = tb_veiculo_conhecimento.desc_placa and tb_veiculo_conhecimento.cod_proprietario = tb_proprietario.cod_proprietario ' +
            ' AND TB_CONHECIMENTO.IND_SITUACAO = ' + Chr(39) + '2' + Chr(39) +
            ' AND TB_PROPRIETARIO.COD_PROPRIETARIO = ' + IntToStr(wProprietario) +
            ' AND TB_CONHECIMENTO.COD_FILIAL = 13' + // COLOCADO A PEDIDO DO JOAO
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
        QConhecimentoCadVAL_INSS_FORNECEDOR.Value := wVlInss;
        if wFisica_Juridica = 'F' then
        begin
          QCalculaSaldo.Close;
          QCalculaSaldo.SetVariable('Cod_Proprietario', wProprietario);
          QCalculaSaldo.SetVariable('DT_Emissao_I', wData);
          QCalculaSaldo.SetVariable('DT_Emissao_F', DMOracle.UltimoDiaMes(QConhecimentoCadDt_Emissao.Value));
          QCalculaSaldo.Open;
          wSaldo := ((QCalculaSaldoSaldo.value + QConhecimentoCadVal_Frete.value) * 0.4) - wVlInss - wVlInss_Pg;
          //---------CALCULA SALDO IRF PAGO
          QCalculaIRFPago.Close;
          QCalculaIRFPago.SetVariable('Cod_Proprietario', wProprietario);
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
        //          end;
      end;
      if QConhecimentoCadIND_PAGAR_PAGO.Value <> 'PAGO' then
      begin //Solicitado pela Tânia - Friella: Quando for pago, não gerar contas a receber nem contas a pagar. Diego A. S. 10/09/2010
        if DMOperacao.QOperacaoIND_CONTA_PAGAR.Value = 'S' then
          If (FConhecimento_CP.ShowModal = MrOk) Then
            with DMContasPagar do
            begin
              QContasPagar_Mov.Close;
              QContasPagar_Cab.Close;
              QContasPagar_Cab.Open;
              QContasPagar_Mov.Open;
              QContasPagar_Cab.Insert;
              if Trim(FConhecimento_CP.MECodFinalidade.Text) <> '' then
                QContasPagar_cabCod_Finalidade.Value := StrToInt(Trim(FConhecimento_CP.MECodFinalidade.Text));
              if Trim(FConhecimento_CP.MECodBanco.Text) <> '' then
                QContasPagar_CabCOD_BANCO_AGENCIA.Value := StrToInt(Trim(FConhecimento_CP.MECodBanco.Text));
              if Trim(FConhecimento_CP.FmContaCorrente.MeContaCorrente.Text) <> '' then
                QContasPagar_CabCOD_CONTA_CORRENTE.Value := StrToInt(Trim(FConhecimento_CP.FmContaCorrente.MeContaCorrente.Text));
              if Trim(FConhecimento_CP.MECodDepartamento.Text) <> '' then
                QContasPagar_CabCOD_DEPARTAMENTO.Value := StrToInt(Trim(FConhecimento_CP.MECodDepartamento.Text));
              QContasPagar_CabCOD_CADASTRO.Value := QConhecimentoCadCod_Motorista.Value;
              QContasPagar_CabCOD_FILIAL.Value := QConhecimentoCadCOD_FILIAL.Value;
              QContasPagar_CabDESC_TIPO_DOCUMENTO.Value := 'FRE';
              QContasPagar_CabDT_EMISSAO.Value := QConhecimentoCadDT_EMISSAO.value;
              //            QContasPagar_CabDT_VENCIMENTO.Value:=QConhecimentoCadDT_Emissao.value;
              QContasPagar_CabDT_VENCIMENTO.Value := StrToDate(FConhecimento_CR.MEDtVencimento.Text);
              wVlrLancto := StrToFloat('0' + DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO',
                'COD_PRODUTO = ' + QConhecimentoCadCOD_PRODUTO.Text)); // armazenando o numero da embalagem do produto
              wVlrLancto := ((QConhecimentoCadVAL_TARIFA_PROPRIETARIO.Value *
                QConhecimentoCadQT_NOTA.Value / wVlrLancto) +
                QConhecimentoCadVAL_PEDAGIO.Value -
                QConhecimentoCadVAL_ADIANTAMENTO.Value -
                QConhecimentoCadVAL_SEST_SENAT.Value -
                QConhecimentoCadVAL_INSS_FORNECEDOR.Value +
                QConhecimentoCadVAL_DESCARGA.Value);
              //            wVlrLancto := (QConhecimentoCadVAL_FRETE.Value +
              //                                               QConhecimentoCadVAL_SEGURO.Value +
              //                                               QConhecimentoCadVAL_PEDAGIO.Value  -
              //                                               QConhecimentoCadVAL_IRF.Value - QConhecimentoCadVAL_SEST_SENAT.Value -
              //                                               QConhecimentoCadVAL_INSS_FORNECEDOR.Value -
              //                                               QConhecimentoCadVAL_FALTA_MERCADORIA_CHEGADA.Value -
              //                                               wDesconto);
              //            If (QConhecimentoCadCod_Operacao.Value = 421) Or  // isso foi a daiana que passou
              //               (QConhecimentoCadCod_Operacao.Value = 402) Or
              //               (QConhecimentoCadCod_Operacao.Value = 407) Then
              //               wVlrLancto := wVlrLancto + QConhecimentoCadVal_Pedagio.Value;
              QContasPagar_CabVAL_TITULO.Value := wVlrLancto;
              QContasPagar_CabNUM_TITULO.Value := QConhecimentoCadNUM_CONHECIMENTO.Value;
              QContasPagar_CabIND_ACEITE.Value := 'NAO';
              QContasPagar_CabIND_SITUACAO.Value := 'ABERTO';
              QContasPagar_CabDESC_OBSERVACAO.Value := 'Referente ao Conhecimento nr.' +
                QConhecimentoCadNUM_CONHECIMENTO.Text + ' e Nf. Nr.' + QConhecimentoCadNum_Nota.Text;
              QCOntasPagar_Cab.Post;
              QConhecimentoCadCOD_CONTA_PAGAR_CAB.Value := QContasPagar_CabCOD_CONTA_PAGAR_CAB.Value;
              QContasPagar_Mov.Close;
              QContasPagar_cab.Close;
            end
          Else
            Begin
              DMConhecimento.QConhecimentoCad.Cancel;
              DMContasPagar.QContasPagar_Cab.Cancel;
              DMContasPagar.QContasPagar_Mov.Cancel;
              DMOracle.DBCemapa.Rollback;
              Exit;
            End;
        If (FConhecimento_CR.ShowModal = MrOk) Then
          with DMContasReceber do //Gerar Contas a Receber do cliente pagador
          begin
            QContasReceber_Mov.Close;
            QContasReceber_Cab.Close;
            QContasReceber_Cab.Open;
            QContasReceber_Mov.Open;
            QContasReceber_Cab.Insert;
            if Trim(FConhecimento_CR.FmFinalidade.MeFinalidade.Text) <> '' then
              QContasReceber_CabCOD_FINALIDADE.Value := StrToInt(Trim(FConhecimento_CR.FmFinalidade.MeFinalidade.Text));
            if Trim(FConhecimento_CR.FMBanco.MeBanco.Text) <> '' then
              QContasReceber_CabCOD_BANCO_AGENCIA.Value := StrToInt(Trim(FConhecimento_CR.FMBanco.MeBanco.Text));
            if Trim(FConhecimento_CR.FmContaCorrente.MeContaCorrente.Text) <> '' then
              QContasReceber_CabCOD_CONTA_CORRENTE.Value := StrToInt(Trim(FConhecimento_CR.FmContaCorrente.MeContaCorrente.Text));
            if Trim(FConhecimento_CP.MECodDepartamento.Text) <> '' then
              QContasReceber_CabCOD_DEPARTAMENTO.Value := StrToInt(Trim(FConhecimento_CR.FmDepartamento.MeDepartamento.Text));
            QContasReceber_CabCOD_CADASTRO.Value := QConhecimentoCadCOD_CADASTRO_PAGADOR.Value;
            QContasReceber_CabCOD_FILIAL.Value := QConhecimentoCadCOD_FILIAL.Value;
            QContasReceber_CabDESC_TIPO_DOCUMENTO.Value := 'FRE';
            QContasReceber_CabDT_EMISSAO.Value := QConhecimentoCadDT_EMISSAO.value;
            QContasReceber_CabDT_VENCIMENTO.Value := StrToDate(FConhecimento_CR.MEDtVencimento.Text);
            if QConhecimentoCadCOD_PRODUTO.Text <> '' then
            begin
              wVlrLancto := StrToFloat('0' + DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO',
                'COD_PRODUTO = ' + QConhecimentoCadCOD_PRODUTO.Text)); // armazenando o numero da embalagem do produto
              wVlrLancto := ((QConhecimentoCadVAL_TARIFA.Value *
                QConhecimentoCadQT_NOTA.Value / wVlrLancto) +
                QConhecimentoCadVAL_PEDAGIO.Value);
              if QConhecimentoCadPERC_DESCONTO_FRETE.Value > 0 then
                wVlrLancto := wVlrLancto - (wVlrLancto * QConhecimentoCadPERC_DESCONTO_FRETE.Value / 100);
            end;
            if wVlrLancto <> 0 then
              QContasReceber_CabVAL_TITULO.Value := wVlrLancto
            else
              QContasReceber_CabVAL_TITULO.Value := QConhecimentoCadVAL_FRETE.Value;
            QContasReceber_CabNUM_TITULO.Value := QConhecimentoCadNUM_CONHECIMENTO.Value;
            QContasReceber_CabIND_SITUACAO.Value := 'ABERTO';
            QContasReceber_CabDESC_OBSERVACAO.Value := 'Referente ao Conhecimento nr.' +
              QConhecimentoCadNUM_CONHECIMENTO.Text + ' e Nf. Nr.' + QConhecimentoCadNUM_NOTA.Text;
            QContasReceber_Cab.Post;
            QConhecimentoCadCOD_CONTA_RECEBER_CAB.Value := QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
            QContasReceber_Mov.Close;
            QContasReceber_Cab.Close;
          end
        Else
          Begin
            DMConhecimento.QConhecimentoCad.Cancel;
            DMContasPagar.QContasPagar_Cab.Cancel;
            DMContasPagar.QContasPagar_Mov.Cancel;
            DMOracle.DBCemapa.Rollback;
            Exit;
          End;
      end;

      if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
      begin
        if (DMOperacao.QOperacaoCOD_CONTABIL_IRRF_CRED.Text <> '') and
          (DMOperacao.QOperacaoCOD_CONTABIL_IRRF_DEB.Text <> '') and
          (QConhecimentoCadVal_Irf.Value <> 0) then
        begin
          wCodDoc := QConhecimentoCadCOD_CONHECIMENTO.Value;
          wNumDoc := FloatToStr(QConhecimentoCadNUM_CONHECIMENTO.Value);
          wFilial := QConhecimentoCadCOD_FILIAL.Value;
          wContaCred := DMOperacao.QOperacaoCOD_CONTABIL_IRRF_CRED.Value;
          wContaDeb := DMOperacao.QOperacaoCOD_CONTABIL_IRRF_DEB.Value;
          wCodCompl := QConhecimentoCadCOD_CADASTRO.Value;
          wCodHistorico := DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL.Value;
          wVlrLancto := QConhecimentoCadVAL_IRF.Value;
          wDtLancto := QConhecimentoCadDT_EMISSAO.Value;
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;
        if (DMOperacao.QOperacaoCod_Contabil_Frete_Cred.Text <> '') and
          (QConhecimentoCadVal_Frete.Value <> 0) then
        begin
          wCodDoc := QConhecimentoCadCOD_CONHECIMENTO.Value;
          wNumDoc := FloatToStr(QConhecimentoCadNUM_CONHECIMENTO.Value);
          wFilial := QConhecimentoCadCOD_FILIAL.Value;
          wContaCred := DMOperacao.QOperacaoCOD_CONTABIL_FRETE_CRED.Value;
          wContaDeb := DMOperacao.QOperacaoCOD_CONTABIL_FRETE_DEB.Value;
          wCodCompl := QConhecimentoCadCOD_CADASTRO.Value;
          wCodHistorico := DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL.Value; // retirado por solicitacao do João
          wVlrLancto := QConhecimentoCadVAL_FRETE.Value + QConhecimentoCadVAL_SEGURO.Value - QConhecimentoCadVAL_INSS_FORNECEDOR.Value -
            QConhecimentoCadVAL_SEST_SENAT.Value - QConhecimentoCadVAL_FALTA_MERCADORIA_CHEGADA.Value - QConhecimentoCadVAL_IRF.Value -
            QConhecimentoCadVAL_CONTABIL.Value;
          wDtLancto := QConhecimentoCadDT_EMISSAO.Value;
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;
        if (DMOperacao.QOperacaoCOD_CONTABIL_INSS_CRED.Text <> '') and
          (DMOperacao.QOperacaoCOD_CONTABIL_INSS_DEB.Text <> '') and
          (QConhecimentoCadVAL_INSS_FORNECEDOR.Value <> 0) then
        begin
          wCodDoc := QConhecimentoCadCOD_CONHECIMENTO.Value;
          wNumDoc := FloatToStr(QConhecimentoCadNUM_CONHECIMENTO.Value);
          ;
          wFilial := QConhecimentoCadCOD_FILIAL.Value;
          wContaCred := DMOperacao.QOperacaoCOD_CONTABIL_INSS_CRED.Value;
          wContaDeb := DMOperacao.QOperacaoCOD_CONTABIL_INSS_DEB.Value;
          wCodCompl := QConhecimentoCadCOD_CADASTRO.Value;
          wCodHistorico := DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL.Value;
          wVlrLancto := QConhecimentoCadVAL_INSS_FORNECEDOR.Value;
          wDtLancto := QConhecimentoCadDT_EMISSAO.Value;
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;
        if (DMOperacao.QOperacaoCOD_CONTABIL_SEST_CRED.Text <> '') and
          (DMOperacao.QOperacaoCod_Contabil_Sest_Deb.Text <> '') and
          (QConhecimentoCadVal_Sest_Senat.Value <> 0) then
        begin
          wCodDoc := QConhecimentoCadCod_Conhecimento.Value;
          wNumDoc := FloatToStr(QConhecimentoCadNum_Conhecimento.Value);
          ;
          wFilial := QConhecimentoCadCod_Filial.Value;
          wContaCred := DMOperacao.QOperacaoCod_Contabil_Sest_Cred.Value;
          wContaDeb := DMOperacao.QOperacaoCod_Contabil_Sest_Deb.Value;
          wCodCompl := QConhecimentoCadCod_Cadastro.Value;
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
          wNumDoc := FloatToStr(QConhecimentoCadNum_Conhecimento.Value);
          ;
          wFilial := QConhecimentoCadCod_Filial.Value;
          wContaCred := DMOperacao.QOperacaoCod_Contabil_Pedagio_Cred.Value;
          wContaDeb := DMOperacao.QOperacaoCod_Contabil_Pedagio_Deb.Value;
          wCodCompl := QConhecimentoCadCod_Cadastro.Value;
          wCodHistorico := DMOperacao.QOperacaoCod_Historico_Contabil.Value;
          wVlrLancto := QConhecimentoCadVal_Pedagio.Value;
          wDtLancto := QConhecimentoCadDt_Emissao.Value;
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;
      end;
      QConhecimentoCadInd_Situacao.Value := '2';
      QConhecimentoCad.Post;
      ImpressoCpiaConhecimento1Click(Self);
      DMOracle.DBCemapa.Commit;
    end;
  except
    DMConhecimento.QConhecimentoCad.Cancel;
    DMContasPagar.QContasPagar_Cab.Cancel;
    DMContasPagar.QContasPagar_Mov.Cancel;
    DMOracle.DBCemapa.Rollback;
    raise;
  end;
end;

procedure TFConhecimentoCad2.VoltarConfirmao1Click(Sender: TObject);
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
          while not QContasPagar_Mov.Eof do
            if QContasPagar_MovIND_TIPO_MOVIMENTO.Value <> '' then
              if (QContasPagar_MovIND_TIPO_MOVIMENTO.Value <> 'PRINCIPAL') then
                raise Exception.Create('Conta a Pagar com baixas!')
              else
                QContasPagar_Mov.Delete;
          QContasPagar_Cab.Delete;
        end;
      end;
      with DMContasReceber do
      begin
        QContasReceber_Cab.Close;
        QContasReceber_Mov.Close;
        QContasReceber_Cab.SetVariable('Pk', DMConhecimento.QConhecimentoCadCOD_CONTA_RECEBER_CAB.Value);
        QContasReceber_Cab.Open;
        QContasReceber_Mov.Open;
        DMConhecimento.QConhecimentoCad.Edit;
        DMConhecimento.QConhecimentoCadCOD_CONTA_RECEBER_CAB.Text := '';
        DMConhecimento.QConhecimentoCad.Post;
        while not QContasReceber_Cab.Eof do
        begin
          while not QContasReceber_Mov.Eof do
            if QContasReceber_MovIND_TIPO_MOVIMENTO.Value <> '' then
            begin
              if (QContasReceber_MovIND_TIPO_MOVIMENTO.Value <> 'PRINCIPAL') then
                raise Exception.Create('Conta a Receber com baixas!')
              else
                QContasReceber_Mov.Delete;
            end;
          QContasReceber_Cab.Delete;
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

procedure TFConhecimentoCad2.Cancela1Click(Sender: TObject);
begin
  inherited;
  if DMConhecimento.QConhecimentoCadInd_Situacao.Value <> '1' then
    raise Exception.Create('Não é possível cancelar este conhecimento. Situação inválida.');
  with DMConhecimento do
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(QConhecimentoCadCOD_FILIAL.Text), 'CONHECIMENTO');
    try
      DMOracle.DBCemapa.StartTransaction;
      QConhecimentoCad.Edit;
      QConhecimentoCadIND_SITUACAO.Value := '3';
      QConhecimentoCadCOD_NOTA_CAB.Text := '';
      QConhecimentoCad.Post;
      DMOracle.DBCemapa.Commit;
    except
      on E: Exception do
      begin
        DMOracle.DBCemapa.Rollback;
        if QConhecimentoCad.State <> dsBrowse then
          QConhecimentoCad.Cancel;
        raise Exception.Create('Não é possível cancelar este Conhecimento. Erro durante cancelamento.' + #13 + #10 +
          e.Message);
      end;
    end;
  end;
end;

procedure TFConhecimentoCad2.VoltarCancelamento1Click(Sender: TObject);
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

procedure TFConhecimentoCad2.FormActivate(Sender: TObject);
begin
  inherited;
  DMConhecimento.QConhecimentoCad.open;
  DMConhecimento.QConhecimentoAlt.open;
end;

procedure TFConhecimentoCad2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMConhecimento.QConhecimentoCad.close;
  DMConhecimento.QConhecimentoCons.close;
  DMConhecimento.QConhecimentoAlt.close;
  action := cafree;
  FConhecimentoCad2 := nil;
end;

procedure TFConhecimentoCad2.SBConsultaClick(Sender: TObject);
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
end;

procedure TFConhecimentoCad2.SBConfirmarClick(Sender: TObject);
var
  wSerie, wRamo_Oper, wRamo_Classe, wProduto, wClasse, wProprietario: string;
begin
  //  DmUsuario.Checar_Filial_Usuario(Trim(DMConhecimento.QConhecimentoCadCOD_FILIAL.Text),'CONHECIMENTO');
  //  If DMconhecimento.QConhecimentoCadCod_Filial.Value <> DMUsuario.CodFilialUsuario then
  //     Raise exception.Create ('Usuario Não Liberado Para Operar Nesta Filial');
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMconhecimento.QConhecimentoCadDt_Emissao.Value then
    raise Exception.Create('Não é Permitido Lançar Este Conhecimento - Fechamento Contabil');
  if DMConhecimento.QConhecimentoCadDESC_PLACA.Text <> '' then
  begin
    wProprietario := DMOracle.BuscaNome('SELECT COD_PROPRIETARIO FROM TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + Chr(39) + DMconhecimento.QConhecimentoCadDesc_Placa.Value + Chr(39));
    if (DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PROPRIETARIO', 'COD_PROPRIETARIO = ' + wProprietario)) = 'D' then
      raise Exception.Create('Proprietário com cadastro desativado');

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'NUTRI' then
    if (DMOracle.BuscaNome('SELECT DESC_INSCRICAO_IDENTIDADE FROM TB_PROPRIETARIO', 'COD_PROPRIETARIO = ' + wProprietario)) = '' then
      raise Exception.Create('Preencher Inscricao Estadual/Identidade no cadastro Proprietário');
  end;
  wSerie := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_OPERACAO', 'COD_OPERACAO = ' + IntToStr(DMconhecimento.QConhecimentoCadCOD_OPERACAO.Value));

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'NUTRI' then
    if wSerie <> DMconhecimento.QConhecimentoCadCod_Serie.Value then
      raise Exception.Create('Não é Permitido Lançar Com Esta Operação' + Chr(13) + 'Checar Série para conhecimento de frete');
  wRamo_Oper := DMOracle.BuscaNome('SELECT COD_RAMO FROM TB_OPERACAO', 'COD_OPERACAO = ' + IntToStr(DMconhecimento.QConhecimentoCadCOD_OPERACAO.Value));
  if DMconhecimento.QConhecimentoCadCOD_NOTA_CAB.Text <> '' then
  begin
    if DMConhecimento.QConhecimentoCadCOD_PRODUTO.Text <> '' then
    begin
      wProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_NOTA_ITEM', 'COD_NOTA_CAB = ' + IntToStr(DMconhecimento.QConhecimentoCadCOD_NOTA_CAB.Value));
      wClasse := DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO', 'COD_PRODUTO = ' + wProduto);
      wRamo_Classe := DMOracle.BuscaNome('SELECT COD_RAMO FROM TB_CLASSE', 'COD_CLASSE = ' + wClasse);
    end;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'NUTRI' then
      if wRamo_Classe <> wRamo_Oper then
        raise Exception.Create('Não é Permitido Lançar está Operação para Esta Nota Fiscal' + Chr(13) + 'Checar ramo da classe do produto com ramo do cadastro de operação');
  end;
  inherited;
  DMOracle.DBCemapa.Commit;
  //Chamando automaticamente a confirmação do conhecimento
  Confirma1Click(Sender);
end;

procedure TFConhecimentoCad2.SBAlterarClick(Sender: TObject);
begin
  if DMConhecimento.QConhecimentoCadInd_Situacao.Value <> '1' then
    raise Exception.Create('Somente Alterar Conhecimento - Digitado')
  else
    inherited;
  DMConhecimento.QConhecimentoCadVal_ICMS.VALUE := 0;
end;

procedure TFConhecimentoCad2.SBExcluirClick(Sender: TObject);
begin
  if DMConhecimento.QConhecimentoCadInd_Situacao.Value <> '1' then
    raise Exception.Create('Somente Excluir Conhecimentos Digitados?')
  else
    inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFConhecimentoCad2.EmitirMICDTA1Click(Sender: TObject);
//var
//  wCont: Integer;
//  wUsuario, wExtenso: string;
//  wDesconto: Real;
//  wRemetente, wDestinatario, wPagador, wProduto, wMotorista, wProprietario: string;
//  wAno, wMes, wDia: Word;
begin
//  inherited;
//  with DMConhecimento do
//  begin
//    QRConhecimento.close;
//    QRConhecimento.setVariable('Cod_Conhecimento', QConhecimentoCadCod_Conhecimento.Value);
//    QRConhecimento.open;
//    DmUsuario.Checar_Filial_Usuario(Trim(QRConhecimentoCOD_FILIAL.Text), 'CONHECIMENTO');
//    if Imp = nil then
//      Imp := TImp.Create;
//    Imp.AbreImpressora;
//
//    wProprietario := DMOracle.BuscaNome('SELECT COD_PROPRIETARIO FROM TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + QuotedStr(QRConhecimentoDESC_PLACA.Value));
//    if wProprietario = '' then
//      wProprietario := '0';
//
//    Imp.ConfiguraImpressora('CONDENSADO_ON', 'SEXTOS', 80);
//
//    wCont := 10;
//
//    Imp.WriteXY(14, wCont, FormatDateTime('dd/MM/yyyy', QRConhecimentoDT_EMISSAO.Value));
//
//    inc(wCont, 3);
//    Imp.WriteXY(11, wCont, QRConhecimentoDESC_CIDADE_REMETENTE.Value + ' - ' + QRConhecimentoCOD_ESTADO_REMETENTE.Value);
//
//    inc(wCont, 3);
//    Imp.WriteXY(11, wCont, QRConhecimentoDESC_CIDADE_DESTINATARIO.Value + ' - ' + QRConhecimentoCOD_ESTADO.Value);
//
//    inc(wCont, 3);
//    Imp.WriteXY(0.5, wCont, DMOracle.BuscaNome('SELECT NOME FROM TB_PROPRIETARIO', 'COD_PROPRIETARIO = ' + wProprietario));
//
//    inc(wCont, 1);
//    Imp.WriteXY(0.5, wCont, DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_PROPRIETARIO', 'COD_PROPRIETARIO = ' + wProprietario));
//
//    inc(wCont, 1);
//    Imp.WriteXY(0.5, wCont, DMOracle.BuscaNome('SELECT DESC_FROTA FROM TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + QuotedStr(QRConhecimentoDESC_PLACA.Value)));
//
//    inc(wCont, 4);
//    Imp.WriteXY(6.5, wCont, QRConhecimentoDESC_PLACA.Value);
//
//    inc(wCont, 2);
//    Imp.WriteXY(0.5, wCont, DMOracle.BuscaNome('SELECT DESC_MARCA FROM TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + QuotedStr(QRConhecimentoDESC_PLACA.Value)));
//
//    inc(wCont, 1);
//    Imp.WriteXY(0.5, wCont, DMOracle.BuscaNome('SELECT DESC_CHASSIS FROM TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + QuotedStr(QRConhecimentoDESC_PLACA.Value)));
//    Imp.WriteXY(6.5, wCont, DMOracle.BuscaNome('SELECT VAL_MAX_CARGA FROM TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + QuotedStr(QRConhecimentoDESC_PLACA.Value)));
//
//    inc(wCont, 3);
//    Imp.WriteXY(0.5, wCont, DMOracle.BuscaNome('SELECT DESC_ANO_MODELO FROM TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + QuotedStr(QRConhecimentoDESC_PLACA.Value)));
//    Imp.WriteXY(6.5, wCont, QRConhecimentoDESC_PLACA_REBOQUE.Value);
//
//    inc(wCont, 3);
////    Imp.WriteXY(11, wCont, QRConhecimentoNOME_REMETENTE.Value);
//    Imp.WriteXY(11, wCont, 'EM LASTRE');
//
//    inc(wCont, 3);
////    Imp.WriteXY(11, wCont, QRConhecimentoNOME.Value);
//    Imp.WriteXY(11, wCont, 'EM LASTRE');
//
//    inc(wCont, 3);
////    Imp.WriteXY(11, wCont, QRConhecimentoNOME_CONSIGNATARIO.Value);
//    Imp.WriteXY(11, wCont, 'EM LASTRE');
//
//    inc(wCont, 3);
//    Imp.WriteXY(11, wCont, QRConhecimentoNOME_MOTORISTA.Value);
//
//    inc(wCont, 1);
//    Imp.WriteXY(11, wCont, QRConhecimentoNUM_RG_MOTORISTA.Value);
//
//    inc(wCont, 1);
//    Imp.WriteXY(11, wCont, QRConhecimentoNUM_CPF_MOTORISTA.Value);
//
//    inc(wCont, 1);
//    Imp.WriteXY(11, wCont, QRConhecimentoDESC_CARTEIRA_MOTORISTA.Value);
//
//    inc(wCont, 4);
////    Imp.WriteXY(1, wCont, Copy(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QRConhecimentoCOD_PRODUTO.Text), 1, 22));
////    Imp.WriteXY(11, wCont, Copy(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QRConhecimentoCOD_PRODUTO.Text), 1, 22));
//    Imp.WriteXY(7, wCont, 'EM LASTRE');
//
//    inc(wCont, 17);
//    Imp.WriteXY(3, wCont, FormatDateTime('dd/MM/yyyy', QRConhecimentoDT_EMISSAO.Value));
//
//    Imp.SaltaPagina;
//    Imp.FechaImpressora;
//  end;
end;

procedure TFConhecimentoCad2.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FMensagemCons;
  Classe := TFMensagemCons;
end;

procedure TFConhecimentoCad2.DBPanel10DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFConhecimentoCad2.DBPanel11DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTributacaoCons;
  Classe := TFTributacaoCons;
end;

procedure TFConhecimentoCad2.DBPanel22DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FSerieCons;
  Classe := TFSerieCons;
end;

procedure TFConhecimentoCad2.DBPanel24DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FOperacaoCons;
  Classe := TFOperacaoCons;
end;

procedure TFConhecimentoCad2.DBPanel26DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFConhecimentoCad2.DBPanel31DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVeiculoConhecimentoCons;
  Classe := TFVeiculoConhecimentoCons;
end;

procedure TFConhecimentoCad2.DBPanel28DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVeiculoConhecimentoCons;
  Classe := TFVeiculoConhecimentoCons;
end;

procedure TFConhecimentoCad2.DBPanel27DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFConhecimentoCad2.DBPanel33CodigoExit(Sender: TObject);
var
  wQtde, wTarifa, wPedagio: Real;
begin
  inherited;
  if DSPrimario.State in [DsEdit, DsInsert] then
  begin
    wQtde := DMConhecimento.QConhecimentoCadQT_NOTA.Value;
    wTarifa := DMConhecimento.QConhecimentoCadVAL_TARIFA.Value;
    wPedagio := DMConhecimento.QConhecimentoCadVAL_PEDAGIO.Value;

    DMConhecimento.QConhecimentoCadVAL_FRETE.Value := (wTarifa * wQtde / 1000) - wPedagio;
  end;
end;

procedure TFConhecimentoCad2.DBPanel36DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFConhecimentoCad2.DBPanel37DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFConhecimentoCad2.DBPanel40DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFConhecimentoCad2.DBPanel43DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFConhecimentoCad2.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'ABATE' then
    DBPNumNota.DataField := 'DESC_NOTAS'; //Campo DESC_NOTAS é varchar2, permite informar diversas notas em apenas 1 conhecimento. A pedido de Adriane, Abatedouro. Diego A. S. 10/08/2010
end;

procedure TFConhecimentoCad2.DBPanel23CodigoChange(Sender: TObject);
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

procedure TFConhecimentoCad2.DBEdit1Change(Sender: TObject);
begin
  inherited;
  DBPanel23CodigoChange(Self);
end;

end.

