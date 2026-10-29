unit UNFCeParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, DBCtrls,
  Mask;

type
  TFNFCeParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    leCGCCPF: TComboBox;
    Label1: TLabel;
    leNome: TLabeledEdit;
    BtAborta: TBitBtn;
    procedure leCGCCPFExit(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations } 
  end;

var
  FNFCeParam: TFNFCeParam;

implementation

uses MaskUtils, UBiblioteca, UOracle_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFNFCeParam.leCGCCPFExit(Sender: TObject);
var
  wNome: String;
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
    wNome := DMOracle.BuscaNome('SELECT NOME FROM TB_NOME_NOTA','DESC_CGC_CPF = '+QuotedStr( leCGCCPF.Text),false);
    leNome.Text := wNome;
    if wNome = '' then
      leNome.SetFocus
    else
      BtOk.SetFocus;
  end;
end;

procedure TFNFCeParam.BtOkClick(Sender: TObject);
begin
  inherited;
  if (Trim(leCGCCPF.Text) = '') then
  begin
    leCGCCPF.SetFocus;
    raise Exception.Create('Preencha o campo CPF!');
  end;
  if (Trim(leNome.Text) = '') and (DMParamSistema.CodEmpresa = 'BAZAR') then
  begin
    leNome.SetFocus;
    raise Exception.Create('Preencha o campo Nome!');
  end;
  ModalResult := MrOk;
end;

procedure TFNFCeParam.FormActivate(Sender: TObject);
begin
  inherited;
  leCGCCPF.SetFocus;
end;

end.
