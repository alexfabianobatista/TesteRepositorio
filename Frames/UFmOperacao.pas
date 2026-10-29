unit UFmOperacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmOperacao = class(TFrame)
    Label1: TLabel;
    MeOperacao: TMaskEdit;
    BtOperacao: TBitBtn;
    EdOperacao: TEdit;
    procedure BtOperacaoClick(Sender: TObject);
    procedure MeOperacaoExit(Sender: TObject);
    procedure MeOperacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOperacaoCons, UOperacao_cl, UOracle_cl;

{$R *.dfm}

procedure TFmOperacao.BtOperacaoClick(Sender: TObject);
begin
   if FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = MrOk then
  begin
    MeOperacao.Text := DMOperacao.QOperacaoConsCOD_OPERACAO.Text;
    MeOperacaoExit(Self);
  end;
end;

procedure TFmOperacao.MeOperacaoExit(Sender: TObject);
begin
  if Trim(MeOperacao.Text) <> '' then
    EdOperacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = ' + MeOperacao.Text, true)
  else
    EdOperacao.Text := 'Todas';
end;

procedure TFmOperacao.MeOperacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtOperacao.Click;
end;

end.
