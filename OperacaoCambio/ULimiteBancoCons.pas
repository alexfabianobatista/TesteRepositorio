unit ULimiteBancoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFLimiteBancoCons = class(TFTConsulta)
    RGTipo: TRadioGroup;
    RGSituacao: TRadioGroup;
    SBBanco: TSpeedButton;
    edtBanco: TEdit;
    procedure SBBancoClick(Sender: TObject);
    procedure METextoExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLimiteBancoCons: TFLimiteBancoCons;

implementation

uses ULimiteBanco_cl, UBancosCons, UBancoAgencia_cl, UOracle_cl;

{$R *.DFM}

procedure TFLimiteBancoCons.SBBancoClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons := tFBancosCons.create(application);

  if FBancosCons.showmodal = mrok then
  begin
    metexto.Text := DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Text;
    METextoExit(sender);
  end;
end;

procedure TFLimiteBancoCons.METextoExit(Sender: TObject);
begin
  inherited;
  if trim(metexto.Text) <> '' then
    edtBanco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = ' + trim(METexto.Text))
  else
    edtBanco.text := 'Todos';
end;

procedure TFLimiteBancoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;

  DMLimiteBanco.QLimiteBancoCons.close;

  if trim(metexto.text) <> '' then
    DMLimiteBanco.QLimiteBancoCons.SetVariable('COD_BANCO_AGENCIA',trim(metexto.text))
  else
    DMLimiteBanco.QLimiteBancoCons.SetVariable('COD_BANCO_AGENCIA',null);

  if RGTipo.ItemIndex = 0 then
    DMLimiteBanco.QLimiteBancoCons.SetVariable('IND_TIPO_LIMITE',null);
  if RGTipo.ItemIndex = 1 then
    DMLimiteBanco.QLimiteBancoCons.SetVariable('IND_TIPO_LIMITE','ACC');
  if RGTipo.ItemIndex = 2 then
    DMLimiteBanco.QLimiteBancoCons.SetVariable('IND_TIPO_LIMITE','EGF');
  if RGTipo.ItemIndex = 3 then
    DMLimiteBanco.QLimiteBancoCons.SetVariable('IND_TIPO_LIMITE','OUTROS');

  if RGSituacao.ItemIndex = 0 then
    DMLimiteBanco.QLimiteBancoCons.SetVariable('IND_SITUACAO',null);
  if RGSituacao.ItemIndex = 1 then
    DMLimiteBanco.QLimiteBancoCons.SetVariable('IND_SITUACAO','APROVADO');
  if RGSituacao.ItemIndex = 2 then
    DMLimiteBanco.QLimiteBancoCons.SetVariable('IND_SITUACAO','PROVISORIO');
  if RGSituacao.ItemIndex = 3 then
    DMLimiteBanco.QLimiteBancoCons.SetVariable('IND_SITUACAO','ANALISE');

  DMLimiteBanco.QLimiteBancoCons.open;
end;

end.
