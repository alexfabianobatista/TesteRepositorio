unit UPatrimonioItensCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFPatrimonioItensCons = class(TFTConsulta)
    MEFilial: TMaskEdit;
    EdFilial: TEdit;
    SBtnFilialCons: TSpeedButton;
    Label2: TLabel;
    MEProduto: TMaskEdit;
    Label3: TLabel;
    SBtnProdutoCons: TSpeedButton;
    EdProduto: TEdit;
    RGSituacao: TRadioGroup;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    MeDtInicio: TMaskEdit;
    Label5: TLabel;
    MeDtFim: TMaskEdit;
    Label6: TLabel;
    SBtnPatrimonioCons: TSpeedButton;
    MECodPatrimonio: TMaskEdit;
    EdPatrimonio: TEdit;
    MECodNotaEntrada: TMaskEdit;
    Label7: TLabel;
    SBNotaEntradaCons: TSpeedButton;
    MECodNotaSaida: TMaskEdit;
    Label8: TLabel;
    SBNotaSaidaCons: TSpeedButton;
    Label9: TLabel;
    SBLocalizacaoCons: TSpeedButton;
    MECodLocalizacao: TMaskEdit;
    EdLocalizacao: TEdit;
    MENum_Patrimonio: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    MEContaContabil: TMaskEdit;
    edContaContabil: TEdit;
    MECodReduzido: TMaskEdit;
    RGGeraCIAP: TRadioGroup;
    MENumOrdem: TMaskEdit;
    Label12: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure SBtnFilialConsClick(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
    procedure SBtnProdutoConsClick(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure MECodPatrimonioExit(Sender: TObject);
    procedure SBtnPatrimonioConsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBNotaEntradaConsClick(Sender: TObject);
    procedure SBNotaSaidaConsClick(Sender: TObject);
    procedure MECodLocalizacaoExit(Sender: TObject);
    procedure SBLocalizacaoConsClick(Sender: TObject);
    procedure MEContaContabilExit(Sender: TObject);
    procedure MECodReduzidoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPatrimonioItensCons: TFPatrimonioItensCons;

implementation

uses UPatrimonio_cl, UUsuario_cl, UFilialCons, UFilial_cl, UOracle_cl,
  UProdutoCons, UProduto_cl, UPatrimonioCons, UNotaEntradaCons,
  UNotaSaidaCons, ULocalizacaoCons, ULocalizacao_cl, UNotaEntrada_cl,
  UNotaSaida_cl, UParamSistema_cl, UBiblioteca, UPlanoContaCons,
  UPlanoConta_cl;

{$R *.DFM}

procedure TFPatrimonioItensCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPatrimonio do
  Begin
    DMUsuario.Checar_Filial_Usuario( MEFilial.Text, 'PATRIMONIO');
    If (Trim(MeDtInicio.Text) = '') OR (Trim(MeDtFim.Text) = '') Then
      raise Exception.Create('É necessário Informar um período');
    QPatrimonioItemCons.close;
    QPatrimonioItemCons.SetVariable( 'DT_AQUISICAO_INI',Trim(MeDtInicio.Text) );
    QPatrimonioItemCons.SetVariable( 'DT_AQUISICAO_FIM',Trim(MeDtFim.Text) );
    If Trim(MECodPatrimonio.Text) <> '' Then
      QPatrimonioItemCons.SetVariable('PATRIMONIO',Trim(MECodPatrimonio.Text))
    Else
      QPatrimonioItemCons.SetVariable('PATRIMONIO',null);

    If Trim(MEFilial.Text) <> '' Then
      QPatrimonioItemCons.SetVariable('FILIAL',Trim(MEFilial.Text))
    Else
      QPatrimonioItemCons.SetVariable('FILIAL',null);

    If Trim(MEProduto.Text) <> '' Then
      QPatrimonioItemCons.SetVariable('PRODUTO',Trim(MEProduto.Text))
    Else
      QPatrimonioItemCons.SetVariable('PRODUTO',null);

    If Trim(MECodLocalizacao.Text) <> '' Then
      QPatrimonioItemCons.SetVariable('LOCALIZACAO',Trim(MECodLocalizacao.Text))
    Else
      QPatrimonioItemCons.SetVariable('LOCALIZACAO',null);

    If Trim(MECodNotaEntrada.Text) <> '' Then
      QPatrimonioItemCons.SetVariable('NOTA_ENTRADA',Trim(MECodNotaEntrada.Text))
    Else
      QPatrimonioItemCons.SetVariable('NOTA_ENTRADA',null);

    If Trim(MECodNotaSaida.Text) <> '' Then
      QPatrimonioItemCons.SetVariable('NOTA_SAIDA',Trim(MECodNotaEntrada.Text))
    Else
      QPatrimonioItemCons.SetVariable('NOTA_SAIDA',null);

    if Trim(MENum_Patrimonio.text) <> '' then
      QPatrimonioItemCons.SetVariable('NUM_PATRIMONIO',Trim(MENum_Patrimonio.Text))
    Else
      QPatrimonioItemCons.SetVariable('NUM_PATRIMONIO',null);

    if Trim(MENumOrdem.text) <> '' then
      QPatrimonioItemCons.SetVariable('NUM_ORDEM',Trim(MENumOrdem.Text))
    Else
      QPatrimonioItemCons.SetVariable('NUM_ORDEM',null);

    if Trim(MEContaContabil.text) <> '' then
      QPatrimonioItemCons.SetVariable('CONTA_CONTABIL_BEM',Trim(MEContaContabil.Text))
    Else
      QPatrimonioItemCons.SetVariable('CONTA_CONTABIL_BEM',null);

    Case RGSituacao.ItemIndex of
      0 : QPatrimonioItemCons.SetVariable( 'SITUACAO','ATIVO' );
      1 : QPatrimonioItemCons.SetVariable( 'SITUACAO','VENDIDO' );
      2 : QPatrimonioItemCons.SetVariable( 'SITUACAO','BAIXADO' );
      3 : QPatrimonioItemCons.SetVariable( 'SITUACAO','ROUBADO' );
      4 : QPatrimonioItemCons.SetVariable( 'SITUACAO','OBSOLETO' );
      5 : QPatrimonioItemCons.SetVariable( 'SITUACAO',null );
    End;

    case RGGeraCIAP.ItemIndex of
      0 : QPatrimonioItemCons.SetVariable( 'IND_GERA_CIAP', null );
      1 : QPatrimonioItemCons.SetVariable( 'IND_GERA_CIAP','SIM' );
      2 : QPatrimonioItemCons.SetVariable( 'IND_GERA_CIAP','NAO' );
    end;

    QPatrimonioItemCons.Open;
  End
end;

procedure TFPatrimonioItensCons.SBtnFilialConsClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    MEFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  MEFilialExit(self);
end;

procedure TFPatrimonioItensCons.MEFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(MEFilial.Text) <> '')Then
    EdFilial.Text := DMOracle.BuscaNome( 'SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(MEFilial.Text) )
  Else
    EdFilial.Text := 'Todas';
end;

procedure TFPatrimonioItensCons.SBtnProdutoConsClick(Sender: TObject);
begin
  inherited;
  If (FProdutoCons = nil) Then
    FProdutoCons := TFProdutoCons.Create(Application);
  If (FProdutoCons.ShowModal = mrOk) Then
    MEProduto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
  MEProdutoExit(self);
end;

procedure TFPatrimonioItensCons.MEProdutoExit(Sender: TObject);
begin
  inherited;
  If(Trim(MEProduto.Text) <> '')Then
    EdProduto.Text := DMOracle.BuscaNome( 'SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + Trim(MEProduto.Text) )
  Else
    EdProduto.Text := 'Todos';
end;

procedure TFPatrimonioItensCons.MECodPatrimonioExit(Sender: TObject);
begin
  inherited;
  If(Trim(MECodPatrimonio.Text) <> '')Then
    EdPatrimonio.Text := DMOracle.BuscaNome( 'SELECT DESC_PATRIMONIO FROM TB_PATRIMONIO_CAB','COD_PATRIMONIO_CAB = ' + Trim(MECodPatrimonio.Text) )
  Else
    EdPatrimonio.Text := 'Todos';
end;

procedure TFPatrimonioItensCons.SBtnPatrimonioConsClick(Sender: TObject);
begin
  inherited;
  If FPatrimonioCons = nil Then
    FPatrimonioCons := TFPatrimonioCons.Create(Application);
  If FPatrimonioCons.ShowModal = mrOk Then
  Begin
    MECodPatrimonio.Text := DMPatrimonio.QPatrimonioConsCOD_PATRIMONIO_CAB.Text;
    MECodPatrimonioExit(self);
  End;
end;

procedure TFPatrimonioItensCons.FormCreate(Sender: TObject);
var wMask : string;
begin
  inherited;

  //--VERIFICA OS GRAUS CONTÁBEIS PARA APLICAR A MÁSCARA CORRETA------------
  wMask := '';
  Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
    4: wMask := '#.##.##.######;0;';
    5: wMask := '#.##.##.##.######;0;';
    6: wMask := '#.##.##.##.##.######;0;';
  End;
  MEContaContabil.EditMask := wMask;

  MeDtInicio.Text := DateToStr(Date-90);
  MeDtFim.Text := DateToStr(Date);
end;

procedure TFPatrimonioItensCons.SBNotaEntradaConsClick(Sender: TObject);
begin
  inherited;
  If(FNotaEntradaCons = nil)Then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  If(FNotaEntradaCons.showmodal = mrOk)Then
    MECodNotaEntrada.Text := DMNotaEntrada.QNotaEntradaConsCOD_NOTA_CAB.Text;
end;

procedure TFPatrimonioItensCons.SBNotaSaidaConsClick(Sender: TObject);
begin
  inherited;
  If(FNotaSaidaCons = nil)Then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If(FNotaSaidaCons.showmodal = mrOk)Then
    MECodNotaSaida.Text := DMNotaSaida.QNotaSaidaConsCOD_NOTA_CAB.Text;
end;

procedure TFPatrimonioItensCons.MECodLocalizacaoExit(Sender: TObject);
begin
  inherited;
  If( Trim(MECodLocalizacao.Text) <> '' )Then
    EdLocalizacao.Text := DMOracle.BuscaNome('SELECT DESC_LOCALIZACAO FROM TB_LOCALIZACAO','COD_LOCALIZACAO = ' + Trim(MECodLocalizacao.Text))
  Else
    EdLocalizacao.Text := 'Todos';
end;

procedure TFPatrimonioItensCons.SBLocalizacaoConsClick(Sender: TObject);
begin
  inherited;
  If(FLocalizacaoCons = nil)Then
    FLocalizacaoCons := TFLocalizacaoCons.Create(Application);
  If(FLocalizacaoCons.showmodal = mrOk)Then
  Begin
    MECodLocalizacao.Text := DMLocalizacao.QLocalizacaoConsCOD_LOCALIZACAO.Text;
    MECodLocalizacaoExit(self);
  End;
end;

procedure TFPatrimonioItensCons.MEContaContabilExit(Sender: TObject);
begin
  inherited;
  if Trim(Bib.LimpaString(MEContaContabil.text,'.'))<>'' then
  begin
    edContaContabil.text  := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+ CHR(39)+Bib.LimpaString(MEContaContabil.text,'.')+ CHR(39));
    MECodReduzido.text:= DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+CHR(39)+Bib.LimpaString(MEContaContabil.text,'.')+CHR(39));
  end
  else
  begin
    edContaContabil.Text := 'Todos';
    MECodReduzido.Clear;
  end;
end;

procedure TFPatrimonioItensCons.MECodReduzidoExit(Sender: TObject);
begin
  inherited;
  if (Trim(MECodReduzido.text)<>'') and (Trim(MECodReduzido.text)<>'0') then
  begin
    edContaContabil.Text := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = ' + MECodReduzido.Text);
    MEContaContabil.Text := DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = ' + MECodReduzido.Text);
  end
  else
    MEContaContabilExit(Self);
end;

procedure TFPatrimonioItensCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);

  If FPlanoContaCons.ShowModal = mrOk then
  begin
    MEContaContabil.text := DMPlanoConta.QPlanoContaConsNum_Plano_conta.Value;
    MEContaContabilExit(Self);
  end;
end;

end.
