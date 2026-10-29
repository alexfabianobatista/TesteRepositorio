unit UFmLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmLote = class(TFrame)
    Label1: TLabel;
    MeLote: TMaskEdit;
    BtLote: TBitBtn;
    EdLote: TEdit;
    procedure BtLoteClick(Sender: TObject);
    procedure MeLoteExit(Sender: TObject);
    procedure MeLoteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UTipoLoteCons, UTipoLote_cl, UOracle_cl;

{$R *.dfm}

procedure TFmLote.BtLoteClick(Sender: TObject);
begin
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
  begin
    MELote.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
    MEloteExit(self);
  end;
end;

procedure TFmLote.MeLoteExit(Sender: TObject);
begin
  If Trim(MELote.Text) <> '' Then
     EdLote.Text :=DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
                        'COD_LOTE_TIPO = '+MELote.text,True)
  Else
    EdLote.text := 'Todos';
end;

procedure TFmLote.MeLoteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtLote.Click;
end;

end.
