unit UCIAPCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFCIAPCons = class(TFTConsulta)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    MeDtInicio: TMaskEdit;
    MeDtFim: TMaskEdit;
    SBProduto: TSpeedButton;
    MEProduto: TMaskEdit;
    EDProduto: TEdit;
    Label2: TLabel;
    SBFilial: TSpeedButton;
    MEFilial: TMaskEdit;
    EDFilial: TEdit;
    Label3: TLabel;
    SBLocalizacao: TSpeedButton;
    MELocalizacao: TMaskEdit;
    EDLocalizacao: TEdit;
    Label6: TLabel;
    SBResponsavel: TSpeedButton;
    MEResponsavel: TMaskEdit;
    EDResponsavel: TEdit;
    Label7: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
    procedure MEResponsavelExit(Sender: TObject);
    procedure MELocalizacaoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure SBLocalizacaoClick(Sender: TObject);
    procedure SBResponsavelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCIAPCons: TFCIAPCons;

implementation

uses UCIAP_cl, UOracle_cl, UProdutoCons, UProduto_cl, UFilialCons,
  UFilial_cl, ULocalizacaoCons, ULocalizacao_cl, UUsuarioCons, UUsuario_cl;

{$R *.DFM}

//--------------------------------------
Function PrimeiroDiaDoMes (Data : TDateTime) : TDateTime;
var Ano, Mes, Dia : word;
begin
  DecodeDate (Data, Ano, Mes, Dia);
  Dia := 1;
  primeiroDiaDoMes := EncodeDate (Ano, Mes, Dia);
end;

Function UltimoDiaDoMes (Data : TDateTime) : TDateTime;
var
  AuxData : TDateTime;
begin
  AuxData := primeiroDiaDoMes (IncMonth(Data,1)) - 1;
  UltimoDiaDoMes := AuxData;
end;
//--------------------------

procedure TFCIAPCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMCIAP.QCIAPCons.Close;

  If Trim(METexto.Text) <> '' Then
    DMCIAP.QCIAPCons.SetVariable('NUM_PATRIMONIO', Trim(METexto.Text) )
  Else
    DMCIAP.QCIAPCons.SetVariable('NUM_PATRIMONIO', null);

  If Trim(MEProduto.Text) <> '' Then
    DMCIAP.QCIAPCons.SetVariable('COD_PRODUTO', Trim(MEProduto.Text) )
  Else
    DMCIAP.QCIAPCons.SetVariable('COD_PRODUTO', null);

  If Trim(MEFilial.Text) <> '' Then
    DMCIAP.QCIAPCons.SetVariable('COD_FILIAL', Trim(MEFilial.Text) )
  Else
    DMCIAP.QCIAPCons.SetVariable('COD_FILIAL', null);

  If Trim(MELocalizacao.Text) <> '' Then
    DMCIAP.QCIAPCons.SetVariable('COD_LOCALIZACAO', Trim(MELocalizacao.Text) )
  Else
    DMCIAP.QCIAPCons.SetVariable('COD_LOCALIZACAO', null);

  If Trim(MEResponsavel.Text) <> '' Then
    DMCIAP.QCIAPCons.SetVariable('COD_USUARIO', Trim(MEResponsavel.Text) )
  Else
    DMCIAP.QCIAPCons.SetVariable('COD_USUARIO', null);

  DMCIAP.QCIAPCons.SetVariable('DT_INICIO', Trim(MeDtInicio.Text) );
  DMCIAP.QCIAPCons.SetVariable('DT_FIM', Trim(MeDtFim.Text) );

  DMCIAP.QCIAPCons.Open;
end;

procedure TFCIAPCons.MEProdutoExit(Sender: TObject);
begin
  inherited;
  if trim(MEProduto.Text) <> '' then
    EDProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + MEProduto.Text)
  else
    EDProduto.Text := '';
end;

procedure TFCIAPCons.MEFilialExit(Sender: TObject);
begin
  inherited;
  if trim(MEFilial.Text) <> '' then
    EDFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + MEFilial.Text)
  else
    EDFilial.Text := '';
end;

procedure TFCIAPCons.MEResponsavelExit(Sender: TObject);
begin
  inherited;
  if trim(MEResponsavel.Text) <> '' then
    EDResponsavel.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO = ' + MEResponsavel.Text)
  else
    EDResponsavel.Text := '';
end;

procedure TFCIAPCons.MELocalizacaoExit(Sender: TObject);
begin
  inherited;
  if trim(MELocalizacao.Text) <> '' then
    EDLocalizacao.Text := DMOracle.BuscaNome('SELECT DESC_LOCALIZACAO FROM TB_LOCALIZACAO','COD_LOCALIZACAO = ' + MELocalizacao.Text)
  else
    EDLocalizacao.Text := '';
end;

procedure TFCIAPCons.FormCreate(Sender: TObject);
begin
  inherited;
  MeDtInicio.Text := datetostr(PrimeiroDiaDoMes(date));
  MeDtFim.Text := datetostr(UltimoDiaDoMes(date));
end;

procedure TFCIAPCons.SBProdutoClick(Sender: TObject);
begin
  inherited;
  If (FProdutoCons = nil) Then
    FProdutoCons := TFProdutoCons.Create(Application);
  If (FProdutoCons.ShowModal = mrOk) Then
  begin
    MEProduto.Text := floattostr(DMProduto.QProdutoConsCOD_PRODUTO.Value);
    MEProdutoExit(sender);
  end;
end;

procedure TFCIAPCons.SBFilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
  begin
    MEFilial.Text := inttostr(DMFilial.QFilialConsCOD_Filial.Value);
    MEFilialExit(sender);
  end;
end;

procedure TFCIAPCons.SBLocalizacaoClick(Sender: TObject);
begin
  inherited;
  If (FLocalizacaoCons = nil) Then
    FLocalizacaoCons := TFLocalizacaoCons.Create(Application);
  If (FLocalizacaoCons.ShowModal = mrOk) Then
  begin
    MELocalizacao.Text := inttostr(DMLocalizacao.QLocalizacaoConsCOD_Localizacao.Value);
    MELocalizacaoExit(sender);
  end;
end;

procedure TFCIAPCons.SBResponsavelClick(Sender: TObject);
begin
  inherited;
  If (FUsuarioCons = nil) Then
    FUsuarioCons := TFUsuarioCons.Create(Application);
  If (FUsuarioCons.ShowModal = mrOk) Then
  begin
    MEResponsavel.Text := inttostr(DMUsuario.QUsuarioConsCOD_Usuario.Value);
    MEResponsavelExit(sender);
  end;
end;

end.
