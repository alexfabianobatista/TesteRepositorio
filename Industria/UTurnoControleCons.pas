unit UTurnoControleCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFTurnoControleCons = class(TFTConsulta)
    BtConsFilial: TBitBtn;
    Label2: TLabel;
    MEDataI: TMaskEdit;
    MEDataF: TMaskEdit;
    Label3: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTurnoControleCons: TFTurnoControleCons;

implementation

uses UTurno_cl, UTurnoCons;

{$R *.DFM}

procedure TFTurnoControleCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMTurno do
  Begin
    QTurnoControleCons.Close;
    QTurnoControleCons.SetVariable('DATA_I',StrToDate(MEDataI.Text));
    QTurnoControleCons.SetVariable('DATA_F',StrToDate(MEDataF.Text));
    If Trim(METexto.Text) = '' Then
      QTurnoControleCons.SetVariable('TURNO',Null)
    Else
      QTurnoControleCons.SetVariable('TURNO',METexto.Text);

    QTurnoControleCons.Open;
  End;
end;

procedure TFTurnoControleCons.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FTurnoCons = Nil then
    FTurnoCons := TFTurnoCons.Create(Application);
  If FTurnoCons.ShowModal = mrOk then
    METexto.Text := DMTurno.QTurnoAllCod_Turno.Text;
end;

procedure TFTurnoControleCons.FormCreate(Sender: TObject);
begin
  inherited;
  MEDataI.Text := DateToStr(Date-30);
  MEDataF.Text := DateToStr(Date);
end;

end.
