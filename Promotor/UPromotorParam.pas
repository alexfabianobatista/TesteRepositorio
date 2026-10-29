unit UPromotorParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFPromotorParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    RG1SITUACAO: TRadioGroup;
    TabSheet2: TTabSheet;
    Label27: TLabel;
    ME2Cadastro: TMaskEdit;
    SBCADASTROCons: TSpeedButton;
    ED2CADASTRO: TMaskEdit;
    GroupBox5: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    ME2Data_I: TMaskEdit;
    ME2Data_F: TMaskEdit;
    Label1: TLabel;
    ME2Promotor: TMaskEdit;
    SBPromotorCons: TSpeedButton;
    ED2Promotor: TMaskEdit;
    TabSheet3: TTabSheet;
    RG3Operacao: TRadioGroup;
    RG3Situacao: TRadioGroup;
    TabSheet4: TTabSheet;
    Label2: TLabel;
    ME4Promotor: TMaskEdit;
    SB4Promotor: TSpeedButton;
    Label3: TLabel;
    Me4Filial: TMaskEdit;
    SB4Filial: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    SB4Historico: TSpeedButton;
    ME4Historico: TMaskEdit;
    Ed4Filial: TEdit;
    Ed4Promotor: TEdit;
    Ed4Historico: TEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    ME4DtInicial: TMaskEdit;
    ME4DtFinal: TMaskEdit;
    RG2Tipo: TRadioGroup;
    procedure SBCADASTROConsClick(Sender: TObject);
    procedure ME2CadastroExit(Sender: TObject);
    procedure SBPromotorConsClick(Sender: TObject);
    procedure ME2PromotorExit(Sender: TObject);
    procedure SB4FilialClick(Sender: TObject);
    procedure SB4PromotorClick(Sender: TObject);
    procedure SB4HistoricoClick(Sender: TObject);
    procedure Me4FilialExit(Sender: TObject);
    procedure ME4PromotorExit(Sender: TObject);
    procedure ME4HistoricoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPromotorParam: TFPromotorParam;

implementation

uses UCadastroCons, UCadastro_cl, UOracle_cl, UFilialCons, UPromotorCons,
  UHistoricoPromotorCons, UFilial_cl, UPromoto_cl, UHistoricoPromotor_cl;

{$R *.DFM}

procedure TFPromotorParam.SBCADASTROConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME2Cadastro.text:=DMCadastro.QCadastroConsCOD_CADASTRO.text;
      ME2CadastroExit(Self);
    end;
end;

procedure TFPromotorParam.ME2CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME2Cadastro.text)<>'' then
    ED2Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME2Cadastro.text)
  else
    ED2Cadastro.Clear;
end;

procedure TFPromotorParam.SBPromotorConsClick(Sender: TObject);
begin
  inherited;
  if FPromotorCons = Nil then
    FPromotorCons:=TFPromotorCons.Create(Application);
  if FPromotorCons.ShowModal = mrOk then
    begin
      ME2Promotor.text:=DMPromotor.QPromotorConsCOD_PROMOTOR.text;
      ME2PromotorExit(Self);
    end;
end;

procedure TFPromotorParam.ME2PromotorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME2Promotor.text)<>'' then
    ED2Promotor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_PROMOTOR','COD_PROMOTOR = '+ME2Promotor.text)
  else
    ED2Promotor.Clear;
end;

procedure TFPromotorParam.SB4FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME4Filial.Text := IntToStr(DMFilial.QFilialConsCod_Filial.Value);
    ME4FilialExit(self);
end;

procedure TFPromotorParam.SB4PromotorClick(Sender: TObject);
begin
  inherited;
  If FPromotorCons = Nil then
    FPromotorCons := TFPromotorCons.Create(Application);
  If FPromotorCons.ShowModal = mrOk then
    ME4Promotor.Text := IntToStr(DMPromotor.QPromotorConsCod_Promotor.Value);
    ME4PromotorExit(self);
end;

procedure TFPromotorParam.SB4HistoricoClick(Sender: TObject);
begin
  inherited;
  If FHistoricoPromotorCons = Nil then
    FHistoricoPromotorCons := TFHistoricoPromotorCons.Create(Application);
  If FHistoricoPromotorCons.ShowModal = mrOk then
    ME4Historico.Text := IntToStr(DMHistoricoPromotor.QHistoricoPromotorConsCod_Historico_Promotor.Value);
    ME4HistoricoExit(self);
end;

procedure TFPromotorParam.Me4FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME4Filial.text)<>'' then
    ED4Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME4Filial.text)
  else
    ED4Filial.Clear;
end;

procedure TFPromotorParam.ME4PromotorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME4Promotor.text)<>'' then
    ED4Promotor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_PROMOTOR','COD_PROMOTOR = '+ME4Promotor.text)
  else
    ED4Promotor.Clear;

end;

procedure TFPromotorParam.ME4HistoricoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME4Historico.text)<>'' then
    ED4Historico.text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO_PROMOTOR FROM TB_HISTORICO_PROMOTOR','COD_HISTORICO_PROMOTOR = '+ME4Historico.text)
  else
    ED4Historico.Clear;
end;

end.
