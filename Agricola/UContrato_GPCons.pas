unit UContrato_GPCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFContrato_GPCons = class(TFTConsulta)
    MESafra: TMaskEdit;
    Label2: TLabel;
    MECodFilial: TMaskEdit;
    MEFilial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton2: TSpeedButton;
    MECliente: TMaskEdit;
    MECodCliente: TMaskEdit;
    RgSituacao: TRadioGroup;
    procedure SpeedButton1Click(Sender: TObject);
    procedure MECodFilialExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MECodClienteExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContrato_GPCons: TFContrato_GPCons;

implementation

uses UFilialCons, UFilial_cl, UOracle_cl, UCadastroCons, UCadastro_cl,
  Ucontrato_cl, UBiblioteca, UUsuario_cl;

{$R *.DFM}

procedure TFContrato_GPCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      MECodFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;
      MECodFilialExit(Self);
    end;
end;

procedure TFContrato_GPCons.MECodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial.text) <> '' then
    MEFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.text)
  else
    MEFilial.Clear;
end;

procedure TFContrato_GPCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      MECodCliente.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
      MECodClienteExit(Self);
    end;
end;

procedure TFContrato_GPCons.MECodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodCliente.Text)<>'' then
    MECliente.text := DmOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodCliente.text)
  else
    MECliente.Clear;
end;

procedure TFContrato_GPCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MECodFilial.Text),'AGRICOLA');
  with DMContrato do
    begin
      QContrato_GPCons.Close;
      if Trim(METexto.Text)<>'' then
        QContrato_GpCons.SetVariable('NUM_CONTRATO',METexto.Text)
      else
        QContrato_GpCons.SetVariable('NUM_CONTRATO',Null);

      if Trim(Bib.LimpaString(MESafra.Text,'/')) <> '' then
        QContrato_GpCons.SetVariable('DT_SAFRA',MESafra.Text)
      else
        QContrato_GpCons.SetVariable('DT_SAFRA',Null);

      if Trim(MeCodFilial.Text)<>'' then
        QContrato_GPCons.SetVariable('COD_FILIAL',MECodFilial.Text)
      else
        QContrato_GPCons.SetVariable('COD_FILIAL',Null);

      if Trim(MECodCliente.Text)<>'' then
        QContrato_GpCons.SetVariable('COD_CADASTRO',MECodCliente.Text)
      else
        QContrato_GpCons.SetVariable('COD_CADASTRO',Null);
      Case RgSituacao.ItemIndex of
        0 : QContrato_GpCons.SetVariable('IND_SITUACAO','ABERTO');
        1 : QContrato_GpCons.SetVariable('IND_SITUACAO','FECHADO');
        2 : QContrato_GpCons.SetVariable('IND_SITUACAO','N.CUMPRIDO');
        3 : QContrato_GpCons.SetVariable('IND_SITUACAO',Null);
      End;  
      QContrato_GPCons.Open;
    end;
end;

end.
