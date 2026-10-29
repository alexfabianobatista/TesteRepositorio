unit UConhecimentoFretecons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFConhecimentoFreteCons = class(TFTConsulta)
    SpeedButton32: TSpeedButton;
    Label56: TLabel;
    MeCodFilial: TMaskEdit;
    MeFilial: TMaskEdit;
    Label2: TLabel;
    MeCodCadastro: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MeCadastro: TMaskEdit;
    RgSituacao: TRadioGroup;
    Label4: TLabel;
    SpeedButton2: TSpeedButton;
    MeOrigem: TMaskEdit;
    EdOrigem: TMaskEdit;
    GroupBox1: TGroupBox;
    MeDtEmissaoInic: TMaskEdit;
    Label3: TLabel;
    Label6: TLabel;
    MeDtEmissaoFim: TMaskEdit;
    MePlaca: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    SpeedButton4: TSpeedButton;
    MeOperacao: TMaskEdit;
    EdOperacao: TMaskEdit;
    MeTotal: TMaskEdit;
    MeTotalPedagio: TMaskEdit;
    MeTotalGeral: TMaskEdit;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    MeCodNota: TMaskEdit;
    BtConsNota: TBitBtn;
    BtConsEntrada: TBitBtn;
    procedure BtProcurarClick(Sender: TObject);
    procedure MeCodFilialExit(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure MeCodCadastroExit(Sender: TObject);
    procedure MeOrigemExit(Sender: TObject);
    procedure MeOperacaoExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtConsNotaClick(Sender: TObject);
    procedure BtConsEntradaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimentoFreteCons: TFConhecimentoFreteCons;

implementation

uses UConhecimentoFrete_cl, UFilialCons, UFilial_cl, UOracle_cl, UCadastroCons,
     UCadastro_cl, UUsuario_cl, UOperacaoCons, UOperacao_cl,
  UNotaSaidaCons, UNotaEntradaCons, UNotaSaida_cl, UNotaEntrada_cl;
     //Ucontrato_cl, UContratoVenda_Cons,   //SERGIO RETIRADO 09/07/03 

{$R *.DFM}

procedure TFConhecimentoFreteCons.BtProcurarClick(Sender: TObject);
Var wTotal,wPedagio : Real;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MeCodFilial.Text),'AGRICOLA');
  with DMConhecimentoFrete do
    begin
      QConhecimentoFreteCons.Close;
      If Trim(MeCodFilial.Text) <> '' Then
         QConhecimentoFreteCons.SetVariable('COD_FILIAL',StrToInt(Trim(MeCodFilial.Text)))
      else
         QConhecimentoFreteCons.SetVariable('COD_FILIAL',Null);
      If Trim(MeCodCadastro.Text) <> '' Then
         QConhecimentoFreteCons.SetVariable('COD_CADASTRO',StrToInt(Trim(MeCodCadastro.Text)))
      else
         QConhecimentoFreteCons.SetVariable('COD_CADASTRO',Null);
      If Trim(MeOrigem.Text) <> '' Then
         QConhecimentoFreteCons.SetVariable('COD_CADASTRO_NOTA',StrToInt(Trim(MeOrigem.Text)))
      else
         QConhecimentoFreteCons.SetVariable('COD_CADASTRO_NOTA',Null);
      If Trim(MeOperacao.Text) <> '' Then
         QConhecimentoFreteCons.SetVariable('COD_OPERACAO',StrToInt(Trim(MeOperacao.Text)))
      else
         QConhecimentoFreteCons.SetVariable('COD_OPERACAO',Null);
      If Trim(MeTexto.Text) <> '' Then
         QConhecimentoFreteCons.SetVariable('NUM_FRETE',StrToInt(Trim(MeTexto.Text)))
      else
         QConhecimentoFreteCons.SetVariable('NUM_FRETE',Null);
      If Trim(MePlaca.Text) <> '' Then
         QConhecimentoFreteCons.SetVariable('DESC_PLACA',Trim(MePlaca.Text))
      else
         QConhecimentoFreteCons.SetVariable('DESC_PLACA',Null);
      If Trim(MeCodNota.Text) <> '' Then
         QConhecimentoFreteCons.SetVariable('COD_NOTA_CAB',StrToInt(Trim(MeCodNota.Text)))
      else
         QConhecimentoFreteCons.SetVariable('COD_NOTA_CAB',Null);
      QConhecimentoFreteCons.SetVariable('DT_EMISSAO_INIC',StrToDate(MeDtEmissaoInic.Text));
      QConhecimentoFreteCons.SetVariable('DT_EMISSAO_FIM',StrToDate(MeDtEmissaoFim.Text));
      Case RgSituacao.ItemIndex of
        0 : QConhecimentoFreteCons.SetVariable('SITUACAO','2');
        1 : QConhecimentoFreteCons.SetVariable('SITUACAO','1');
        2 : QConhecimentoFreteCons.SetVariable('SITUACAO',Null);
      End;
      wTotal := 0;
      wPedagio := 0;
      QConhecimentoFreteCons.Open;
      While Not (QConhecimentoFreteCons.Eof) Do
      Begin
        wTotal := wTotal + QConhecimentoFreteConsVal_Frete.Value;
        wPedagio := wPedagio + QConhecimentoFreteConsVal_Pedagio.Value;
        QConhecimentoFreteCons.Next;
      End;
      MeTotal.Text := FormatFloat('#,###,##0.00',wTotal);
      MeTotalPedagio.Text := FormatFloat('#,###,##0.00',wPedagio);
      MeTotalGeral.Text := FormatFloat('#,###,##0.00',wTotal + wPedagio);
    end;
