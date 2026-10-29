unit UFmMarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmMarca = class(TFrame)
    Label1: TLabel;
    MeMarca: TMaskEdit;
    BtMarca: TBitBtn;
    EdMarca: TEdit;
    procedure BtMarcaClick(Sender: TObject);
    procedure MeMarcaExit(Sender: TObject);
    procedure MeMarcaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UMarca_cl, UOracle_cl, UMarcaCons;

{$R *.dfm}

procedure TFmMarca.BtMarcaClick(Sender: TObject);
begin
  if FMarca_Cons = Nil then
    FMarca_Cons := TFMarca_Cons.Create(Application);
  if FMarca_Cons.ShowModal = MrOk then
  begin
    MeMarca.Text := DMMarca.QMarcaConsCOD_MARCA.Text;
    MeMarcaExit(Self);
  end;
end;

procedure TFmMarca.MeMarcaExit(Sender: TObject);
begin
  if Trim(MeMarca.Text) <> '' then
    EdMarca.Text := DMOracle.BuscaNome('SELECT DESC_MARCA FROM TB_MARCA','COD_MARCA = ' + MeMarca.Text, True)
  else
    EdMarca.Text := 'Todas';
end;

procedure TFmMarca.MeMarcaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtMarca.Click;
end;

end.
