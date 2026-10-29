unit UFmMensagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmMensagem = class(TFrame)
    Label1: TLabel;
    MeMensagem: TMaskEdit;
    BtMensagem: TBitBtn;
    EdMensagem: TEdit;
    procedure MeMensagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtMensagemClick(Sender: TObject);
    procedure MeMensagemExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UMensagemCons, UMensagem_cl, UOracle_cl;

{$R *.dfm}

procedure TFmMensagem.MeMensagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
    BtMensagem.Click;
end;

procedure TFmMensagem.BtMensagemClick(Sender: TObject);
begin
  if FMensagemCons = nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  if FMensagemCons.ShowModal = MrOk then
  begin
    MeMensagem.Text := DMMensagem.QMensagemConsCOD_MENSAGEM.Text;
    MeMensagemExit(Self);
  end;
end;

procedure TFmMensagem.MeMensagemExit(Sender: TObject);
begin
  if Trim(MeMensagem.Text) <> '' then
    EdMensagem.Text := DMOracle.FastSelect('DESC_MENSAGEM', 'TB_MENSAGEM', 'COD_MENSAGEM = ' + MeMensagem.Text)
  else
    EdMensagem.Text := 'Todas';
end;

end.
