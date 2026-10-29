unit UFmCultura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmCultura = class(TFrame)
    Label1: TLabel;
    MeCultura: TMaskEdit;
    BtCultura: TBitBtn;
    EdCultura: TEdit;
    procedure BtCulturaClick(Sender: TObject);
    procedure MeCulturaExit(Sender: TObject);
    procedure MeCulturaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UCulturaCons, UOracle_cl, UCultura_cl;

{$R *.dfm}

procedure TFmCultura.BtCulturaClick(Sender: TObject);
begin
  If FCulturaCons = Nil then
    FCulturaCons := TFCulturaCons.Create(Application);
  If FCulturaCons.ShowModal = mrOk then
    MeCultura.Text := DMCultura.QCulturaConsCOD_CULTURA.Text;
    MECulturaExit(self);
end;

procedure TFmCultura.MeCulturaExit(Sender: TObject);
begin
  If Trim(MeCultura.Text) <> '' Then
    EdCultura.text:=DMOracle.BuscaNome('SELECT DESC_CULTURA FROM TB_CULTURA',
                    'COD_CULTURA = '+MeCultura.text)
  Else
    EdCultura.Text := 'Todas';
end;

procedure TFmCultura.MeCulturaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtCultura.Click;
end;

end.
