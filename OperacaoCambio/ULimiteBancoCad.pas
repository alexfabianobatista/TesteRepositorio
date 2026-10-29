unit ULimiteBancoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, variants;

type
  TFLimiteBancoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    SBBanco: TSpeedButton;
    DBDirceu1: TDBDirceu;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    RelaodeLimitesdeBanco1: TMenuItem;
    RelatriodeLimiteACC1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodeLimitesdeBanco1Click(Sender: TObject);
    procedure SBBancoClick(Sender: TObject);
    procedure RelatriodeLimiteACC1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLimiteBancoCad: TFLimiteBancoCad;

implementation

uses ULimiteBanco_cl, ULimiteBancoCons, ULimiteBancoParam,
  URRelacaoLimiteBanco, UBancosCons, UBancoAgencia_cl, URLimiteACC;

{$R *.DFM}

procedure TFLimiteBancoCad.FormCreate(Sender: TObject);
begin
  inherited;
  DMLimiteBanco.QLimiteBanco.close;
  DMLimiteBanco.QLimiteBanco.open;
end;

procedure TFLimiteBancoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if dsprimario.State in [dsInsert, dsEdit] then
  begin
    SBBanco.Enabled := true;
  end
  else
  begin
    SBBanco.Enabled := false;
  end;
end;

procedure TFLimiteBancoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FLimiteBancoCons = nil then
    FLimiteBancoCons := TFLimiteBancoCons.create(application);

  if FLimiteBancoCons.showmodal = mrok then
  begin
    DMLimiteBanco.QLimiteBanco.close;
    DMLimiteBanco.QLimiteBanco.SetVariable('PK', DMLimiteBanco.QLimiteBancoConsCOD_LIMITE_BANCO.Value);
    DMLimiteBanco.QLimiteBanco.open;
  end;
end;

procedure TFLimiteBancoCad.RelaodeLimitesdeBanco1Click(Sender: TObject);
begin
  inherited;
  if FLimiteBancoParam = nil then
    FLimiteBancoParam := TFLimiteBancoParam.create(application);
  FLimiteBancoParam.PGRelatorio.Pages[0].TabVisible:=True;
  if FLimiteBancoParam.showmodal = mrok then
  begin
    DMLimiteBanco.QRLimiteBanco.close;
    if trim(FLimiteBancoParam.ME0Banco.text) <> '' then
      DMLimiteBanco.QRLimiteBanco.SetVariable('COD_BANCO_AGENCIA',trim(FLimiteBancoParam.ME0Banco.text))
    else
      DMLimiteBanco.QRLimiteBanco.SetVariable('COD_BANCO_AGENCIA',null);

    if FLimiteBancoParam.RG0Tipo.ItemIndex = 0 then
      DMLimiteBanco.QRLimiteBanco.SetVariable('IND_TIPO_LIMITE',null);
    if FLimiteBancoParam.RG0Tipo.ItemIndex = 1 then
      DMLimiteBanco.QRLimiteBanco.SetVariable('IND_TIPO_LIMITE','ACC');
    if FLimiteBancoParam.RG0Tipo.ItemIndex = 2 then
      DMLimiteBanco.QRLimiteBanco.SetVariable('IND_TIPO_LIMITE','EGF');
    if FLimiteBancoParam.RG0Tipo.ItemIndex = 3 then
      DMLimiteBanco.QRLimiteBanco.SetVariable('IND_TIPO_LIMITE','OUTROS');

    if FLimiteBancoParam.RG0Situacao.ItemIndex = 0 then
      DMLimiteBanco.QRLimiteBanco.SetVariable('IND_SITUACAO',null);
    if FLimiteBancoParam.RG0Situacao.ItemIndex = 1 then
      DMLimiteBanco.QRLimiteBanco.SetVariable('IND_SITUACAO','APROVADO');
    if FLimiteBancoParam.RG0Situacao.ItemIndex = 2 then
      DMLimiteBanco.QRLimiteBanco.SetVariable('IND_SITUACAO','PROVISORIO');
    if FLimiteBancoParam.RG0Situacao.ItemIndex = 3 then
      DMLimiteBanco.QRLimiteBanco.SetVariable('IND_SITUACAO','ANALISE');

    DMLimiteBanco.QRLimiteBanco.Open;

    if FRRelacaoLimiteBanco = nil then
      FRRelacaoLimiteBanco := TFRRelacaoLimiteBanco.create(application);

    If FLimiteBancoParam.RGPreview.ItemIndex = 0 then
      FRRelacaoLimiteBanco.QRPrimario.Preview
    else
      FRRelacaoLimiteBanco.QRPrimario.Print;

    DMLimiteBanco.QRLimiteBanco.close;
  end;
end;

procedure TFLimiteBancoCad.SBBancoClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons := TFBancosCons.create(application);

  if FBancosCons.showmodal = mrok then
    DMLimiteBanco.QLimiteBancoCOD_BANCO_AGENCIA.Value := DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value;
end;

procedure TFLimiteBancoCad.RelatriodeLimiteACC1Click(Sender: TObject);
begin
  inherited;
  if FLimiteBancoParam = nil then
    FLimiteBancoParam := TFLimiteBancoParam.create(application);
  FLimiteBancoParam.PGRelatorio.Pages[1].TabVisible:=True;
  if FLimiteBancoParam.showmodal = mrok then
  begin
    DMLimiteBanco.QRLimiteACC.close;
    if trim(FLimiteBancoParam.ME1Banco.text) <> '' then
      DMLimiteBanco.QRLimiteACC.SetVariable('COD_BANCO_AGENCIA',trim(FLimiteBancoParam.ME1Banco.text))
    else
      DMLimiteBanco.QRLimiteACC.SetVariable('COD_BANCO_AGENCIA',null);

    if FLimiteBancoParam.RG1Situacao.ItemIndex = 0 then
      DMLimiteBanco.QRLimiteACC.SetVariable('IND_SITUACAO',null);
    if FLimiteBancoParam.RG1Situacao.ItemIndex = 1 then
      DMLimiteBanco.QRLimiteACC.SetVariable('IND_SITUACAO','APROVADO');
    if FLimiteBancoParam.RG1Situacao.ItemIndex = 2 then
      DMLimiteBanco.QRLimiteACC.SetVariable('IND_SITUACAO','PROVISORIO');
    if FLimiteBancoParam.RG1Situacao.ItemIndex = 3 then
      DMLimiteBanco.QRLimiteACC.SetVariable('IND_SITUACAO','ANALISE');

    DMLimiteBanco.QRLimiteACC.Open;

    if FRLimiteACC = nil then
      FRLimiteACC := TFRLimiteACC.create(application);

    If FLimiteBancoParam.RGPreview.ItemIndex = 0 then
      FRLimiteACC.QRPrimario.Preview
    else
      FRLimiteACC.QRPrimario.Print;

    DMLimiteBanco.QRLimiteACC.close;
  end;
end;

end.
