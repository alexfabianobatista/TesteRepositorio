unit UFmComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmComissao = class(TFrame)
    MeComissao: TMaskEdit;
    BtComissao: TBitBtn;
    EdComissao: TEdit;
    Label1: TLabel;
    procedure BtComissaoClick(Sender: TObject);
    procedure MeComissaoExit(Sender: TObject);
    procedure MeComissaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UComissaoCons, UComissao_cl, UOracle_cl;

{$R *.dfm}

procedure TFmComissao.BtComissaoClick(Sender: TObject);
begin
  if FComissaoCons = nil then
    FComissaoCons := TFComissaoCons.Create(Application);
  if FComissaoCons.ShowModal = MrOk then
  begin
    MeComissao.Text := DMComissao.QComissaoConsCOD_COMISSAO.Text;
    MeComissaoExit(Self);
  end;
end;

procedure TFmComissao.MeComissaoExit(Sender: TObject);
begin
  if Trim(MeComissao.Text) <> '' then
    EdComissao.Text := DMOracle.BuscaNome('SELECT DESC_COMISSAO FROM TB_Comissao', 'COD_COMISSAO = ' + MeComissao.Text, true)
  else
    EdComissao.Text := 'Todas';
end;

procedure TFmComissao.MeComissaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 123 then //123 = F12
    BtComissao.Click;
end;

end.

