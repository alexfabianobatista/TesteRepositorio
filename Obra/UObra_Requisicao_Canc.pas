unit UObra_Requisicao_Canc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, Buttons, Db;

type
  TFObra_Requisicao_Canc = class(TForm)
    Label22: TLabel;
    BtConsMotivo: TBitBtn;
    EdMotivo: TEdit;
    MEMotivo: TMaskEdit;
    BtOk: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BtOkClick(Sender: TObject);
    procedure MEMotivoExit(Sender: TObject);
    procedure BtConsMotivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObra_Requisicao_Canc: TFObra_Requisicao_Canc;

implementation

uses UObra_cl, UOracle_cl, UMotivoCons, UMotivo_cl;

{$R *.DFM}

procedure TFObra_Requisicao_Canc.BtOkClick(Sender: TObject);
begin
  if Trim(MeMotivo.Text) = '' then
  begin
    MessageDlg('Motivo não informado!',mtInformation,[mbOk],0);
    ModalResult := mrNone;
  end
  else
  With DMObra do
  Begin
    Try
      DMOracle.DBCemapa.StartTransaction;
      QObra_Req_Cab.Edit;
      QObra_Req_CabInd_Situacao.Value := '3';
      QObra_Req_CabCod_Motivo.Value := StrToInt(Trim(MEMotivo.Text));
      QObra_Req_Cab.Post;
      DMOracle.DBCemapa.Commit;
      QObra_Req_Cab.Close;
      QObra_Req_Cab.Open;
    except
      if QObra_Req_Cab.State <> dsBrowse then
         QObra_Req_Cab.Cancel;
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  End;
end;

procedure TFObra_Requisicao_Canc.MEMotivoExit(Sender: TObject);
begin
  EdMotivo.Text := DMOracle.BuscaNome('SELECT DESC_MOTIVO FROM TB_MOTIVO','COD_MOTIVO = '+MEMotivo.Text);
end;

procedure TFObra_Requisicao_Canc.BtConsMotivoClick(Sender: TObject);
begin
  If FMotivoCons = Nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  If FMotivoCons.ShowModal = mrOk then
  Begin
    MeMotivo.Text := DMMotivo.QMotivoConsCod_Motivo.Text;
    MeMotivoExit(Self);
  End;
end;

end.