end;

procedure TFConhecimentoFreteCons.MeCodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MeCodFilial.Text)<>'' then
    MeFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MeCodFilial.Text)
  else
    MeFilial.Clear;

end;

procedure TFConhecimentoFreteCons.SpeedButton32Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      MeCodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
      MeCodFilialExit(Self);
    end;

end;

procedure TFConhecimentoFreteCons.MeCodCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(MeCodCadastro.Text)<>'' then
    MeCadastro.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MeCodCadastro.Text)
  else
    MeCadastro.Clear;
end;

procedure TFConhecimentoFreteCons.MeOrigemExit(Sender: TObject);
begin
  inherited;
  if Trim(MeOrigem.Text)<>'' then
    EdOrigem.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MeOrigem.Text)
  else
    EdOrigem.Clear;

end;

procedure TFConhecimentoFreteCons.MeOperacaoExit(Sender: TObject);
begin
  inherited;
  if Trim(MeOperacao.Text) <>'' then
    EdOperacao.Text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+MeOperacao.Text)
  else
    EdOperacao.Clear;
end;

procedure TFConhecimentoFreteCons.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    begin
      MeOperacao.Text:=FloatToStr(DMOperacao.QOperacaoConsCod_Operacao.Value);
      MeOperacaoExit(Self);
    end;

end;

procedure TFConhecimentoFreteCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      MeOrigem.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
      MeOrigemExit(Self);
    end;

end;

procedure TFConhecimentoFreteCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      MeCodCadastro.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
      MeCodCadastroExit(Self);
    end;

end;

procedure TFConhecimentoFreteCons.FormActivate(Sender: TObject);
begin
  inherited;
  MeDtEmissaoInic.Text := DateToStr(Date - 90);
  MeDtEmissaoFim.Text := DateToStr(Date);
end;

procedure TFConhecimentoFreteCons.BtConsNotaClick(Sender: TObject);
begin
  inherited;
  If FNotaSaidaCons = Nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If FNotaSaidaCons.ShowModal = mrOk then
    MeCodNota.Text := DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Text;

end;

procedure TFConhecimentoFreteCons.BtConsEntradaClick(Sender: TObject);
begin
  inherited;
  If FNotaEntradaCons = Nil then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  If FNotaEntradaCons.ShowModal = mrOk then
    MeCodNota.Text := DMNotaEntrada.QNotaEntradaConsCod_Nota_Cab.Text;

end;

end.
