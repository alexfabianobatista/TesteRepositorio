unit UViagemParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls,
  UFmDatas, UFmVeiculo, UFmFilial;

type
  TFViagemParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label65: TLabel;
    Me0CodFilial: TMaskEdit;
    Sb0FilialCons: TSpeedButton;
    Ed0Filial: TEdit;
    GB13DtEmissao: TGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    ME0EmissaoInicial: TMaskEdit;
    ME0EmissaoFinal: TMaskEdit;
    ME0CodVeiculo: TMaskEdit;
    Label1: TLabel;
    SB0Veiculo: TSpeedButton;
    ED0Veiculo: TEdit;
    TabSheet2: TTabSheet;
    FmFilial1: TFmFilial;
    FmDatas1: TFmDatas;
    Label2: TLabel;
    MeCodVeiculo1: TMaskEdit;
    EDVeiculo1: TEdit;
    BtFilial: TBitBtn;
    procedure Sb0FilialConsClick(Sender: TObject);
    procedure Me0CodFilialExit(Sender: TObject);
    procedure ME0CodVeiculoExit(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure MeCodVeiculo1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FViagemParam: TFViagemParam;

implementation

uses UFilialCons, UFilial_cl, UVeiculoConhecimentoCons, UOracle_cl,
  UVeiculo_cl, UVeiculoConhecimento_cl;

{$R *.dfm}

procedure TFViagemParam.Sb0FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
   begin
     FViagemParam.Me0CodFilial.text := DMFilial.QFilialConsCOD_FILIAL.Text;
     Me0CodFilialExit(self);
   end;
end;

procedure TFViagemParam.Me0CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me0CodFilial.text) <> '' then
    Ed0Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(Me0CodFilial.text))
  else
    Ed0Filial.Text:='Todas';
end;

procedure TFViagemParam.ME0CodVeiculoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me0CodVeiculo.text) <> '' then
    Ed0Veiculo.Text:=DMOracle.BuscaNome('SELECT DESC_VEICULO FROM TB_VEICULO_CONHECIMENTO','DESC_PLACA = '+Trim(QuotedStr(ME0CodVeiculo.Text)))
  else
    Ed0Veiculo.Text:='Todos';
end;

procedure TFViagemParam.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FVeiculoConhecimentoCons = nil then
     FVeiculoConhecimentoCons:= TFVeiculoConhecimentoCons.create(application);
   if FVeiculoConhecimentoCons.showmodal = mrOk then
   begin
     FViagemParam.MeCodVeiculo1.text := DMVeiculoConhecimento.QVeiculoConsDESC_PLACA.Text;
     MeCodVeiculo1Exit(self);
   end;
end;

procedure TFViagemParam.MeCodVeiculo1Exit(Sender: TObject);
begin
  inherited;
  if Trim(MeCodVeiculo1.text) <> '' then
    EdVeiculo1.Text:=DMOracle.BuscaNome('SELECT DESC_VEICULO FROM TB_VEICULO_CONHECIMENTO','DESC_PLACA = '+Trim(QuotedStr(MECodVeiculo1.Text)))
  else
    EdVeiculo1.Text:='Todos';
end;

end.
