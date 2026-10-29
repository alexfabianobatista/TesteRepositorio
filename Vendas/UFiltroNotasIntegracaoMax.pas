unit UFiltroNotasIntegracaoMax;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTFiltroRelatorio, DB, DBClient, Provider, ImgList, StdCtrls,
  Buttons, Grids, DBGrids, DBCtrls, Mask, DateUtils;

type
  TFFiltroNotasIntegraMax = class(TFTFiltroRelatorio)
    MeEmbarque: TMaskEdit;
    Label59: TLabel;
    SBEmbarque: TSpeedButton;
    EdCidade: TEdit;
    Label7: TLabel;
    SBCidade: TSpeedButton;
    BtProcurar: TBitBtn;
    MEDtFinal: TMaskEdit;
    Label3: TLabel;
    MEDtInicial: TMaskEdit;
    Label4: TLabel;
    MePedidos: TMaskEdit;
    Label5: TLabel;
    SBPedidos: TSpeedButton;
    CDSFiltroRelatorioNOME: TStringField;
    CDSFiltroRelatorioDT_EMISSAO: TDateTimeField;
    CDSFiltroRelatorioNUM_NOTA: TFloatField;
    CDSFiltroRelatorioCOD_FILIAL: TIntegerField;
    CDSFiltroRelatorioNUM_PEDIDO: TIntegerField;
    CDSFiltroRelatorioSVAL_TOTAL: TFloatField;
    CDSFiltroRelatorioDESC_CIDADE: TStringField;
    CDSFiltroRelatorioCOD_EMBARQUE: TFloatField;
    CDSFiltroRelatorioCOD_NOTA_CAB: TIntegerField;
    procedure CDSFiltroRelatorioCalcFields(DataSet: TDataSet);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBCidadeClick(Sender: TObject);
    procedure SBPedidosClick(Sender: TObject);
    procedure SBEmbarqueClick(Sender: TObject);
    procedure EdCidadeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFiltroNotasIntegraMax: TFFiltroNotasIntegraMax;

implementation

uses UNotaSaida_cl, UBiblioteca, UOracle_cl, UEmbarqueCons, UEmbarque_cl,
  UCidadeCons, UCidade_cl, UPedido_cl, UPedidoCons;

{$R *.dfm}

procedure TFFiltroNotasIntegraMax.CDSFiltroRelatorioCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  CDSFiltroRelatorio.DisableControls;
  CDSFiltroRelatorioVAL_SELECIONADO.Value := Bib.ift(CDSFiltroRelatorioIND_SELECIONADO.Value = 'S',
    CDSFiltroRelatorioSVAL_TOTAL.Value, 0);
  CDSFiltroRelatorio.EnableControls;
end;

procedure TFFiltroNotasIntegraMax.BtProcurarClick(Sender: TObject);
begin
  inherited;
  if Length(trim(MEDtInicial.Text)) < 8 then
  begin
    MEDtInicial.SetFocus;
    raise Exception.Create('Preencha corretamente a data inicial.');
  end;
  if Length(trim(MEDtFinal.Text)) < 8 then
  begin
    MEDtfinal.SetFocus;
    raise Exception.Create('Preencha corretamente a data final.');
  end;
  if Trim(MeEmbarque.Text) = '' then
    raise Exception.Create('Preencha o embarque para prosseguir');
  DMNotaSaida.QNotasIntegracaoMax.Close;
  CDSFiltroRelatorio.Close;
  CDSFiltroRelatorio.Params.ParamByName('DT_INICIAL').Value := StrToDate(MEDtInicial.Text);
  CDSFiltroRelatorio.Params.ParamByName('DT_FINAL').Value := StrToDate(MEDtFinal.Text);
  if Trim(MePedidos.Text) <> '' then
    CDSFiltroRelatorio.Params.ParamByName('PEDIDOS').Value := MePedidos.Text
  else
    CDSFiltroRelatorio.Params.ParamByName('PEDIDOS').Value := NULL;
  if Trim(MeEmbarque.Text) <> '' then
  begin
    CDSFiltroRelatorio.Params.ParamByName('DT_INICIAL').Value := StrToDate('31/12/1969');
    CDSFiltroRelatorio.Params.ParamByName('DT_FINAL').Value := Today;
    CDSFiltroRelatorio.Params.ParamByName('EMBARQUES').Value := MeEmbarque.Text;
  end
  else
    CDSFiltroRelatorio.Params.ParamByName('EMBARQUES').Value := NULL;
  if Trim(EdCidade.Text) <> '' then
    CDSFiltroRelatorio.Params.ParamByName('CIDADE').Value := EdCidade.Text
  else
    CDSFiltroRelatorio.Params.ParamByName('CIDADE').Value := NULL;
  CDSFiltroRelatorio.Open;
end;

procedure TFFiltroNotasIntegraMax.FormActivate(Sender: TObject);
begin
  inherited;
  if MEDtInicial.Text = '' then
    MEDtInicial.Text := DateToStr(incday(date, -10));
  if MEDtFinal.Text = '' then
    MEDtFinal.Text := DateToStr(Date);
end;

procedure TFFiltroNotasIntegraMax.SBCidadeClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.Showmodal = mrOk then
    EdCidade.Text := DMCidade.QCidadeConsDesc_Cidade.Value;
end;

procedure TFFiltroNotasIntegraMax.SBPedidosClick(Sender: TObject);
begin
  inherited;
  If FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  If FPedidoCons.ShowModal = mrOk then
    MePedidos.Text := MePedidos.Text + Bib.ift(Trim(MePedidos.Text) <> '', ',' + DMPedido.QPedidoConsNUM_PEDIDO.Text,
      DMPedido.QPedidoConsNUM_PEDIDO.Text);
end;

procedure TFFiltroNotasIntegraMax.SBEmbarqueClick(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
    MeEmbarque.Text := MeEmbarque.Text +Bib.ift(Trim(MeEmbarque.Text) <> '', ',' + DMEmbarque.QEmbarqueConsCOD_EMBARQUE.Text,
      DMEmbarque.QEmbarqueConsCOD_EMBARQUE.Text);
end;

procedure TFFiltroNotasIntegraMax.EdCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key := UpCase(Key);
end;

end.
