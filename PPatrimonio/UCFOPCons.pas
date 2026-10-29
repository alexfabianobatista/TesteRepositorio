unit UCFOPCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFCFOPCons = class(TFTConsulta)
    Mes: TLabel;
    SBFilial: TSpeedButton;
    Label3: TLabel;
    MEFilial: TMaskEdit;
    EDFilial: TEdit;
    MEMes: TMaskEdit;
    procedure MEFilialExit(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCFOPCons: TFCFOPCons;

implementation

uses UCFOP_cl, UOracle_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFCFOPCons.MEFilialExit(Sender: TObject);
begin
  inherited;
  if trim(MEFilial.Text) <> '' then
    EDFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + MEFilial.Text)
  else
    EDFilial.Text := '';
end;

procedure TFCFOPCons.SBFilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
  begin
    MEFilial.Text := inttostr(DMFilial.QFilialConsCOD_Filial.Value);
    MEFilialExit(sender);
  end;
end;

procedure TFCFOPCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMCFOP.QCFOPCons.Close;

  If Trim(METexto.Text) <> '' Then
    DMCFOP.QCFOPCons.SetVariable('NUM_ANO', Trim(METexto.Text) )
  Else
    DMCFOP.QCFOPCons.SetVariable('NUM_ANO', null);

  If Trim(MEMes.Text) <> '' Then
    DMCFOP.QCFOPCons.SetVariable('NUM_MES', Trim(MEMes.Text) )
  Else
    DMCFOP.QCFOPCons.SetVariable('NUM_MES', null);

  If Trim(MEFilial.Text) <> '' Then
    DMCFOP.QCFOPCons.SetVariable('COD_FILIAL', Trim(MEFilial.Text) )
  Else
    DMCFOP.QCFOPCons.SetVariable('COD_FILIAL', null);

  DMCFOP.QCFOPCons.Open;
end;

end.
