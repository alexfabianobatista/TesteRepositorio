unit ULanctoContabilCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants,
  Menus;

type
  TFLanctoContabilCons = class(TFTConsulta)
    MECodFilial: TMaskEdit;
    MECodHistContabil: TMaskEdit;
    MEHistContabil: TMaskEdit;
    MECodPlanoContas: TMaskEdit;
    MEPlanoContas: TMaskEdit;
    MECodPlanilha: TMaskEdit;
    BitBtn4: TBitBtn;
    MECodNota: TMaskEdit;
    MECodContasReceber: TMaskEdit;
    MECodContasPagar: TMaskEdit;
    MECodBanco: TMaskEdit;
    MECodCaixa: TMaskEdit;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn17: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    RGOperacao: TRadioGroup;
    GroupBox1: TGroupBox;
    MEDtInicial: TMaskEdit;
    MEDtFinal: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    BitBtn1: TBitBtn;
    RGNota: TRadioGroup;
    Label12: TLabel;
    Label13: TLabel;
    MeValor: TMaskEdit;
    procedure BitBtn4Click(Sender: TObject);
    procedure MECodFilialChange(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure MECodHistContabilChange(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure MECodPlanoContasChange(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLanctoContabilCons: TFLanctoContabilCons;

implementation

uses UFilialCons, UFilial_cl, UHistContabilCons, UHistContabil_cl,
  UPlanoContaCons, UPlanoConta_cl, UContasReceberCons, UContasReceber_cl,
  UContasPagarCons, UContasPagar_cl, UBancosCons, UBancoAgencia_cl,
  UCaixaCons, UCaixa_cl, UPlanilha_cl, UBancoMovCons, UNotaSaidaCons,
  UNotaSaida_cl, UNotaEntrada_cl, UNotaEntradaCons, UOracle_cl,
  UParamSistema_cl, UUsuario_cl;

{$R *.DFM}

procedure TFLanctoContabilCons.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
     MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCOD_FILIAL.Value);
end;

procedure TFLanctoContabilCons.MECodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial.Text)<>'' then
    METexto.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.Text)
  else
    METexto.Clear;
end;

procedure TFLanctoContabilCons.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if FHistContabilCons = Nil then
    FHistContabilCons:=TFHistContabilCons.Create(Application);
  if FHistContabilCons.ShowModal = MrOk then
     MECodHistContabil.Text:=FloatToStr(DMHistContabil.QHistContabilConsCod_Historico_Contabil.Value);
end;

procedure TFLanctoContabilCons.MECodHistContabilChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodHistContabil.Text)<>'' then
    MEHistContabil.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO_CONTABIL FROM TB_HISTORICO_CONTABIL','COD_HISTORICO_CONTABIL = '+MECodHistContabil.Text)
  else
    MEHistContabil.Clear;
end;

procedure TFLanctoContabilCons.BitBtn17Click(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  if FPlanoContaCons.ShowModal = MrOk then
    begin
      MECodPlanoContas.Text:=FloatToStr(DMPlanoConta.QPlanoContaConsCod_Reduzido.Value);
      DMPlanoConta.QPlanoContaCons.Close;
    end;
end;

procedure TFLanctoContabilCons.MECodPlanoContasChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodPlanoContas.Text)<>'' then
    MEPlanoContas.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodPlanoContas.Text)
  else
    MEPlanoContas.Clear;
end;

procedure TFLanctoContabilCons.BitBtn14Click(Sender: TObject);
begin
  inherited;
  if FContasReceberCons = Nil then
    FContasReceberCons:=TFContasReceberCons.Create(Application);
  if FContasReceberCons.ShowModal = MrOk then
     MECodContasReceber.Text:=FloatToStr(DMContasReceber.QContasReceber_CabConsCod_Conta_Receber_Cab.Value);
end;

procedure TFLanctoContabilCons.BitBtn13Click(Sender: TObject);
begin
  inherited;
  if FContasPagarCons = Nil then
    FContasPagarCons:=TFContasPagarCons.Create(Application);
  if FContasPagarCons.ShowModal = MrOk then
     MECodContasPagar.Text:=FloatToStr(DMContasPagar.QContasPagar_CabConsCod_Conta_Pagar_Cab.Value);
end;

procedure TFLanctoContabilCons.BitBtn12Click(Sender: TObject);
begin
  inherited;
  if FBancoMovCons = Nil then
    FBancoMovCons:=TFBancoMovCons.Create(Application);
  if FBancoMovCons.ShowModal = MrOk then
     MECodBanco.Text:=FloatToStr(DMBancoAgencia.QBancoMovConsCod_bco_Movimento.Value);
end;

