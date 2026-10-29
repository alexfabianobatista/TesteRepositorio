unit UVendedorCons_Comissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadraoConsulta, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFVendedorCons_Comissao = class(TFPadraoConsulta)
    Label7: TLabel;
    Label1: TLabel;
    MeDataIni: TMaskEdit;
    MeDataFin: TMaskEdit;
    QConsultaCODVEICULO: TIntegerField;
    QConsultaDSCVEICULO: TIBStringField;
    QConsultaCODVENDEDOR: TIntegerField;
    QConsultaNOME: TIBStringField;
    QConsultaPERC_COMISSAO: TFloatField;
    QConsultaVALOR_COMISSAO: TFloatField;
    QVendedor: TIBQuery;
    IntegerField2: TIntegerField;
    IBStringField2: TIBStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DsVendedor: TDataSource;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    MeValorMinimoVenda: TMaskEdit;
    QConsultaVALORVENDA: TFloatField;
    QVendedorVALORVENDA: TFloatField;
    Label3: TLabel;
    MeValorMinimoComissao: TMaskEdit;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    MeCodVendedor: TMaskEdit;
    EVendedor: TEdit;
    MeCodVeiculo: TMaskEdit;
    EVeiculo: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure MeCodVendedorChange(Sender: TObject);
    procedure MeCodVeiculoChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendedorCons_Comissao: TFVendedorCons_Comissao;

implementation

uses UFuncoes, UVendedorCad, UVeiculoCad;

{$R *.dfm}

procedure TFVendedorCons_Comissao.FormShow(Sender: TObject);
begin
  inherited;
  MeDataIni.Text := FormatDateTime('dd/MM/yyyy', InicioMes);
  MeDataFin.Text := FormatDateTime('dd/MM/yyyy', FimMes);
end;

procedure TFVendedorCons_Comissao.BtnPesquisarClick(Sender: TObject);
begin
  if (not DataValida(MeDataIni.Text)) then
  Begin
    MessageDlg('Data Inicial inválida.', mtWarning, [mbOK], 0);
    MeDataIni.SetFocus;
    Exit;
  End;

  if (not DataValida(MeDataFin.Text)) then
  Begin
    MessageDlg('Data Final inválida.', mtWarning, [mbOK], 0);
    MeDataFin.SetFocus;
    Exit;
  End;

  if MeValorMinimoVenda.Text = '' then
    MeValorMinimoVenda.Text := '0';
  if MeValorMinimoComissao.Text = '' then
    MeValorMinimoComissao.Text := '0';
  if MeCodVendedor.Text = '' then
    MeCodVendedor.Text := '0';
  if MeCodVeiculo.Text = '' then
    MeCodVeiculo.Text := '0';

  QConsulta.Close;
  QConsulta.ParamByName('DATAINI').AsDate := StrToDate(MeDataIni.Text);
  QConsulta.ParamByName('DATAFIN').AsDate := StrToDate(MeDataFin.Text);
  QConsulta.ParamByName('VALORVENDA').AsCurrency := StrToCurr(MeValorMinimoVenda.Text);
  QConsulta.ParamByName('VALORCOMISSAO').AsCurrency := StrToCurr(MeValorMinimoComissao.Text);
  QConsulta.ParamByName('CODVENDEDOR').AsInteger := StrToInt(MeCodVendedor.Text);
  QConsulta.ParamByName('CODVEICULO').AsInteger := StrToInt(MeCodVeiculo.Text);
  QConsulta.Open;

  QVendedor.Close;
  QVendedor.ParamByName('DATAINI').AsDate := StrToDate(MeDataIni.Text);
  QVendedor.ParamByName('DATAFIN').AsDate := StrToDate(MeDataFin.Text);
  QVendedor.ParamByName('VALORVENDA').AsCurrency := StrToCurr(MeValorMinimoVenda.Text);
  QVendedor.ParamByName('VALORCOMISSAO').AsCurrency := StrToCurr(MeValorMinimoComissao.Text);
  QVendedor.ParamByName('CODVENDEDOR').AsInteger := StrToInt(MeCodVendedor.Text);
  QVendedor.ParamByName('CODVEICULO').AsInteger := StrToInt(MeCodVeiculo.Text);
  QVendedor.Open;

  inherited;

end;

procedure TFVendedorCons_Comissao.MeCodVendedorChange(Sender: TObject);
begin
  inherited;
  if MeCodVendedor.Text <> '' then
    EVendedor.Text := BuscaString('NOME', 'TB_VENDEDOR', 'CODVENDEDOR', StrToInt(MeCodVendedor.Text))
  else
    EVendedor.Clear;
end;

procedure TFVendedorCons_Comissao.MeCodVeiculoChange(Sender: TObject);
begin
  inherited;
  if MeCodVeiculo.Text <> '' then
    EVeiculo.Text := BuscaString('DSCVEICULO', 'TB_VEICULO', 'CODVEICULO', StrToInt(MeCodVeiculo.Text))
  else
    EVeiculo.Clear;
end;

procedure TFVendedorCons_Comissao.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFVendedorCad, FVendedorCad);
  FVendedorCad.Consultando := True;
  FVendedorCad.ShowModal;

  if RetornoConsulta > -1 then
    MeCodVendedor.Text := IntToStr(RetornoConsulta)
  else
    MeCodVendedor.Clear;

  MeCodVendedor.SetFocus;
end;

procedure TFVendedorCons_Comissao.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFVeiculoCad, FVeiculoCad);
  FVeiculoCad.Consultando := True;
  FVeiculoCad.ShowModal;

  if RetornoConsulta > -1 then
    MeCodVeiculo.Text := IntToStr(RetornoConsulta)
  else
    MeCodVeiculo.Clear;

  MeCodVeiculo.SetFocus;
end;

end.
