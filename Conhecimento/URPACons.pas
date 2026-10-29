unit URPACons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, StdCtrls, Db, Grids, DBGrids, Mask, Buttons, ExtCtrls, variants;

type
  TFRPACons = class(TFTConsulta)
    MeDtInicial: TMaskEdit;
    Label2: TLabel;
    EDCadastro: TEdit;
    Label3: TLabel;
    EDOrigem: TEdit;
    Label4: TLabel;
    EDDestino: TEdit;
    Label5: TLabel;
    SBMotorista: TSpeedButton;
    Label6: TLabel;
    EdCodNota: TEdit;
    SBNota: TSpeedButton;
    SBNotaEntrada: TSpeedButton;
    RgSituacao: TRadioGroup;
    Label7: TLabel;
    EDFilial: TEdit;
    SpeedButton1: TSpeedButton;
    Label8: TLabel;
    EdCodContrato: TEdit;
    SpeedButton3: TSpeedButton;
    Label9: TLabel;
    MeDtFinal: TMaskEdit;
    Label10: TLabel;
    SbProduto: TSpeedButton;
    MeProduto: TMaskEdit;
    Label11: TLabel;
    MePlaca: TEdit;
    Label12: TLabel;
    SbParceiro: TSpeedButton;
    MeParceiro: TEdit;
    RgLancadoContrato: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure SBMotoristaClick(Sender: TObject);
    procedure SBNotaClick(Sender: TObject);
    procedure SBNotaEntradaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SbProdutoClick(Sender: TObject);
    procedure SbParceiroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPACons: TFRPACons;

implementation

uses URPA_cl, UCadastroCons, UCadastro_cl, UNotaSaidaCons, UNotaEntradaCons,
  UNotaSaida_cl, UNotaEntrada_cl, UFilialCons, UFilial_cl,
  UContratoVenda_Cons, Ucontrato_cl, UProdutoCons, UProduto_cl;

{$R *.DFM}

procedure TFRPACons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMRPA do
  begin
    QRPACons.Close;
    if METexto.Text <> '' then
      QRPACons.SetVariable('NUM_RPA',Trim(METexto.text))
    else
      QRPACons.SetVariable('NUM_RPA',NULL);
    if EDCadastro.Text <> '' then
      QRPACons.SetVariable('COD_CADASTRO',Trim(EDCadastro.text))
    else
      QRPACons.SetVariable('COD_CADASTRO',NULL);
    if MeDtInicial.text <> '' then
      QRPACons.SetVariable('DT_INICIAL',Trim(MeDtInicial.text))
    else
      QRPACons.SetVariable('DT_INICIAL',Null);
    if MeDtFinal.text <> '' then
      QRPACons.SetVariable('DT_FINAL',Trim(MeDtFinal.text))
    else
      QRPACons.SetVariable('DT_FINAL',Null);
    if EDOrigem.text <> '' then
      QRPACons.SetVariable('DESC_ORIGEM',Trim(EDOrigem.text))
    else
      QRPACons.SetVariable('DESC_ORIGEM',Null);
    if EDDestino.Text <> '' Then
      QRPACons.SetVariable('DESC_DESTINO',Trim(EDDestino.text))
    else
      QRPACons.SetVariable('DESC_DESTINO',Null);
    if Trim(EdCodNota.Text) <> '' Then
      QRPACons.SetVariable('COD_NOTA_CAB',Trim(EdCodNota.text))
    else
      QRPACons.SetVariable('COD_NOTA_CAB',Null);
    if Trim(EdFilial.Text) <> '' Then
      QRPACons.SetVariable('COD_FILIAL',Trim(EdFilial.text))
    else
      QRPACons.SetVariable('COD_FILIAL',Null);
    if Trim(EdCodContrato.Text) <> '' Then
      QRPACons.SetVariable('COD_CONTRATO_VEND',Trim(EdCodContrato.text))
    else
      QRPACons.SetVariable('COD_CONTRATO_VEND',Null);
    if Trim(MeProduto.Text) <> '' Then
      QRPACons.SetVariable('COD_PRODUTO',Trim(MeProduto.text))
    else
      QRPACons.SetVariable('COD_PRODUTO',Null);
    if Trim(MeParceiro.Text) <> '' Then
      QRPACons.SetVariable('COD_PARCEIRO',Trim(MeParceiro.text))
    else
      QRPACons.SetVariable('COD_PARCEIRO',Null);
    if Trim(MePlaca.Text) <> '' Then
      QRPACons.SetVariable('DESC_PLACA',Trim(MePlaca.text))
    else
      QRPACons.SetVariable('DESC_PLACA',Null);
    Case RgSituacao.ItemIndex Of
      0 : QRPACons.SetVariable('Situacao','1');
      1 : QRPACons.SetVariable('Situacao','2');
      2 : QRPACons.SetVariable('Situacao','3');
      3 : QRPACons.SetVariable('Situacao',Null);
    End;
    Case RgLancadoContrato.ItemIndex Of
      0 : QRPACons.SetVariable('Desc_Substituicao','1=1');
      1 : QRPACons.SetVariable('Desc_Substituicao','NOT(TB_RPA.COD_CONTRATO_VEND IS NULL)');
      2 : QRPACons.SetVariable('Desc_Substituicao','(TB_RPA.COD_CONTRATO_VEND IS NULL)');
    End;
    QRPACons.open;
  end;
end;

procedure TFRPACons.SBMotoristaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
    EdCadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFRPACons.SBNotaClick(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = nil then
     FNotaSaidaCons:=TFNotaSaidaCons.create(application);
  if FNotaSaidaCons.showmodal = mrOk then
     EdCodNota.Text:=DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Text;

end;

procedure TFRPACons.SBNotaEntradaClick(Sender: TObject);
begin
  inherited;
   if FNotaEntradaCons = nil then
     FNotaEntradaCons:=TFNotaEntradaCons.create(application);
  if FNotaEntradaCons.showmodal = mrOk then
     EdCodNota.Text:=DMNotaEntrada.QNotaEntradaConsCod_Nota_Cab.Text;

end;

procedure TFRPACons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons:= TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    FRpaCons.EdFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFRPACons.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
     FContrato_VendaCons:=TFContrato_VendaCons.create(application);
  if FContrato_VendaCons.showmodal = mrOk then
     EdCodContrato.text:=DMContrato.QContrato_VendConsCod_Contrato_Vend.Text;
end;

procedure TFRPACons.FormActivate(Sender: TObject);
begin
  inherited;
  EdCodContrato.Clear;
  MeDtInicial.Text := DateToStr(Date);
  MeDtFinal.Text := DateToStr(Date);
end;

procedure TFRPACons.SbProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons:= TFProdutoCons.create(application);
  if FProdutoCons.showmodal = mrOk then
    MeProduto.Text:=DMProduto.QProdutoConsCod_Produto.Text;

end;

procedure TFRPACons.SbParceiroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
    MeParceiro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

end.
