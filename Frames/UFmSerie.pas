unit UFmSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmSerie = class(TFrame)
    Label1: TLabel;
    MeSerie: TMaskEdit;
    BtSerie: TBitBtn;
    EdSerie: TEdit;
    procedure BtSerieClick(Sender: TObject);
    procedure MeSerieExit(Sender: TObject);
    procedure MeSerieKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  protected
    FFilial: Integer;
  public
    property Filial: Integer read FFilial write FFilial;
  end;

implementation

uses USerieCons, USerie_cl, UOracle_cl;

{$R *.dfm}

procedure TFmSerie.BtSerieClick(Sender: TObject);
begin
  if FSerieCons = nil then
    FSerieCons := TFSerieCons.Create(Application);
  if FSerieCons.ShowModal = mrOk then
    MESerie.Text := DMSerie.QSerieConsCod_Serie.Text;
  MESerieExit(Self);
end;

procedure TFmSerie.MeSerieExit(Sender: TObject);
begin
  EdSerie.Text := '';
  if (Trim(MESerie.Text) <> '') then
  begin
    EdSerie.Text := 'Próximo número: ' + DMOracle.FastSelect('NUM_SERIE + 1',
        'TB_SERIE', 'COD_FILIAL = ' + IntToStr(Filial) + ' AND ' +
        'COD_SERIE = ' + QuotedStr(Trim(MESerie.Text)));
  end
  else
    EdSerie.Text := 'Todas';
end;

procedure TFmSerie.MeSerieKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 123 then //123 = F12
    BtSerie.Click;
end;

end.

