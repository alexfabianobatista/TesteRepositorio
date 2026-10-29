unit UFmConvenio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmConvenio = class(TFrame)
    LblConvenio: TLabel;
    MeConvenio: TMaskEdit;
    BtConvenio: TBitBtn;
    EdConvenio: TEdit;
    procedure MeConvenioExit(Sender: TObject);
    procedure MeConvenioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtConvenioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UConvenioCons, UConvenio_cl;

{$R *.dfm}

procedure TFmConvenio.MeConvenioExit(Sender: TObject);
begin
  if Trim(MeConvenio.text)<>'' then
    EdConvenio.text:=DMOracle.BuscaNome('SELECT DESC_CONVENIO FROM TB_CONVENIO','COD_CONVENIO = '+ MeConvenio.text)
  else
    EdConvenio.Text := 'Todos';
end;

procedure TFmConvenio.MeConvenioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
    BtConvenio.Click;
end;

procedure TFmConvenio.BtConvenioClick(Sender: TObject);
begin
  if FConvenioCons = Nil then
    FConvenioCons:=TFConvenioCons.Create(Application);
  if FConvenioCons.ShowModal = mrOk then
  begin
    MeConvenio.text:=DMConvenio.QConvenioConsCOD_CONVENIO.text;
    MeConvenioExit(Self);
  end;
end;

end.
