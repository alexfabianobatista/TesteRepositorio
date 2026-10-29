unit UCDACons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFCDACons = class(TFTConsulta)
    MECidade: TMaskEdit;
    Label2: TLabel;
    SBCidade: TSpeedButton;
    EdCidade: TEdit;
    Label3: TLabel;
    MEMatricula: TMaskEdit;
    procedure MECidadeExit(Sender: TObject);
    procedure SBCidadeClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCDACons: TFCDACons;

implementation

uses UCDA_cl, UOracle_cl, UCidadeCons, UCidade_cl;

{$R *.DFM}

procedure TFCDACons.MECidadeExit(Sender: TObject);
begin
  inherited;
  if trim(MECidade.Text) <> '' then
    edCidade.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE','COD_CIDADE = ' + MECidade.Text)
  else
    edCidade.Text := 'Todas';
end;

procedure TFCDACons.SBCidadeClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.create(application);

  if fcidadeCons.showmodal = mrok then
  begin
    MECidade.Text := DMCidade.QCidadeConsCOD_CIDADE.AsString;
    MECidadeExit(sender);
  end;
end;

procedure TFCDACons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMCDA.QCDACons.close;

  if trim(METexto.text) <> '' then
    DMCDA.QCDACons.SetVariable('NUM_CDA',trim(METexto.text))
  else
    DMCDA.QCDACons.SetVariable('NUM_CDA',null);

  if trim(MEMatricula.text) <> '' then
    DMCDA.QCDACons.SetVariable('DESC_MATRICULA',trim(MEMatricula.text))
  else
    DMCDA.QCDACons.SetVariable('DESC_MATRICULA',null);

  if trim(MECidade.text) <> '' then
    DMCDA.QCDACons.SetVariable('COD_CIDADE',trim(MECidade.text))
  else
    DMCDA.QCDACons.SetVariable('COD_CIDADE',null);

  DMCDA.QCDACons.OPEN;
end;

end.
