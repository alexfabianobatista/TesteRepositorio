unit UFmNfeLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmNfeLote = class(TFrame)
    MeCodigo: TMaskEdit;
    BtConsulta: TBitBtn;
    EdDescricao: TEdit;
    Label1: TLabel;
    procedure BtConsultaClick(Sender: TObject);
    procedure MeCodigoExit(Sender: TObject);
    procedure MeCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UNfEletronicaLote_cl;

{$R *.dfm}

procedure TFmNfeLote.BtConsultaClick(Sender: TObject);
var
  MeuForm: TForm;
begin
  MeuForm := TFormClass(GetClass('TFNfEletronicaLoteCons')).Create(Application);
  if MeuForm.ShowModal = MrOk then
  begin
    MeCodigo.Text := DMNfEletronicaLote.QNfeLoteConsID_LOTE.Text;
    MeCodigoExit(Self);
  end;
  MeuForm.Free;
end;

procedure TFmNfeLote.MeCodigoExit(Sender: TObject);
begin
  if Trim(MeCodigo.Text) <> '' then
    EdDescricao.Text := DMOracle.FastSelect('DT_CRIACAO', 'TB_NF_ELETRONICA_LOTE',
      'ID_LOTE = ' + MeCodigo.Text, True)
  else
    EdDescricao.Text := '';
end;

procedure TFmNfeLote.MeCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 123 then //123 = F12
    BtConsulta.Click;
end;

end.

