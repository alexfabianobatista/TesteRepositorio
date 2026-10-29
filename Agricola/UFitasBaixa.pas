unit UFitasBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Grids, DBGrids, Mask;

type
  TFFitasBaixa = class(TForm)
    DBGrid1: TDBGrid;
    LbBaixas: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DsFitasBaixa: TDataSource;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    MeTotal: TMaskEdit;
    BitBtn5: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFitasBaixa: TFFitasBaixa;

implementation

uses URomaneioAgricola_cl,UBiblioteca;

{$R *.DFM}

procedure TFFitasBaixa.BitBtn3Click(Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                             ';
begin
    wAux := Trim(DMRomaneioAgricola.QFitas_CobrancaCod_Romaneio_Fitas.Text);
    wLinha := Copy(wBranco,1,6-Length(waux)) + wAux;
    wAux := FormatFloat('###,###,##0.00',DMRomaneioAgricola.QFitas_CobrancaVal_Varejo.Value);
    wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    LbBaixas.Items.Add(wLinha);
    MeTotal.Text := FloatToStr(StrToFloat(MeTotal.Text) + DMRomaneioAgricola.QFitas_CobrancaVal_Varejo.Value);
end;

procedure TFFitasBaixa.BitBtn4Click(Sender: TObject);
Var wAux : String;
begin
  wAux := Copy(LbBaixas.Items[LbBaixas.ItemIndex],7,15);
  wAux := Bib.LimpaString(wAux,'.');
  MeTotal.Text := FloatToStr(StrToFloat(MeTotal.Text) - StrToFloat(Trim(wAux)));
  LbBaixas.Items.Delete(LbBaixas.ItemIndex);
end;

procedure TFFitasBaixa.FormActivate(Sender: TObject);
begin
  LbBaixas.Clear;
  MeTotal.Text := '0';
end;

procedure TFFitasBaixa.BitBtn5Click(Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                             ';
begin
  DMRomaneioAgricola.QFitas_Cobranca.First;
  While Not(DMRomaneioAgricola.QFitas_Cobranca.Eof) Do
  Begin
    wAux := Trim(DMRomaneioAgricola.QFitas_CobrancaCod_Romaneio_Fitas.Text);
    wLinha := Copy(wBranco,1,6-Length(waux)) + wAux;
    wAux := FormatFloat('###,###,##0.00',DMRomaneioAgricola.QFitas_CobrancaVal_Varejo.Value);
    wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    LbBaixas.Items.Add(wLinha);
    MeTotal.Text := FloatToStr(StrToFloat(MeTotal.Text) + DMRomaneioAgricola.QFitas_CobrancaVal_Varejo.Value);
    DMRomaneioAgricola.QFitas_Cobranca.Next;
  End;
end;

End.