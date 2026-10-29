unit UOperacaoCambioSWPCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, OracleNavigator, variants;

type
  TFOperacaoCambioSWPCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    btnDepartamento: TSpeedButton;
    btnFilial: TSpeedButton;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBRGGarantia: TDBRadioGroup;
    PCPenhorCedular: TPageControl;
    TabSheet2: TTabSheet;
    Label35: TLabel;
    btnFilialPenhor: TSpeedButton;
    Label36: TLabel;
    btnProdutoPenhor: TSpeedButton;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    DBEdit33: TDBEdit;
    DBDirceu8: TDBDirceu;
    DBEdit34: TDBEdit;
    DBDirceu9: TDBDirceu;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    TabSheet5: TTabSheet;
    Label41: TLabel;
    Label42: TLabel;
    btnBaixarPenhor: TBitBtn;
    MECustoBaixa: TMaskEdit;
    MEDtBaixa: TMaskEdit;
    btnVoltaBaixaPenhor: TBitBtn;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    DSLiquidacao: TDataSource;
    DBGrid1: TDBGrid;
    Label27: TLabel;
    DBEdit27: TDBEdit;
    OracleNavigator1: TOracleNavigator;
    DBRadioGroup1: TDBRadioGroup;
    SBHistoricoLiq: TSpeedButton;
    DBDirceu5: TDBDirceu;
    RelaodeOperaodeCmbioSwap1: TMenuItem;
    Opes1: TMenuItem;
    GerarContabilizaodaVariaoCambial1: TMenuItem;
    VoltarltimaContabilizaodaVariaoCambial1: TMenuItem;
    TabSheet4: TTabSheet;
    DSContabilizacaoVariacaoCambialSWP: TDataSource;
    Label31: TLabel;
    lblDtUltimaVariacaoCambial: TLabel;
    DBGrid4: TDBGrid;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    SbContaCorrente: TSpeedButton;
    DBDirceu1: TDBDirceu;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    SbHistoricoIr: TSpeedButton;
    DBDirceu4: TDBDirceu;
    procedure btnDepartamentoClick(Sender: TObject);
    procedure btnFilialClick(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure DBRGGarantiaChange(Sender: TObject);
    procedure btnFilialPenhorClick(Sender: TObject);
    procedure btnProdutoPenhorClick(Sender: TObject);
    procedure btnBaixarPenhorClick(Sender: TObject);
    procedure btnVoltaBaixaPenhorClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBHistoricoLiqClick(Sender: TObject);
    procedure DSLiquidacaoStateChange(Sender: TObject);
    procedure RelaodeOperaodeCmbioSwap1Click(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure GerarContabilizaodaVariaoCambial1Click(Sender: TObject);
    procedure VoltarltimaContabilizaodaVariaoCambial1Click(
      Sender: TObject);
    procedure DSContabilizacaoVariacaoCambialSWPDataChange(Sender: TObject;
      Field: TField);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SbContaCorrenteClick(Sender: TObject);
    procedure SbHistoricoIrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperacaoCambioSWPCad: TFOperacaoCambioSWPCad;

implementation

uses UOperacaoCambio_cl, UContaCorrenteCons, UDepartamentoCons, UFilialCons,
  UHistoricoCons, UProdutoCons, UBancoAgencia_cl, UDepartamento_cl,
  UFilial_cl, UHistorico_cl, UProduto_cl, UOperacaoCambioSWPCons,
  UOperacaoCambioParam, URRelacaoOperacaoCambioSWP, UVariacaoCambialParam,
  UOracle_cl, URLiquidacoesOpercaoCambioSWP;

{$R *.DFM}

procedure TFOperacaoCambioSWPCad.btnDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);
  if FDepartamentoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioSWPCOD_DEPARTAMENTO.Value :=
      DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value;
end;

procedure TFOperacaoCambioSWPCad.btnFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioSWPCOD_FILIAL.Value :=
      DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFOperacaoCambioSWPCad.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  //calcula a dt de vencimento baseada no periodo
  if DSPrimario.State in [dsEdit, dsInsert] then
    if trim(DMOperacaoCambio.QOperacaoCambioSWPDT_OPERACAO.Text) <> '' then
      DMOperacaoCambio.QOperacaoCambioSWPDT_VENCIMENTO.Value :=
        DMOperacaoCambio.QOperacaoCambioSWPDT_OPERACAO.Value +
          DMOperacaoCambio.QOperacaoCambioSWPNUM_PERIODO_OPERACAO.Value;
end;

procedure TFOperacaoCambioSWPCad.DBEdit12Exit(Sender: TObject);
begin
  inherited;
  //calcula o periodo baseado na dt de vencimento
  if DSPrimario.State in [dsEdit, dsInsert] then
    if trim(DMOperacaoCambio.QOperacaoCambioSWPDT_OPERACAO.Text) <> '' then
      DMOperacaoCambio.QOperacaoCambioSWPNUM_PERIODO_OPERACAO.Value :=
        trunc(DMOperacaoCambio.QOperacaoCambioSWPDT_VENCIMENTO.Value -
          DMOperacaoCambio.QOperacaoCambioSWPDT_OPERACAO.Value);
end;

procedure TFOperacaoCambioSWPCad.DBRGGarantiaChange(Sender: TObject);
begin
  inherited;
  if (DBRGGarantia.ItemIndex = 3) or (DBRGGarantia.ItemIndex = 4) then //PNP --> Penhor de produto
    PCPenhorCedular.Visible := true
  else
    PCPenhorCedular.Visible := false;  
end;

procedure TFOperacaoCambioSWPCad.btnFilialPenhorClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioSWPCOD_FILIAL_PENHOR.Value :=
      DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFOperacaoCambioSWPCad.btnProdutoPenhorClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.create(application);

  if FProdutoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioSWPCOD_PRODUTO_PENHOR.Text :=
      DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFOperacaoCambioSWPCad.btnBaixarPenhorClick(Sender: TObject);
begin
  inherited;
  if trim(MECustoBaixa.Text) = '' then
    raise Exception.Create('Informe o custo da baixa');

  if Trim(MEDtBaixa.Text) = '' then
    raise Exception.Create('Informe a data da baixa');

  if MessageDlg('Deseja realmente baixar esse penhor?', mtConfirmation, [mbyes, mbno], 0) <> mryes then
    abort;

  if not (DMOperacaoCambio.QOperacaoCambioSWP.State in [dsInsert, dsEdit]) then
    DMOperacaoCambio.QOperacaoCambioSWP.Edit;

  DMOperacaoCambio.QOperacaoCambioSWPVAL_CUSTO_BAIXA_PENHOR.Value := StrToFloat(trim(MECustoBaixa.Text));
  DMOperacaoCambio.QOperacaoCambioSWPDT_BAIXA_PENHOR.Value := StrToDate(MEDtBaixa.Text);

  DMOperacaoCambio.QOperacaoCambioSWP.Post;
  MEDtBaixa.Clear;
  MECustoBaixa.clear;
  PCPenhorCedular.ActivePage := TabSheet1;

  messageDlg('Penhor Baixado com sucesso.', mtInformation, [mbok], 0);
end;

procedure TFOperacaoCambioSWPCad.btnVoltaBaixaPenhorClick(Sender: TObject);
begin
  inherited;

  if MessageDlg('Deseja realmente voltar a baixa desse penhor?', mtConfirmation, [mbyes, mbno], 0) <> mryes then
    abort;

  if not (DMOperacaoCambio.QOperacaoCambioSWP.State in [dsInsert, dsEdit]) then
    DMOperacaoCambio.QOperacaoCambioSWP.Edit;

  DMOperacaoCambio.QOperacaoCambioSWPVAL_CUSTO_BAIXA_PENHOR.clear;
  DMOperacaoCambio.QOperacaoCambioSWPDT_BAIXA_PENHOR.Clear;

  DMOperacaoCambio.QOperacaoCambioSWP.Post;
  MEDtBaixa.Clear;
  MECustoBaixa.clear;
  PCPenhorCedular.ActivePage := TabSheet1;

  messageDlg('Baixa Voltada com sucesso.', mtInformation, [mbok], 0);
end;

procedure TFOperacaoCambioSWPCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCambioSWPCons = nil then
    FOperacaoCambioSWPCons := TFOperacaoCambioSWPCons.create(application);

  if FOperacaoCambioSWPCons.showmodal = mrok then
  begin
    DMOperacaoCambio.QOperacaoCambioSWP.close;
    DMOperacaoCambio.QOperacaoCambioSWP.SetVariable('PK', DMOperacaoCambio.QOperacaoCambioSWPConsCOD_OPERACAO_CAMBIO_SWP.Value);
    DMOperacaoCambio.QOperacaoCambioSWP.OPEN;

    DMOperacaoCambio.QOperacaoCambioSWPLiq.Close;
    DMOperacaoCambio.QOperacaoCambioSWPLiq.OPEN;
  end;
end;

procedure TFOperacaoCambioSWPCad.FormCreate(Sender: TObject);
begin
  inherited;

  DMOperacaoCambio.QContabilizacaoVariacaoCambialSWP.close;
  DMOperacaoCambio.QContabilizacaoVariacaoCambialSWP.open;


//  DMOperacaoCambio.QOperCambioACCContrato.close;
//  DMOperacaoCambio.QOperCambioACCContrato.open;

//  DMOperacaoCambio.QVariacaoCambioOperacaoCambialACC.close;
//  DMOperacaoCambio.QVariacaoCambioOperacaoCambialACC.open;

//  DMOperacaoCambio.QContabilizacaoVariacaoCambialACC.close;
//  DMOperacaoCambio.QContabilizacaoVariacaoCambialACC.open;


{  Case Trunc(DMParamSistema.QParamSistemaNUM_GRAUS_CONTABIL.Value) of
    4:begin
      DMOperacaoCambio.QOperacaoCambioSWPLiqCONTA_CREDITO_VC_SWP.EditMask := '#.##.##.######;0;';
      DMOperacaoCambio.QOperacaoCambioSWPLiqCONTA_DEBITO_VC_SWP.EditMask  := '#.##.##.######;0;';
      end;
    5:begin
      DMOperacaoCambio.QOperacaoCambioSWPLiqCONTA_CREDITO_VC_SWP.EditMask := '#.##.##.##.######;0;';
      DMOperacaoCambio.QOperacaoCambioSWPLiqCONTA_DEBITO_VC_SWP.EditMask  := '#.##.##.##.######;0;';
      end;
    6:begin
      DMOperacaoCambio.QOperacaoCambioSWPLiqCONTA_CREDITO_VC_ACC.EditMask := '#.##.##.##.##.######;0;';
      DMOperacaoCambio.QOperacaoCambioSWPLiqCONTA_DEBITO_VC_ACC.EditMask  := '#.##.##.##.##.######;0;';
      end;
  end;
}
end;

procedure TFOperacaoCambioSWPCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsEdit, dsInsert] then
  begin
    btnDepartamento.Enabled  := true;
    btnFilial.Enabled        := true;
    btnProdutoPenhor.Enabled := true;
    btnFilialPenhor.Enabled  := true;
    SbContaCorrente.Enabled  := true;
  end
  else
  begin
    btnDepartamento.Enabled  := false;
    btnFilial.Enabled        := false;
    btnProdutoPenhor.Enabled := false;
    btnFilialPenhor.Enabled  := false;
    SbContaCorrente.Enabled  := false;
  end;
