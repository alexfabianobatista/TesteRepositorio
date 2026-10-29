unit UFmCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmCidade = class(TFrame)
    Label1: TLabel;
    MeCidade: TMaskEdit;
    BtCidade: TBitBtn;
    EdCidade: TEdit;
    procedure BtCidadeClick(Sender: TObject);
    procedure MeCidadeExit(Sender: TObject);
    procedure MeCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UCidadeCons, UCidade_cl, UOracle_cl;

{$R *.dfm}

procedure TFmCidade.BtCidadeClick(Sender: TObject);
begin
  if FCidadeCons = Nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.ShowModal = MrOk then
  begin
    MeCidade.Text := DMCidade.QCidadeConsCOD_CIDADE.Text;
    MeCidadeExit(Self);
  end;
end;

procedure TFmCidade.MeCidadeExit(Sender: TObject);
begin
  if Trim(MeCidade.Text) <> '' then
    EdCidade.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE','COD_CIDADE = ' +
                           MeCidade.Text, true)
  else
    EdCidade.Text := 'Todas';
end;

procedure TFmCidade.MeCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtCidade.Click;
end;

end.
