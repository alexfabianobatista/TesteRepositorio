unit UCupomFiscalParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, DBCtrls,
  UFmDatas, Mask, ActnList;

type
  TFCupomFiscalParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Fm1Datas: TFmDatas;
    Label1: TLabel;
    Label2: TLabel;
    Me1Cupom: TMaskEdit;
    db1NumSerieECF: TDBLookupComboBox;
    TabSheet2: TTabSheet;
    leNome: TLabeledEdit;
    leEndereco: TLabeledEdit;
    leNumero: TLabeledEdit;
    leCGCCPF: TLabeledEdit;
    ActionList1: TActionList;
    Action1: TAction;
    procedure db1NumSerieECFDropDown(Sender: TObject);
    procedure leCGCCPFExit(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations } 
  end;

var
  FCupomFiscalParam: TFCupomFiscalParam;

implementation

uses UImpressoraFiscal_cl, UImpressoraFiscal, MaskUtils, UBiblioteca;

{$R *.dfm}

procedure TFCupomFiscalParam.db1NumSerieECFDropDown(Sender: TObject);
var wNumSerie: String;
begin
  inherited;
  DMImpressoraFiscal.QECFCons.Close;
  DMImpressoraFiscal.QECFCons.Open;  
end;

procedure TFCupomFiscalParam.leCGCCPFExit(Sender: TObject);
begin
  inherited;
  if leCGCCPF.Text <> '' then
  begin
    if not (Length(
      bib.LimpaString(
      bib.LimpaString(
      bib.LimpaString(leCGCCPF.Text,'.'),
      '-'),
      '/')) in [11,14]) then
    begin
      MessageDlg('Dados inválidos',mtError,[mbOk],0);
      leCGCCPF.SetFocus;
      Abort;
    end;
    if Length(bib.LimpaString(
      bib.LimpaString(
      bib.LimpaString(leCGCCPF.Text,'.'),
      '-'),
      '/')) = 14 then //cnpj
    begin
      if not bib.ValidaCGC(bib.LimpaString(
        bib.LimpaString(
        bib.LimpaString(leCGCCPF.Text,'.'),
        '-'),
        '/')) then
      begin
        MessageDlg('CNPJ inválido',mtError,[mbOk],0);
        leCGCCPF.SetFocus;
        Abort;
      end;
      leCGCCPF.Text := FormatMaskText('00.000.000/0000-00;0;_',
        bib.LimpaString(
      bib.LimpaString(
      bib.LimpaString(leCGCCPF.Text,'.'),
      '-'),
      '/'));
    end;
    if Length(bib.LimpaString(
      bib.LimpaString(
      bib.LimpaString(leCGCCPF.Text,'.'),
      '-'),
      '/')) = 11 then //cpf
    begin
      if not bib.ValidaCPF(bib.LimpaString(
        bib.LimpaString(
        bib.LimpaString(leCGCCPF.Text,'.'),
        '-'),
        '/')) then
      begin
        MessageDlg('CPF inválido',mtError,[mbOk],0);
        leCGCCPF.SetFocus;
        Abort;
      end;
      leCGCCPF.Text := FormatMaskText('000.000.000-00;0;_',
        bib.LimpaString(
      bib.LimpaString(
      bib.LimpaString(leCGCCPF.Text,'.'),
      '-'),
      '/'));
    end;
  end;
end;

procedure TFCupomFiscalParam.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFCupomFiscalParam.TabSheet2Show(Sender: TObject);
begin
  inherited;
  leCGCCPF.SetFocus;
end;

end.