end;

procedure TFOperacaoCambioSWPCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMOperacaoCambio.QOperacaoCambioSWPLiq.close;
  DMOperacaoCambio.QOperacaoCambioSWPLiq.open;
  DMOperacaoCambio.QOperacaoCambioSWP.close;
  DMOperacaoCambio.QOperacaoCambioSWP.open;
end;

procedure TFOperacaoCambioSWPCad.SBHistoricoLiqClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioSWPLiqCOD_HISTORICO.Value :=
      DMHistorico.QHistoricoConsCOD_HISTORICO.Value;
end;

procedure TFOperacaoCambioSWPCad.DSLiquidacaoStateChange(Sender: TObject);
begin
  inherited;
  if DSLiquidacao.State in [dsEdit, dsInsert] then
   Begin
    SBHistoricoLiq.Enabled := true;
    SbHistoricoIr.Enabled := True;
   End
  else
   Begin
    SBHistoricoLiq.Enabled := false;
    SbHistoricoIr.Enabled := false;
   End; 
end;

procedure TFOperacaoCambioSWPCad.RelaodeOperaodeCmbioSwap1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam:= TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[13].TabVisible := True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin
    DMOperacaoCambio.QROperacaoCambioSWP.close;

    if trim(FoperacaoCambioParam.ME14NumContrato.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('NUM_CONTRATO',trim(FoperacaoCambioParam.ME14NumContrato.Text))
    else
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('NUM_CONTRATO',null);

    if trim(FoperacaoCambioParam.ME14Departamento.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('COD_DEPARTAMENTO',trim(FoperacaoCambioParam.ME14Departamento.Text))
    else
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('COD_DEPARTAMENTO',null);

    if trim(FoperacaoCambioParam.ME14Filial.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('COD_FILIAL',trim(FoperacaoCambioParam.ME14Filial.Text))
    else
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('COD_FILIAL',null);

    if trim(FoperacaoCambioParam.ME14DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('DT_OPERACAO_INICIO',trim(FoperacaoCambioParam.ME14DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME14DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME14DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('DT_OPERACAO_FIM',null);

    if trim(FoperacaoCambioParam.ME14DtVencimentoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('DT_VENCIMENTO_INICIO',trim(FoperacaoCambioParam.ME14DtVencimentoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('DT_VENCIMENTO_INICIO',null);

    if trim(FoperacaoCambioParam.ME14DtVencimentoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('DT_VENCIMENTO_FIM',trim(FoperacaoCambioParam.ME14DtVencimentoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('DT_VENCIMENTO_FIM',null);

    if FOperacaoCambioParam.RG14Garantia.ItemIndex = 0 then
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('IND_GARANTIA',null);
    if FOperacaoCambioParam.RG14Garantia.ItemIndex = 1 then
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('IND_GARANTIA','NTP');
    if FOperacaoCambioParam.RG14Garantia.ItemIndex = 2 then
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('IND_GARANTIA','CTF');
    if FOperacaoCambioParam.RG14Garantia.ItemIndex = 3 then
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('IND_GARANTIA','HPT');
    if FOperacaoCambioParam.RG14Garantia.ItemIndex = 4 then
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('IND_GARANTIA','PNP');
    if FOperacaoCambioParam.RG14Garantia.ItemIndex = 5 then
      DMOperacaoCambio.QROperacaoCambioSWP.SetVariable('IND_GARANTIA','NHP');

    DMOperacaoCambio.QROperacaoCambioSWP.open;

    if FRRelacaoOperacaoCambioSWP = nil then
      FRRelacaoOperacaoCambioSWP := TFRRelacaoOperacaoCambioSWP.create(application);

    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FRRelacaoOperacaoCambioSWP.QRPrimario.Preview
    else
      FRRelacaoOperacaoCambioSWP.QRPrimario.Print;

    DMOperacaoCambio.QROperacaoCambioSWP.Close;
  end;
end;

procedure TFOperacaoCambioSWPCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if DMOperacaoCambio.QOperacaoCambioSWPDT_BAIXA_PENHOR.IsNull then
  begin
    btnBaixarPenhor.Enabled     := true;
    btnVoltaBaixaPenhor.Enabled := false;
  end
  else
  begin
    btnBaixarPenhor.Enabled     := false;
    btnVoltaBaixaPenhor.Enabled := true;
  end;
end;

procedure TFOperacaoCambioSWPCad.GerarContabilizaodaVariaoCambial1Click(
  Sender: TObject);
begin
  inherited;
  if FVariacaoCambialParam = nil then
    FVariacaoCambialParam := TFVariacaoCambialParam.create(application);

  FVariacaoCambialParam.PGRelatorio.Pages[1].TabVisible := True;
  if FVariacaoCambialParam.showmodal = mrok then
  begin
    try
      DMOracle.DBCemapa.StartTransaction;

      if Trim(FVariacaoCambialParam.ME1DtVariacaoCambial.Text) = '' then
        raise Exception.Create('Informe a data da Variação Cambial');

//      if Trim(FVariacaoCambialParam.ME1DtContabilizacao.Text) = '' then
//        raise Exception.Create('Informe a data de Contabilização');

      if Trim(FVariacaoCambialParam.ME1Historico.Text) = '' then
        raise Exception.Create('Informe o Histórico');

      if Trim(FVariacaoCambialParam.ME1ContaDebito.Text) = '' then
        raise Exception.Create('Informe a Conta Débito');

      if Trim(FVariacaoCambialParam.ME1ContaCredito.Text) = '' then
        raise Exception.Create('Informe a Conta Crédito');

      DMOperacaoCambio.OPOperacaoCambio.CallProcedure('GERAR_VARIACAO_CAMBIAL_SWP',
          [strtodate(FVariacaoCambialParam.ME1DtVariacaoCambial.Text),
           strtodate(FVariacaoCambialParam.ME1DtVariacaoCambial.Text),
           strtoint(FVariacaoCambialParam.ME1Historico.Text),
           FVariacaoCambialParam.ME1ContaDebito.Text,
           FVariacaoCambialParam.ME1ContaCredito.Text
          ]);

      DMOracle.DBCemapa.Commit;

      MessageDlg('Variação Cambial gerada com sucesso.', mtInformation, [mbok], 0);
    except
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;
end;

procedure TFOperacaoCambioSWPCad.VoltarltimaContabilizaodaVariaoCambial1Click(
  Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente voltar a última variação cambial?', mtConfirmation, [mbyes, mbNo], 0) = mryes then
    try
      DMOracle.DBCemapa.StartTransaction;
      DMOperacaoCambio.OPOperacaoCambio.CallProcedure('VOLTAR_VARIACAO_CAMBIAL_SWP',[]);
      DMOracle.DBCemapa.Commit;
      MessageDlg('Variação Cambial voltada com sucesso.',mtInformation, [mbok], 0);
    except
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
end;

procedure TFOperacaoCambioSWPCad.DSContabilizacaoVariacaoCambialSWPDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  lblDtUltimaVariacaoCambial.Caption := DMOracle.BuscaNome('SELECT MAX(DT_VARIACAO_CAMBIAL_SWP) FROM TB_VARIACAO_CAMBIAL_SWP', '');
end;

procedure TFOperacaoCambioSWPCad.SBConfirmarClick(Sender: TObject);
begin
  if (DBRGGarantia.ItemIndex = 3) or
     (DBRGGarantia.ItemIndex = 4) then
  begin
    if DMOperacaoCambio.QOperacaoCambioSWPCOD_FILIAL_PENHOR.IsNull then
      raise Exception.create('Informe a filial do Penhor');

    if DMOperacaoCambio.QOperacaoCambioSWPCOD_PRODUTO_PENHOR.IsNull then
      raise Exception.create('Informe o produto do Penhor');

    if DMOperacaoCambio.QOperacaoCambioSWPQT_QUILOS_PENHOR.IsNull then
      raise Exception.create('Informe a quantidade');

    if DMOperacaoCambio.QOperacaoCambioSWPVAL_SEGURO_PENHOR.IsNull then
      raise Exception.create('Informe o valor do seguro');

    if DMOperacaoCambio.QOperacaoCambioSWPVAL_REGISTRO_PENHOR.IsNull then
      raise Exception.create('Informe o valor do registro');
  end;

  inherited;
end;

procedure TFOperacaoCambioSWPCad.SbContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);
  if FContaCorrenteCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioSWPCOD_CONTA_CORRENTE.Value :=
      DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value;

end;

procedure TFOperacaoCambioSWPCad.SbHistoricoIrClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioSWPLiqCOD_HISTORICO_IR.Value :=
      DMHistorico.QHistoricoConsCOD_HISTORICO.Value;

end;

end.
