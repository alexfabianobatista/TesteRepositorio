unit UProducaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFProducaoCons = class(TFTConsulta)
    Label2: TLabel;
    Label3: TLabel;
    MeDataI: TMaskEdit;
    MeDataF: TMaskEdit;
    METurno: TMaskEdit;
    BtConsFilial: TBitBtn;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProducaoCons: TFProducaoCons;

implementation

uses UBoletim_cl, UTurnoCons, UTurno_cl;

{$R *.DFM}

procedure TFProducaoCons.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FTurnoCons = Nil then
    FTurnoCons := TFTurnoCons.Create(Application);
  If FTurnoCons.ShowModal = mrOk then
    METurno.Text := DMTurno.QTurnoAllCod_Turno.Text;

end;

procedure TFProducaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMBoletim do
  Begin
    QProducaoCons.Close;
    QProducaoCons.SetVariable('DATA_I',StrToDate(MEDataI.Text));
    QProducaoCons.SetVariable('DATA_F',StrToDate(MEDataF.Text));
    If Trim(METexto.Text) = '' then
      QProducaoCons.SetVariable('FILIAL',Null)
    Else
      QProducaoCons.SetVariable('FILIAL',METexto.Text);
    If Trim(METurno.Text) = '' then
      QProducaoCons.SetVariable('TURNO',Null)
    Else
      QProducaoCons.SetVariable('TURNO',METurno.Text);

    QProducaoCons.Open;
  End;

end;

end.
