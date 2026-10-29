unit UFmTributacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmTributacao = class(TFrame)
    Label1: TLabel;
    MeTributacao: TMaskEdit;
    BtTributacao: TBitBtn;
    EdTributacao: TEdit;
    procedure BtTributacaoClick(Sender: TObject);
    procedure MeTributacaoExit(Sender: TObject);
    procedure MeTributacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UTributacaoCons, UTributacao_cl, UOracle_cl;

{$R *.dfm}

procedure TFmTributacao.BtTributacaoClick(Sender: TObject);
begin
  if FTributacaoCons = Nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal = MrOk then
  begin
    MeTributacao.Text := DMTributacao.QTributacaoConsCOD_TRIBUTACAO.Text;
    MeTributacaoExit(Self);
  end;
end;

procedure TFmTributacao.MeTributacaoExit(Sender: TObject);
begin
  if Trim(MeTributacao.Text) <> '' then
    EdTributacao.Text := DMOracle.BuscaNome('SELECT DESC_TRIBUTACAO FROM TB_TRIBUTACAO','COD_TRIBUTACAO = ' +
                           MeTributacao.Text, true)
  else
    EdTributacao.Text := 'Todas';
end;

procedure TFmTributacao.MeTributacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtTributacao.Click;
end;

end.
