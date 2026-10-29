unit UOSCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Buttons, StdCtrls, Db, Grids, DBGrids, Mask, ExtCtrls,
  DBCtrls, variants, Menus;

type
  TFOsCons = class(TFTConsulta)
    Label2: TLabel;
    MEPlacaNum: TMaskEdit;
    Label3: TLabel;
    EdCadastroCod: TEdit;
    SBCadastroCons: TSpeedButton;
    EdCadastroNome: TEdit;
    RGIndSituacao: TRadioGroup;
    Label4: TLabel;
    MENUM_OS: TMaskEdit;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    MENumMotor: TMaskEdit;
    Label6: TLabel;
    MENumSerie: TMaskEdit;
    procedure SBCadastroConsClick(Sender: TObject);
    procedure EdCadastroCodChange(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOsCons: TFOsCons;

implementation

uses UCadastroCons, UCadastro_cl, UOracle_cl, UOs_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFOsCons.SBCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    EdCadastroCod.Text := IntToStr(DMCadastro.QCadastroConsCOD_CADASTRO.Value);
end;

procedure TFOsCons.EdCadastroCodChange(Sender: TObject);
begin
  inherited;
  if EdCadastroCod.Text <> '' then
    EdCadastroNome.Text := DMOracle.BuscaNome('SELECT nome FROM TB_CADASTRO', 'COD_CADASTRO = ' + CHR(39) + EdCadastroCod.Text + CHR(39))
  else
    EdCadastroNome.Text := '';
end;

procedure TFOsCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMOs do
  begin
    QOSCons.Close;
    if Trim(METexto.Text) = '' then
      QOSCons.SetVariable('NUM_CHASSI', Null)
    else
      QOScons.SetVariable('NUM_CHASSI', '%' + METexto.Text);
    if Trim(MEPlacaNum.Text) = '' then
      QOSCons.SetVariable('NUM_PLACA', Null)
    else
      QOScons.SetVariable('NUM_PLACA', '%' + MEPlacaNum.Text + '%');
    if Trim(EdCadastroCod.Text) = '' then
      QOSCons.SetVariable('COD_CADASTRO', Null)
    else
      QOScons.SetVariable('COD_CADASTRO', EdCadastroCod.Text);
    if Trim(MENUM_OS.Text) = '' then
      QOSCons.SetVariable('NUM_OS', Null)
    else
      QOScons.SetVariable('NUM_OS', MENUM_OS.Text);
    if Trim(MENumMotor.Text) = '' then
      QOSCons.SetVariable('NUM_MOTOR', Null)
    else
      QOScons.SetVariable('NUM_MOTOR', Trim(MENumMotor.Text));
    if Trim(MENumSerie.Text) = '' then
      QOSCons.SetVariable('NUM_SERIE', Null)
    else
      QOScons.SetVariable('NUM_SERIE', Trim(MENumSerie.Text));

    if RGIndSituacao.ItemIndex = 0 then
      QOScons.SetVariable('IND_SITUACAO', 'A')
    else if RGIndSituacao.ItemIndex = 1 then
      QOScons.SetVariable('IND_SITUACAO', 'F')
    else
      QOScons.SetVariable('IND_SITUACAO', Null);

    //--Ordenar OS por ordem crescente a pedido da Raquel Medibens. Vanessa 04/02/2014
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIBENS') then
    begin
     QOSCons.SQL[QOSCons.SQL.Count-1] := ''; //elimina a última linha da sql
     QOSCons.SQL.Add('TB_OS.DT_EMISSAO, TB_OS.COD_CADASTRO')
    end;
    //--
    QOSCons.Open;
  end;
end;

end.

