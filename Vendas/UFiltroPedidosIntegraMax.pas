unit UFiltroPedidosIntegraMax;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTFiltroRelatorio, DB, DBClient, Provider, ImgList, StdCtrls,
  Buttons, Grids, DBGrids, DBCtrls, Mask, DateUtils;

type
  TFFiltroPedidosIntegraMax = class(TFTFiltroRelatorio)
    CDSFiltroRelatorioCOD_FILIAL: TIntegerField;
    CDSFiltroRelatorioNUM_PEDIDO: TIntegerField;
    CDSFiltroRelatorioDT_EMISSAO: TDateTimeField;
    CDSFiltroRelatorioNOME: TStringField;
    CDSFiltroRelatorioCOD_PEDIDO_CAB: TIntegerField;
    CDSFiltroRelatorioSVAL_TOTAL: TFloatField;
    MEDtFinal: TMaskEdit;
    Label3: TLabel;
    MEDtInicial: TMaskEdit;
    Label4: TLabel;
    BtProcurar: TBitBtn;
    CDSFiltroRelatorioDESC_CIDADE: TStringField;
    EdCidade: TEdit;
    Label7: TLabel;
    SBCidade: TSpeedButton;
    MeEmbarque: TMaskEdit;
    SBEmbarque: TSpeedButton;
    Label59: TLabel;
    CDSFiltroRelatorioCOD_EMBARQUE: TIntegerField;
    procedure CDSFiltroRelatorioCalcFields(DataSet: TDataSet);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBCidadeClick(Sender: TObject);
    procedure EdCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure SBEmbarqueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFiltroPedidosIntegraMax: TFFiltroPedidosIntegraMax;

implementation

uses UPedido_cl, UBiblioteca, UOracle_cl, UCidadeCons, UCidade_cl,
  UEmbarqueCons, UEmbarque_cl;

{$R *.dfm}

procedure TFFiltroPedidosIntegraMax.CDSFiltroRelatorioCalcFields(
  DataSet: TDataSet);
var str: string;
begin
  inherited;
  CDSFiltroRelatorio.DisableControls;
  CDSFiltroRelatorioVAL_SELECIONADO.Value := Bib.ift(CDSFiltroRelatorioIND_SELECIONADO.Value = 'S',
    CDSFiltroRelatorioSVAL_TOTAL.Value, 0);
  CDSFiltroRelatorio.EnableControls;
end;

procedure TFFiltroPedidosIntegraMax.BtProcurarClick(Sender: TObject);
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
  DMPedido.QPedidosIntegraMax.Close;
  CDSFiltroRelatorio.Close;
  CDSFiltroRelatorio.Params.ParamByName('DATA_I').Value := StrToDate(MEDtInicial.Text);
  CDSFiltroRelatorio.Params.ParamByName('DATA_F').Value := StrToDate(MEDtFinal.Text);
  CDSFiltroRelatorio.Params.ParamByName('INTEGRACAO_MAX').Value := 'S';
  CDSFiltroRelatorio.Params.ParamByName('ATENDIDOS').Value := NULL;
  CDSFiltroRelatorio.Params.ParamByName('PEDIDO_CAB').Value := NULL;
  if Trim(EdCidade.Text) <> '' then
    CDSFiltroRelatorio.Params.ParamByName('CIDADE').Value := EdCidade.Text
  else
    CDSFiltroRelatorio.Params.ParamByName('CIDADE').Value := NULL;
  if Trim(MeEmbarque.Text) <> '' then
  begin
    CDSFiltroRelatorio.Params.ParamByName('DATA_I').Value := StrToDate('31/12/1969');
    CDSFiltroRelatorio.Params.ParamByName('DATA_F').Value := Today;
    CDSFiltroRelatorio.Params.ParamByName('EMBARQUES').Value := MeEmbarque.Text
  end
  else
    CDSFiltroRelatorio.Params.ParamByName('EMBARQUES').Value := NULL;

  DMPedido.QPedidosIntegraMax.SQL.Delete(DMPedido.QPedidosIntegraMax.SQL.Count - 1);
  DMPedido.QPedidosIntegraMax.SQL.Add('ORDER BY TRIM(TB_CADASTRO.NOME)');
  CDSFiltroRelatorio.Open;
  DMPedido.QPedidosIntegraMax.SQL.Delete(DMPedido.QPedidosIntegraMax.SQL.Count - 1);
  DMPedido.QPedidosIntegraMax.SQL.Add('ORDER BY Tb_pedido_cab.COD_PEDIDO_CAB');
end;

procedure TFFiltroPedidosIntegraMax.FormActivate(Sender: TObject);
begin
  inherited;
  if MEDtInicial.Text = '' then
    MEDtInicial.Text := DateToStr(incday(date, -10));
  if MEDtFinal.Text = '' then
    MEDtFinal.Text := DateToStr(Date);
end;

procedure TFFiltroPedidosIntegraMax.SBCidadeClick(Sender: TObject);
begin
  inherited;                      
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.Showmodal = mrOk then
    EdCidade.Text := DMCidade.QCidadeConsDesc_Cidade.Value;
end;

procedure TFFiltroPedidosIntegraMax.EdCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key := UpCase(Key);
end;

procedure TFFiltroPedidosIntegraMax.SBEmbarqueClick(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
    MeEmbarque.Text := MeEmbarque.Text +Bib.ift(Trim(MeEmbarque.Text) <> '', ',' + DMEmbarque.QEmbarqueConsCOD_EMBARQUE.Text,
      DMEmbarque.QEmbarqueConsCOD_EMBARQUE.Text);
end;

end.
