unit UReducaoZCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Grids, DBGrids, UFmDatas, Buttons;

type
  TFReducaoZCad = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DBLCImpressora: TDBLookupComboBox;
    FmDatas1: TFmDatas;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    BtListar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure DBLCImpressoraCloseUp(Sender: TObject);
    procedure BtListarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReducaoZCad: TFReducaoZCad;

implementation

uses UImpressoraFiscal_cl, ULivroFiscal_Cl, UOracle_cl;

{$R *.dfm}

procedure TFReducaoZCad.FormCreate(Sender: TObject);
var wDia,wMes,wAno: Word;
begin
  DecodeDate(DMOracle.DataServ,wAno,wMes,wDia);
  FmDatas1.MeDtInicial.Text := '01/'+ FormatFloat('00',wMes)+'/'+IntToStr(wAno);
  FmDatas1.MeDtFinal.Text := DateToStr(DMOracle.DataServ);
  DMImpressoraFiscal.QECFCons.Close;
  DMImpressoraFiscal.QECFCons.Open;
end;

procedure TFReducaoZCad.DBLCImpressoraCloseUp(Sender: TObject);
begin
  with DMImpressoraFiscal,DMLivroFiscal do
  begin
    QECFCons.Close;
    QECFCons.Open;
    if QECFCons.RecordCount > 0 then
    begin
      QReducaoZCons.Close;
      QReducaoZCons.SetVariable('NUM_SERIE',Trim(QECFConsNUM_SERIE.Value));
      QReducaoZCons.SetVariable('DT_INI',Trim(FmDatas1.MeDtInicial.Text));
      QReducaoZCons.SetVariable('DT_FIN',Trim(FmDatas1.MeDtFinal.Text));
      QReducaoZCons.Open;
    end;
  end;
end;

procedure TFReducaoZCad.BtListarClick(Sender: TObject);
begin
  DBLCImpressoraCloseUp(self);
end;

end.
