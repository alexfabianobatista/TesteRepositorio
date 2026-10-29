unit UContratoCancela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFContratoCancela = class(TForm)
    MEMotivo: TMaskEdit;
    Label22: TLabel;
    BtConsMotivo: TBitBtn;
    BitBtn2: TBitBtn;
    BtOk: TBitBtn;
    EdMotivo: TEdit;
    procedure BtConsMotivoClick(Sender: TObject);
    procedure MEMotivoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoCancela: TFContratoCancela;

implementation

uses UMotivoCons, UMotivo_cl, UOracle_cl;

{$R *.DFM}

procedure TFContratoCancela.BtConsMotivoClick(Sender: TObject);
begin
  If FMotivoCons = Nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  If FMotivoCons.ShowModal = mrOk then
  Begin
    MEMotivo.Text := DMMotivo.QMotivoConsCod_Motivo.Text;
    MEMotivoExit(Self);
  End;

end;

procedure TFContratoCancela.MEMotivoExit(Sender: TObject);
begin
  If Trim(MEMotivo.Text) <> '' Then
     EdMotivo.Text := DMOracle.BuscaNome('SELECT DESC_MOTIVO FROM TB_MOTIVO','COD_MOTIVO = '+Trim(MeMotivo.Text));
end;

end.
