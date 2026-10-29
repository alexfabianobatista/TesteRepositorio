unit UAreaCultivarCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFAreaCultivarCons = class(TFTConsulta)
    SpeedButton1: TSpeedButton;
    MEDesc_Safra: TMaskEdit;
    Label2: TLabel;
    EDSafra: TEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure EDSafraExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAreaCultivarCons: TFAreaCultivarCons;

implementation

uses UAreaCultivar_cl, UOracle_cl;

{$R *.DFM}

procedure TFAreaCultivarCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMAreaCultivar do
  Begin
    QAreaCultivarCons.Close;
    if Trim(EDSafra.Text) <> ''  then
    begin
      QAreaCultivarCons.close;
      QAreaCultivarCons.SetVariable('COD_PLANTIO_SAFRA',Trim(EDSafra.Text));
      QAreaCultivarCons.Open;
    end;
  end;
end;
procedure TFAreaCultivarCons.EDSafraExit(Sender: TObject);
begin
  inherited;
  if Trim(EDSafra.Text) <> '' then
  begin
    MEDesc_Safra.Text:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA','COD_PLANTIO_SAFRA ='+Trim(EDSafra.Text));
  end;
end;

end.
