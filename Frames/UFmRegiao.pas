unit UFmRegiao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmRegiao = class(TFrame)
    Label1: TLabel;
    MeRegiao: TMaskEdit;
    BtRegiao: TBitBtn;
    EdRegiao: TEdit;
    procedure BtRegiaoClick(Sender: TObject);
    procedure MeRegiaoExit(Sender: TObject);
    procedure MeRegiaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses URegiaoCons, URegiao_cl, UOracle_cl;

{$R *.dfm}

procedure TFmRegiao.BtRegiaoClick(Sender: TObject);
begin
  if FRegiaoCons = Nil then
    FRegiaoCons := TFRegiaoCons.Create(Application);
  if FRegiaoCons.ShowModal = MrOk then
  begin
    MeRegiao.Text := DMRegiao.QRegiaoConsCOD_REGIAO.Text;
    MeRegiaoExit(Self);
  end;
end;

procedure TFmRegiao.MeRegiaoExit(Sender: TObject);
begin
  if Trim(MeRegiao.Text) <> '' then
    EdRegiao.Text := DMOracle.BuscaNome('SELECT DESC_REGIAO FROM TB_REGIAO','COD_REGIAO = ' + MeRegiao.Text, true)
  else
    EdRegiao.Text := 'Todos';
end;

procedure TFmRegiao.MeRegiaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtRegiao.Click;
end;

end.
