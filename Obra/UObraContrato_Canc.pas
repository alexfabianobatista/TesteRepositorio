unit UObraContrato_Canc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, Buttons, Db;

type
  TFObraContrato_Canc = class(TForm)
    Label22: TLabel;
    BtConsMotivo: TBitBtn;
    EdMotivo: TEdit;
    MEMotivo: TMaskEdit;
    BtOk: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BtOkClick(Sender: TObject);
    procedure BtConsMotivoClick(Sender: TObject);
    procedure MEMotivoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObraContrato_Canc: TFObraContrato_Canc;

implementation

uses UObraContrato_cl, UOracle_cl, UMotivoCons, UMotivo_cl;

{$R *.DFM}

procedure TFObraContrato_Canc.BtOkClick(Sender: TObject);
begin
  if Trim(MeMotivo.Text) = '' then
  begin
    MessageDlg('Motivo não informado!',mtInformation,[mbOk],0);
    ModalResult := mrNone;
  end
  else
  With DMObraContrato do
  Begin
    Try
      DMOracle.DBCemapa.StartTransaction;
      QObraContrato_Cad.Edit;
      QObraContrato_CadInd_Situacao.Value := '3';
      QObraContrato_CadCod_Motivo.Value := StrToInt(Trim(MEMotivo.Text));
      QObraContrato_Cad.Post;
      DMOracle.DBCemapa.Commit;
      QObraContrato_Cad.Close;
      QObraContrato_Cad.Open;
    except
      if QObraContrato_Cad.State <> dsBrowse then
         QObraContrato_Cad.Cancel;
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  End;

end;

procedure TFObraContrato_Canc.BtConsMotivoClick(Sender: TObject);
begin
  If FMotivoCons = Nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  If FMotivoCons.ShowModal = mrOk then
  Begin
    MeMotivo.Text := DMMotivo.QMotivoConsCod_Motivo.Text;
    MeMotivoExit(Self);
  End;

end;

procedure TFObraContrato_Canc.MEMotivoExit(Sender: TObject);
begin
  EdMotivo.Text := DMOracle.BuscaNome('SELECT DESC_MOTIVO FROM TB_MOTIVO','COD_MOTIVO = '+MEMotivo.Text);
end;

end.