procedure TFLanctoContabilCons.BitBtn11Click(Sender: TObject);
begin
  inherited;
  if FCaixaCons = Nil then
    FCaixaCons:=TFCaixaCons.Create(Application);
  if FCaixaCons.ShowModal = MrOk then
     MECodCaixa.Text:=FloatToStr(DMCaixa.QCaixa_Mov_ConsCOD_CAIXA_MOV.Value);
end;

procedure TFLanctoContabilCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if RGNota.ItemIndex<>0 then
    begin
      if FNotaSaidaCons = Nil then
        FNotaSaidaCons:=TFNotaSaidaCons.Create(Application);
      if FNotaSaidaCons.ShowModal = MrOk then
         MECodNota.Text:=FloatToStr(DMNotaSaida.QNotaSaidaConsCod_Nota_cab.Value);
    end
  else
    begin
      if FNotaEntradaCons = Nil then
        FNotaEntradaCons:=TFNotaEntradaCons.Create(Application);
      if FNotaEntradaCons.ShowModal = MrOk then
         MECodNota.Text:=FloatToStr(DMNotaEntrada.QNotaEntradaConsCod_Nota_cab.Value);
    end;
end;

procedure TFLanctoContabilCons.BtProcurarClick(Sender: TObject);
Var wGenerico : Real;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario(Trim(MECodFilial.Text),'CONTABIL');
  With DMPlanilha do
   begin
     wGenerico := 0;
     QlanctoContabilCons.Close;
     if Trim(MECodFilial.text)<>'' then
       QlanctoContabilCons.SetVariable('COD_FILIAL',StrToInt(Trim(MECodFilial.Text)))
     else
       QlanctoContabilCons.SetVariable('COD_FILIAL',Null);
     if Trim(MECodHistContabil.text)<>'' then
       QlanctoContabilCons.SetVariable('COD_HISTORICO_CONTABIL',StrToInt(Trim(MECodHistContabil.Text)))
     else
       QlanctoContabilCons.SetVariable('COD_HISTORICO_CONTABIL',Null);
     if Trim(MECodPlanoContas.text)<>'' then
       QlanctoContabilCons.SetVariable('COD_PLANO_CONTA',StrToInt(Trim(MECodPlanoContas.Text)))
     else
       QlanctoContabilCons.SetVariable('COD_PLANO_CONTA',Null);
     if Trim(MECodPlanilha.text)<>'' then
       QlanctoContabilCons.SetVariable('COD_PLANILHA',StrToInt(Trim(MECodPlanilha.Text)))
     else
       QlanctoContabilCons.SetVariable('COD_PLANILHA',Null);
     if Trim(MECodNota.text)<>'' then
       wGenerico := StrToFloat(MECodNota.Text);
     if Trim(MECodContasReceber.text) <> '' then
       QlanctoContabilCons.SetVariable('COD_CONTAS_RECEBER',StrToInt(Trim(MECodContasReceber.text)))
     else
       QlanctoContabilCons.SetVariable('COD_CONTAS_RECEBER',Null);
     if Trim(MECodContasPagar.text) <> '' then
       QlanctoContabilCons.SetVariable('COD_CONTA_PAGAR',StrToInt(Trim(MECodContasPagar.text)))
     else
       QlanctoContabilCons.SetVariable('COD_CONTA_PAGAR',Null);
      if Trim(MeValor.text) <> '' then
       QlanctoContabilCons.SetVariable('VAL_LANCAMENTO',StrToFloat(Trim(MeValor.text)))
     else
       QlanctoContabilCons.SetVariable('VAL_LANCAMENTO',Null);
     if Trim(MECodBanco.text) <> '' then
       wGenerico := StrToFloat(MECodBanco.Text);
     if Trim(MECodCaixa.text) <> '' then
       wGenerico:=StrToFloat(MECodCaixa.Text);
     if wGenerico <> 0 Then
        QlanctoContabilCons.SetVariable('COD_GENERICO',wGenerico)
     Else
        QlanctoContabilCons.SetVariable('COD_GENERICO',Null);
     Case RGOperacao.ItemIndex of
       0:QlanctoContabilCons.SetVariable('IND_OPERACAO','D');
       1:QlanctoContabilCons.SetVariable('IND_OPERACAO','C');
       2:QlanctoContabilCons.SetVariable('IND_OPERACAO',Null);
     end;
     QlanctoContabilCons.SetVariable('DT_INICIAL',StrToDate(MEDtInicial.Text));
     QlanctoContabilCons.SetVariable('DT_FINAL',StrToDate(MEDtFinal.Text));
     QlanctoContabilCons.Open;
    end;
end;

procedure TFLanctoContabilCons.FormActivate(Sender: TObject);
begin
  inherited;
//  MeDtInicial.Text := DateToStr(Date);
//  MeDtFinal.Text := DateToStr(Date);
end;

end.
